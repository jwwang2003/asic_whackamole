`default_nettype none
`include "defines.vh"

module top (
    input  wire       clk,    // System clock
    input  wire       rstn,   // Active‐low synchronous reset
    output wire [6:0] seg,    // Seven‐segment outputs {a,b,c,d,e,f,g}, active‐high
    output wire       trigger
);

    //========================================================================
    // 1) Instantiate the LFSR‐based PRNG (hard‐coded INIT_SEED = 8'hA5)
    //========================================================================
    wire [7:0] random;
    lfsr_prng #(
        .INIT_SEED(8'hA5)
    ) prng_inst (
        .clk    (clk),
        .rst    (~rstn),
        .random (random)
    );

    // Only the lower 3 bits of 'random' are needed (0..7)
    wire [2:0] rnd_num = random[2:0];


    //========================================================================
    // 2) Instantiate the Unique‐Number Selector
    //========================================================================
    reg         req;
    wire [2:0]  selected_number;
    wire        done;
    wire        all_selected;

    assign trigger = all_selected;

    unique_selector unique_inst (
        .clk             (clk),
        .rst             (~rstn),
        .req             (req),
        .rnd_num         (rnd_num),
        .selected_number (selected_number),
        .done            (done),
        .all_selected    (all_selected)
    );


    //========================================================================
    // 3) One‐Second Timer / FSM
    //========================================================================
    localparam [1:0]
        WAIT_REQ    = 2'b00,
        WAIT_DONE   = 2'b01,
        WAIT_PERIOD = 2'b10,
        STOP        = 2'b11;

    reg [1:0]  state;
    reg [31:0] sec_cnt;

    always @(posedge clk) begin
        if (~rstn) begin
            state   <= WAIT_REQ;
            req     <= 1'b0;
            sec_cnt <= 32'd0;
        end else begin
            case (state)
                WAIT_REQ: begin
                    sec_cnt <= 32'd0;
                    if (!all_selected) begin
                        req   <= 1'b1;
                        state <= WAIT_DONE;
                    end else begin
                        req   <= 1'b0;
                        state <= STOP;
                    end
                end

                WAIT_DONE: begin
                    req <= 1'b0;
                    if (done) begin
                        sec_cnt <= 32'd0;
                        state   <= WAIT_PERIOD;
                    end
                end

                WAIT_PERIOD: begin
                    if (sec_cnt < (`CLK_FREQ - 1)) begin
                        sec_cnt <= sec_cnt + 1;
                    end else begin
                        sec_cnt <= 32'd0;
                        state   <= WAIT_REQ;
                    end
                end

                STOP: begin
                    req     <= 1'b0;
                    sec_cnt <= 32'd0;
                    state   <= STOP;
                end

                default: begin
                    req     <= 1'b0;
                    sec_cnt <= 32'd0;
                    state   <= WAIT_REQ;
                end
            endcase
        end
    end

    //========================================================================
    // 4) Seven‐Segment Display
    //========================================================================
    wire [3:0] digit4b = {1'b0, selected_number};
    seven_seg seg_driver (
        .hex  (digit4b),
        .seg  (seg)
    );

endmodule
