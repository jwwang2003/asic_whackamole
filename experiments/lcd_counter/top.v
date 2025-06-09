`timescale 1ns/1ps
`include "defines.vh"

module top (
    input  wire        clk,      // System clock (must match `CLK_FREQ` in defines.vh)
    input  wire        rst_n,    // Active‐low reset
    output wire [6:0]  seg,      // Seven‐segment outputs {a,b,c,d,e,f,g}, active HIGH
    output wire [3:0]  digit_en  // Digit enable lines for 4-digit display (active LOW)
);

    //==========================================================================
    // 1) Parameters / Localparams
    //==========================================================================
    // Generate one “tick” every 100 ms:
    //   Since `CLK_FREQ` is in Hz, 100 ms = CLK_FREQ/10 clock cycles.
    localparam integer TICKS_100MS = `CLK_FREQ / 10;

    //==========================================================================
    // 2) Registers / Wires
    //==========================================================================
    reg [12:0] ms_cnt;         // Enough bits to count up to TICKS_100MS (e.g. 5000 for CLK_FREQ=50_000)
    reg [15:0] counter_reg;    // 16-bit counter (hex digits 0x0000 → 0xFFFF)

    //==========================================================================
    // 3) 100 ms Tick Generator + Counter Logic
    //==========================================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ms_cnt      <= 13'd0;
            counter_reg <= 16'd0;
        end else begin
            if (ms_cnt >= TICKS_100MS - 1) begin
                ms_cnt      <= 13'd0;
                counter_reg <= counter_reg + 1;
            end else begin
                ms_cnt <= ms_cnt + 1;
            end
        end
    end

    //==========================================================================
    // 4) Four‐Digit Display Instantiation
    //    Drive “value” with our 16-bit counter_reg.  The four_digit_display module
    //    will slice it into 4 hex nibbles and multiplex at 100 Hz overall.
    //==========================================================================
    four_digit_display u_display (
        .clk       (clk),
        .value     (counter_reg),
        .seg       (seg),
        .digit_en  (digit_en)
    );

endmodule
