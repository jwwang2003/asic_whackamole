`default_nettype none
`include "defines.vh"

module interval_counter (
    input  wire        clk,        // System clock
    input  wire        rst_n,      // Active‐low synchronous reset
    input  wire [2:0]  interval,   // 0…7 seconds
    input  wire        dir,        // 1 = count up, 0 = count down
    output reg  [2:0]  count,      // Current count
    output reg         timeout     // One‐cycle pulse at terminal count
);

    // Width for the divider
    localparam integer DIV_W = $clog2(`CLK_FREQ);

    reg [DIV_W-1:0] div_cnt;
    reg             done;     // Latches when terminal count is reached

    // A “tick” every 1 Hz
    wire tick = (div_cnt == `CLK_FREQ-1);

    always @(posedge clk) begin
        if (!rst_n) begin
            // synchronous reset
            div_cnt <= 0;
            count   <= dir ? 3'd0   : interval;
            done    <= 1'b0;
            timeout <= 1'b0;
        end else begin
            // clock divider always runs
            div_cnt <= tick ? 0 : div_cnt + 1;

            // default: no timeout pulse
            timeout <= 1'b0;

            // only count (or generate timeout) if not already done
            if (!done && tick) begin
                // check terminal condition
                if (dir ? (count == interval) : (count == 0)) begin
                    timeout <= 1'b1;   // pulse
                    done    <= 1'b1;   // stop further counting
                end else begin
                    // advance up or down
                    count <= dir ? (count + 1) : (count - 1);
                end
            end
        end
    end

endmodule
