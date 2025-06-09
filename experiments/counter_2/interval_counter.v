`default_nettype none


module interval_counter #(
    parameter integer CLOCK_FREQ = 50_000  // your master clock (Hz)
)(
    input  wire       clk,            // master clock
    input  wire       rst_n,          // active‐low synchronous reset
    input  wire [2:0] interval,       // 0…7 seconds
    input  wire       dir,            // 1 = count up, 0 = count down
    output reg  [2:0] count,          // current count
    output reg        timeout         // one‐cycle pulse at terminal count
);

    // how many bits are needed to hold (CLOCK_FREQ−1)?
    localparam integer DIV_W = $clog2(CLOCK_FREQ);

    // clock‐divider register
    reg [DIV_W-1:0] clk_div;

    // “finished” flag: goes high when we hit the terminal value.
    reg finished;

    // Generate a 1 Hz tick (true for exactly one clk cycle when clk_div == CLOCK_FREQ−1).
    wire one_hz = (clk_div == CLOCK_FREQ-1);

    //───────────────────────────────────────────────────────────────────────────
    // 1) Clock‐divider: produce a 1 Hz “tick”
    //───────────────────────────────────────────────────────────────────────────
    always @(posedge clk) begin
        if (!rst_n) begin
            clk_div <= {DIV_W{1'b0}};
        end else if (clk_div == CLOCK_FREQ-1) begin
            clk_div <= {DIV_W{1'b0}};
        end else begin
            clk_div <= clk_div + 1;
        end
    end

    //───────────────────────────────────────────────────────────────────────────
    // 2) Up/Down counter with finish behavior and external reset_signal
    //───────────────────────────────────────────────────────────────────────────
    always @(posedge clk) begin
        if (!rst_n) begin
            // on global reset, pick a sensible start‐value based on dir:
            count    <= (dir ? 3'd0 : interval);
            timeout  <= 1'b0;
            finished <= 1'b0;
        end else if (!finished && one_hz) begin
            // only count when not yet “finished” and on a 1 Hz tick:
            if (dir) begin
                // Counting up
                if (count == interval) begin
                    timeout  <= 1'b1;    // generate a one-cycle pulse
                    finished <= 1'b1;    // latch “finished” to stop further counting
                end else begin
                    timeout  <= 1'b0;
                    count    <= count + 1;
                end
            end else begin
                // Counting down
                if (count == 3'd0) begin
                    timeout  <= 1'b1;    // one‐cycle pulse at zero
                    finished <= 1'b1;    // latch “finished” to stop further counting
                end else begin
                    timeout  <= 1'b0;
                    count    <= count - 1;
                end
            end
        end else begin
            // When not on a 1 Hz tick, or if already “finished,” hold timeout low:
            timeout <= 1'b0;
            // count and finished remain unchanged if “finished”==1
        end
    end

endmodule
