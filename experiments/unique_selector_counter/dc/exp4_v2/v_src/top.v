`default_nettype none
`include "defines.vh"

module top (
    input  wire       clk,    // System clock
    input  wire       rst,    // Active‐high synchronous reset
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
        .rst    (rst),
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
        .rst             (rst),
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
        if (rst) begin
            state   <= WAIT_REQ;
            req     <= 1'b0;
            sec_cnt <= 32'd0;
        end else begin
            case (state)
                //------------------------------------------------------------
                WAIT_REQ: begin
                    if (!all_selected) begin
                        // Pulse req for exactly one cycle
                        req   <= 1'b1;
                        state <= WAIT_DONE;
                    end else begin
                        // If all have been selected, transition to STOP
                        req   <= 1'b0;
                        state <= STOP;
                    end
                end

                //------------------------------------------------------------
                WAIT_DONE: begin
                    // We only want 'req' high for one cycle
                    req <= 1'b0;

                    if (done) begin
                        // Unique selector has produced a new value
                        sec_cnt <= 32'd0;
                        state   <= WAIT_PERIOD;
                    end
                end

                //------------------------------------------------------------
                WAIT_PERIOD: begin
                    // Count clock cycles until reaching 1 second
                    if (sec_cnt < (`CLK_FREQ - 1)) begin
                        sec_cnt <= sec_cnt + 1;
                    end else begin
                        // One second has elapsed; request next random number
                        state <= WAIT_REQ;
                    end
                end

                //------------------------------------------------------------
                STOP: begin
                    // Once all 8 numbers are exhausted, stay here.
                    req   <= 1'b0;
                    state <= STOP;
                end

                default: begin
                    // Safety fallback
                    state <= WAIT_REQ;
                    req   <= 1'b0;
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
