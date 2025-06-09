`default_nettype none


module interval_counter #(
    parameter integer CLOCK_FREQ = 50_000  // your master clock (Hz)
)(
    input  wire       clk,        // master clock
    input  wire       rst_n,      // active-low sync reset
    input  wire [2:0] interval,   // 0…7 seconds
    input  wire       dir,        // 1 = up, 0 = down
    output reg  [2:0] count,      // current count
    output reg        timeout     // one-cycle pulse at terminal count
);

    // how many bits to hold CLOCK_FREQ-1?
    localparam integer DIV_W = $clog2(CLOCK_FREQ);
    reg [DIV_W-1:0] clk_div;

    // generate a 1 Hz “tick”
    wire one_hz = (clk_div == CLOCK_FREQ-1);

    // clock divider
    always @(posedge clk) begin
        if (!rst_n) begin
            clk_div <= {DIV_W{1'b0}};
        end else if (clk_div == CLOCK_FREQ-1) begin
            clk_div <= {DIV_W{1'b0}};
        end else begin
            clk_div <= clk_div + 1;
        end
    end

    // up/down counting with timeout
    always @(posedge clk) begin
        if (!rst_n) begin
            // on reset, choose a sensible start
            count   <= dir ? 3'd0 : interval;
            timeout <= 1'b0;
        end else if (one_hz) begin
            // at each 1 Hz tick…
            if (dir) begin
                // counting up
                if (count == interval) begin
                    timeout <= 1'b1;
                    count   <= 3'd0;
                end else begin
                    timeout <= 1'b0;
                    count   <= count + 1;
                end
            end else begin
                // counting down
                if (count == 3'd0) begin
                    timeout <= 1'b1;
                    count   <= interval;
                end else begin
                    timeout <= 1'b0;
                    count   <= count - 1;
                end
            end
        end
        // else begin
        //     // hold timeout low between ticks
        //     timeout <= 1'b0;
        // end
    end

endmodule

