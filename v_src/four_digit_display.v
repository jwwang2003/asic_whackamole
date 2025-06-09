`default_nettype none

// Include the global defines (where `CLK_FREQ is defined as 50 000)
`include "defines.vh"


module four_digit_display #(
    // Use the `CLK_FREQ macro from defines.vh instead of a hardcoded literal
    parameter integer CLK_FREQ    = `CLK_FREQ,
    // How many times per second you want to refresh all 4 digits.
    // e.g. 1_000 means each digit is active 1 kHz/4 = 250 Hz
    parameter integer REFRESH_HZ  = 1_000
)(
    input  wire         clk,        // System clock
    input  wire         rst_n,      // Active‐low synchronous reset
    input  wire [15:0]  bcd_value,  // Four BCD digits: {digit3, digit2, digit1, digit0}
                                  // digit3 = most significant (leftmost) digit
    output reg  [6:0]   segments,   // Seven‐segment outputs {a,b,c,d,e,f,g}, active high
    output reg  [3:0]   digit_en    // Digit enables (active low for common‐cathode). Only one is low at a time.
);

    //-------------------------------------------------------------------------
    // 1) Calculate how many sys‐clock cycles per “digit‐time slot.”
    //    We want to cycle through 4 digits at REFRESH_HZ. That means the entire
    //    4‐digit scan must repeat REFRESH_HZ times per second, so each
    //    individual digit is active REFRESH_HZ/4 times per second.
    //
    //    Refresh period for all 4 digits = 1 / REFRESH_HZ seconds.
    //    Sys‐clocks per refresh = CLK_FREQ / REFRESH_HZ.
    //    We divide that by 4 to get clocks per digit‐enable period.
    //-------------------------------------------------------------------------

    localparam integer TOTAL_REFRESH_CNT = CLK_FREQ / REFRESH_HZ;
    localparam integer DIGIT_TIME_CNT    = TOTAL_REFRESH_CNT / 4;

    // How wide a counter to hold DIGIT_TIME_CNT−1?
    localparam integer CNT_WIDTH = $clog2(DIGIT_TIME_CNT);

    reg [CNT_WIDTH-1:0] refresh_cnt;
    reg [1:0]           current_digit;  // 0,1,2,3 cycles through the four digits

    //-------------------------------------------------------------------------
    // 2) Refresh Counter + Digit Selector
    //-------------------------------------------------------------------------

    always @(posedge clk) begin
        if (!rst_n) begin
            refresh_cnt   <= {CNT_WIDTH{1'b0}};
            current_digit <= 2'b00;
        end else begin
            if (refresh_cnt == DIGIT_TIME_CNT-1) begin
                refresh_cnt   <= {CNT_WIDTH{1'b0}};
                current_digit <= current_digit + 2'b01;
            end else begin
                refresh_cnt <= refresh_cnt + 1'b1;
            end
        end
    end

    //-------------------------------------------------------------------------
    // 3) Digit Enable Logic (active low for a common‐cathode display)
    //    Only one digit is driven at a time; the rest are off (high).
    //-------------------------------------------------------------------------

    always @(*) begin
        case (current_digit)
            2'd0: digit_en = 4'b1110; // Enable DIGIT0 (rightmost)
            2'd1: digit_en = 4'b1101; // Enable DIGIT1
            2'd2: digit_en = 4'b1011; // Enable DIGIT2
            2'd3: digit_en = 4'b0111; // Enable DIGIT3 (leftmost)
            default: digit_en = 4'b1111;
        endcase
    end

    //-------------------------------------------------------------------------
    // 4) Select the appropriate BCD nibble based on current_digit
    //    bcd_value[3:0]   → digit 0 (rightmost)
    //    bcd_value[7:4]   → digit 1
    //    bcd_value[11:8]  → digit 2
    //    bcd_value[15:12] → digit 3 (leftmost)
    //-------------------------------------------------------------------------

    reg [3:0] digit_nibble;
    always @(*) begin
        case (current_digit)
            2'd0: digit_nibble = bcd_value[3:0];
            2'd1: digit_nibble = bcd_value[7:4];
            2'd2: digit_nibble = bcd_value[11:8];
            2'd3: digit_nibble = bcd_value[15:12];
            default: digit_nibble = 4'hF;
        endcase
    end

    //-------------------------------------------------------------------------
    // 5) BCD → Seven‐Segment Decoder (active HIGH segments: a,b,c,d,e,f,g)
    //    We turn on the appropriate segments for 0–9. For invalid BCD (>9),
    //    we blank the digit (all segments off).
    //-------------------------------------------------------------------------

    always @(*) begin
        case (digit_nibble)
            4'd0: segments = 7'b1111110; // 0 → segments a,b,c,d,e,f ON, g OFF
            4'd1: segments = 7'b0110000; // 1 → segments b,c ON
            4'd2: segments = 7'b1101101; // 2 → a,b,d,e,g
            4'd3: segments = 7'b1111001; // 3 → a,b,c,d,g
            4'd4: segments = 7'b0110011; // 4 → b,c,f,g
            4'd5: segments = 7'b1011011; // 5 → a,c,d,f,g
            4'd6: segments = 7'b1011111; // 6 → a,c,d,e,f,g
            4'd7: segments = 7'b1110000; // 7 → a,b,c
            4'd8: segments = 7'b1111111; // 8 → a,b,c,d,e,f,g
            4'd9: segments = 7'b1111011; // 9 → a,b,c,d,f,g
            default: segments = 7'b0000000; // blank (for invalid BCD)
        endcase
    end

endmodule

`default_nettype wire
