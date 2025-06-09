//==========================================================
// four_digit_display.v
//  4‐digit multiplexed seven‐segment driver (0–F).
//
//  • Uses `seven_seg` internally.
//  • Expects `CLK_FREQ` to be defined externally (defaults to 50_000_000).
//  • Takes a 16‐bit input (4 hex nibbles).
//  • Scans at 100 Hz overall (so each digit is refreshed at 400 Hz).
//  • Outputs:
//      – seg[6:0]    : segment pattern for the active digit (active HIGH).
//      – digit_en[3:0]: digit enable lines (active LOW).
//
//----------------------------------------------------------
//  How it works:
//   1) The desired overall refresh rate is 100 Hz.
//   2) We have 4 digits => scan each at 100 Hz × 4 = 400 Hz.
//   3) scan_cnt_max = CLK_FREQ / (400).
//   4) A free‐running counter divides clk down to a 400 Hz tick.
//   5) On each tick, rotate through digit_idx = 0…3.
//   6) Select the corresponding 4‐bit nibble from 'value[15:0]'.
//   7) Drive `seven_seg` with that nibble.
//   8) Assert the matching digit_en line (active LOW).
//==========================================================

`include "defines.vh"

module four_digit_display (
    input  wire        clk,         // System clock (e.g. 50 MHz)
    input  wire [15:0] value,       // {hex3, hex2, hex1, hex0}
    output reg  [6:0]  seg,         // {a,b,c,d,e,f,g}, active HIGH
    output reg  [3:0]  digit_en     // Active‐LOW enables: digit_en[i]=0 => digit i on
);

    //======================================================
    // 1) Parameters / localparams
    //======================================================
    localparam integer REFRESH_HZ      = 100;                       // Overall refresh rate in Hz
    localparam integer NUM_DIGITS      = 4;
    localparam integer SCAN_FREQ_HZ    = REFRESH_HZ * NUM_DIGITS;   // 400 Hz
    localparam integer DIVIDER_WIDTH   = $clog2(`CLK_FREQ) + 1;     // Bits needed

    // Number of clock cycles for one scan‐tick (400 Hz)
    localparam integer SCAN_CNT_MAX = `CLK_FREQ / SCAN_FREQ_HZ;

    //======================================================
    // 2) Registers / wires
    //======================================================
    reg [DIVIDER_WIDTH-1:0] scan_cnt;
    reg [1:0] digit_idx;  // 0..3

    wire [3:0] current_nibble;
    wire [6:0] decoded_segments;

    //======================================================
    // 3) Clock divider → generate a tick at 400 Hz
    //======================================================
    always @(posedge clk) begin
        if (scan_cnt >= SCAN_CNT_MAX - 1) begin
            scan_cnt   <= 0;
            digit_idx  <= digit_idx + 1;
        end else begin
            scan_cnt <= scan_cnt + 1;
        end
    end

    //======================================================
    // 4) Pick the 4‐bit nibble based on digit_idx
    //======================================================
    assign current_nibble = (digit_idx == 2'd0) ? value[3:0]   :
                            (digit_idx == 2'd1) ? value[7:4]   :
                            (digit_idx == 2'd2) ? value[11:8]  :
                                                  value[15:12] ;

    //======================================================
    // 5) Instantiate single‐digit decoder
    //======================================================
    seven_seg u_seg (
        .hex(current_nibble),
        .seg(decoded_segments)
    );

    //======================================================
    // 6) Drive outputs: seg & digit_en
    //======================================================
    always @(*) begin
        seg = decoded_segments;

        // Active‐LOW enables: low = on, high = off
        case (digit_idx)
            2'd0: digit_en = 4'b1110;
            2'd1: digit_en = 4'b1101;
            2'd2: digit_en = 4'b1011;
            2'd3: digit_en = 4'b0111;
            default: digit_en = 4'b1111;
        endcase
    end

endmodule
