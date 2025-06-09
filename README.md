## Four-digit 7-segment display

```verilog
`default_nettype none
`include "defines.vh"

module four_digit_seg (
    input  wire        clk,         // System clock (e.g. 50 MHz)
    input  wire [15:0] value,       // Binary value 0…9999
    output reg  [6:0]  seg,         // {a,b,c,d,e,f,g}, active HIGH
    output reg  [3:0]  digit_en     // Active-LOW enables: digit_en[i]=0 ⇒ digit i ON
);

    // 1) Parameters / localparams
    localparam integer REFRESH_HZ      = 100;                       // Overall refresh rate in Hz
    localparam integer NUM_DIGITS      = 4;
    localparam integer SCAN_FREQ_HZ    = REFRESH_HZ * NUM_DIGITS;   // 400 Hz
    localparam integer DIVIDER_WIDTH   = $clog2(`CLK_FREQ) + 1;     // Bits needed

    // Number of clock cycles for one scan-tick (400 Hz)
    localparam integer SCAN_CNT_MAX = `CLK_FREQ / SCAN_FREQ_HZ;

    // 2) Registers / wires
    reg [DIVIDER_WIDTH-1:0] scan_cnt;
    reg [1:0] digit_idx;           // 0..3

    // 2b) BCD conversion
    wire [15:0] bcd_value;
    assign bcd_value = bin2bcd(value);

    wire [3:0] current_nibble;
    wire [6:0] decoded_segments;

    // 3) Clock divider → generate a tick at 400 Hz
    always @(posedge clk) begin
        if (scan_cnt >= SCAN_CNT_MAX - 1) begin
            scan_cnt  <= 0;
            digit_idx <= digit_idx + 1;
        end else begin
            scan_cnt <= scan_cnt + 1;
        end
    end

    // 4) Pick the 4-bit BCD digit based on digit_idx
    assign current_nibble =
               (digit_idx == 2'd0) ? bcd_value[3:0]   :  // ones
               (digit_idx == 2'd1) ? bcd_value[7:4]   :  // tens
               (digit_idx == 2'd2) ? bcd_value[11:8]  :  // hundreds
                                     bcd_value[15:12];   // thousands

    // 5) Instantiate single-digit decoder (0…9)
    seven_seg u_seg (
        .hex(current_nibble),
        .seg(decoded_segments)
    );

    // 6) Drive outputs: seg, digit_en
    always @(*) begin
        seg = decoded_segments;
        // Active-LOW enables: low = on, high = off
        case (digit_idx)
            2'd0: digit_en = 4'b0001;  // ones
            2'd1: digit_en = 4'b0010;  // tens
            2'd2: digit_en = 4'b0100;  // hundreds
            2'd3: digit_en = 4'b1000;  // thousands
        endcase
    end

    // ──────────────────────────────────────────────────────────────────────
    // Function: binary → BCD (4 digits)
    // Implements the “double-dabble” shift-and-add-3 algorithm, combinationally.
    // Input:  binary_in  (0…9999)
    // Output: [thou][hun][ten][one]
    function [15:0] bin2bcd;
        input [15:0] binary_in;
        integer i;
        reg [27:0] shift_reg;  // 16 bits data + 12 bits for four BCD digits
        begin
            // initialize: upper 12 bits = 0, lower 16 bits = binary value
            shift_reg = {12'd0, binary_in};
            // for each input bit
            for (i = 0; i < 16; i = i + 1) begin
                // if any BCD digit ≥ 5, add 3
                if (shift_reg[27:24] > 4) shift_reg[27:24] = shift_reg[27:24] + 3;
                if (shift_reg[23:20] > 4) shift_reg[23:20] = shift_reg[23:20] + 3;
                if (shift_reg[19:16] > 4) shift_reg[19:16] = shift_reg[19:16] + 3;
                if (shift_reg[15:12] > 4) shift_reg[15:12] = shift_reg[15:12] + 3;
                // shift left by 1
                shift_reg = shift_reg << 1;
            end
            // upper 16 bits now hold the BCD digits
            bin2bcd = shift_reg[27:12];
        end
    endfunction

endmodule
```


```verilog
`default_nettype none
`include "defines.vh"

module four_digit_seg (
    input  wire        clk,         // System clock (e.g. 50 MHz)
    input  wire [15:0] value,       // Binary value 0…9999
    output reg  [6:0]  seg,         // {a,b,c,d,e,f,g}, active HIGH
    output reg  [3:0]  digit_en     // Active-LOW enables: digit_en[i]=0 ⇒ digit i ON
);

    // 1) Timing parameters
    localparam integer REFRESH_HZ      = 100;                       // overall refresh rate
    localparam integer NUM_DIGITS      = 4;
    localparam integer SCAN_FREQ_HZ    = REFRESH_HZ * NUM_DIGITS;   // 400 Hz
    localparam integer DIVIDER_WIDTH   = $clog2(`CLK_FREQ) + 1;     // bits needed
    localparam integer SCAN_CNT_MAX    = `CLK_FREQ / SCAN_FREQ_HZ;  // cycles per scan

    // 2) Scan counter & index
    reg [DIVIDER_WIDTH-1:0] scan_cnt;
    reg [1:0]               digit_idx;  // 0…3

    // 3) Decimal-digit extraction via constant div/mod
    wire [3:0] digit0 =  value      % 10;        // ones
    wire [3:0] digit1 = (value /  10) % 10;       // tens
    wire [3:0] digit2 = (value / 100) % 10;       // hundreds
    wire [3:0] digit3 = (value /1000) % 10;       // thousands

    // select which digit to send to the seven-seg decoder
    wire [3:0] current_nibble = 
               (digit_idx == 2'd0) ? digit0 :
               (digit_idx == 2'd1) ? digit1 :
               (digit_idx == 2'd2) ? digit2 :
                                      digit3;

    // 4) Seven-segment decode (supports 0…9)
    wire [6:0] decoded_segments;
    seven_seg u_seg (
        .hex(current_nibble),
        .seg(decoded_segments)
    );

    // 5) Scan-tick generator (400 Hz)
    always @(posedge clk) begin
        if (scan_cnt >= SCAN_CNT_MAX - 1) begin
            scan_cnt  <= 0;
            digit_idx <= digit_idx + 1;
        end else begin
            scan_cnt <= scan_cnt + 1;
        end
    end

    // 6) Output multiplexing
    always @(*) begin
        seg = decoded_segments;
        case (digit_idx)
            2'd0: digit_en = 4'b0001;  // ones
            2'd1: digit_en = 4'b0010;  // tens
            2'd2: digit_en = 4'b0100;  // hundreds
            2'd3: digit_en = 4'b1000;  // thousands
            default: digit_en = 4'b1111;
        endcase
    end

endmodule

```

```verilog
`default_nettype none
`include "defines.vh"

module four_digit_seg (
    input  wire        clk,         // System clock (e.g. 50 MHz)
    input  wire [15:0] value,       // Binary value 0…9999
    output reg  [6:0]  seg,         // {a,b,c,d,e,f,g}, active HIGH
    output reg  [3:0]  digit_en     // Active-LOW enables: digit_en[i]=0 ⇒ digit i ON
);

    // 1) Timing parameters
    localparam integer REFRESH_HZ    = 100;
    localparam integer NUM_DIGITS    = 4;
    localparam integer SCAN_FREQ_HZ  = REFRESH_HZ * NUM_DIGITS;   // 400 Hz
    localparam integer DIV_W         = $clog2(`CLK_FREQ) + 1;
    localparam integer SCAN_MAX      = `CLK_FREQ / SCAN_FREQ_HZ;

    // 2) Scan counter & index
    reg [DIV_W-1:0] scan_cnt;
    reg [1:0]       digit_idx;  // 0…3

    // 3) Decimal digit extraction
    reg [3:0] d3, d2, d1, d0;        // thousands, hundreds, tens, ones
    reg [15:0] rem1, rem2, rem3;

    always @(*) begin
        // — thousands digit —
        if      (value >= 16'd9000) d3 = 4'd9;
        else if (value >= 16'd8000) d3 = 4'd8;
        else if (value >= 16'd7000) d3 = 4'd7;
        else if (value >= 16'd6000) d3 = 4'd6;
        else if (value >= 16'd5000) d3 = 4'd5;
        else if (value >= 16'd4000) d3 = 4'd4;
        else if (value >= 16'd3000) d3 = 4'd3;
        else if (value >= 16'd2000) d3 = 4'd2;
        else if (value >= 16'd1000) d3 = 4'd1;
        else                         d3 = 4'd0;

        // subtract thousands*1000
        case (d3)
            4'd1: rem1 = value - 16'd1000;
            4'd2: rem1 = value - 16'd2000;
            4'd3: rem1 = value - 16'd3000;
            4'd4: rem1 = value - 16'd4000;
            4'd5: rem1 = value - 16'd5000;
            4'd6: rem1 = value - 16'd6000;
            4'd7: rem1 = value - 16'd7000;
            4'd8: rem1 = value - 16'd8000;
            4'd9: rem1 = value - 16'd9000;
            default: rem1 = value;
        endcase

        // — hundreds digit —
        if      (rem1 >= 16'd900)  d2 = 4'd9;
        else if (rem1 >= 16'd800)  d2 = 4'd8;
        else if (rem1 >= 16'd700)  d2 = 4'd7;
        else if (rem1 >= 16'd600)  d2 = 4'd6;
        else if (rem1 >= 16'd500)  d2 = 4'd5;
        else if (rem1 >= 16'd400)  d2 = 4'd4;
        else if (rem1 >= 16'd300)  d2 = 4'd3;
        else if (rem1 >= 16'd200)  d2 = 4'd2;
        else if (rem1 >= 16'd100)  d2 = 4'd1;
        else                        d2 = 4'd0;

        // subtract hundreds*100
        case (d2)
            4'd1: rem2 = rem1 - 16'd100;
            4'd2: rem2 = rem1 - 16'd200;
            4'd3: rem2 = rem1 - 16'd300;
            4'd4: rem2 = rem1 - 16'd400;
            4'd5: rem2 = rem1 - 16'd500;
            4'd6: rem2 = rem1 - 16'd600;
            4'd7: rem2 = rem1 - 16'd700;
            4'd8: rem2 = rem1 - 16'd800;
            4'd9: rem2 = rem1 - 16'd900;
            default: rem2 = rem1;
        endcase

        // — tens digit —
        if      (rem2 >= 16'd90)  d1 = 4'd9;
        else if (rem2 >= 16'd80)  d1 = 4'd8;
        else if (rem2 >= 16'd70)  d1 = 4'd7;
        else if (rem2 >= 16'd60)  d1 = 4'd6;
        else if (rem2 >= 16'd50)  d1 = 4'd5;
        else if (rem2 >= 16'd40)  d1 = 4'd4;
        else if (rem2 >= 16'd30)  d1 = 4'd3;
        else if (rem2 >= 16'd20)  d1 = 4'd2;
        else if (rem2 >= 16'd10)  d1 = 4'd1;
        else                       d1 = 4'd0;

        // subtract tens*10
        case (d1)
            4'd1: rem3 = rem2 - 16'd10;
            4'd2: rem3 = rem2 - 16'd20;
            4'd3: rem3 = rem2 - 16'd30;
            4'd4: rem3 = rem2 - 16'd40;
            4'd5: rem3 = rem2 - 16'd50;
            4'd6: rem3 = rem2 - 16'd60;
            4'd7: rem3 = rem2 - 16'd70;
            4'd8: rem3 = rem2 - 16'd80;
            4'd9: rem3 = rem2 - 16'd90;
            default: rem3 = rem2;
        endcase

        // — ones digit —
        d0 = rem3[3:0];  
    end

    // 4) select the current digit for display
    wire [3:0] current_nibble =
           (digit_idx == 2'd0) ? d0 :
           (digit_idx == 2'd1) ? d1 :
           (digit_idx == 2'd2) ? d2 :
                                  d3;

    // 5) seven‐segment decode (0–9)
    wire [6:0] decoded;
    seven_seg u_seg (
        .hex(current_nibble),
        .seg(decoded)
    );

    // 6) scan counter & digit multiplexing
    always @(posedge clk) begin
        if (scan_cnt >= SCAN_MAX-1) begin
            scan_cnt  <= 0;
            digit_idx <= digit_idx + 1;
        end else
            scan_cnt <= scan_cnt + 1;
    end

    always @(*) begin
        seg = decoded;
        case (digit_idx)
            2'd0: digit_en = 4'b0001;  // ones
            2'd1: digit_en = 4'b0010;  // tens
            2'd2: digit_en = 4'b0100;  // hundreds
            2'd3: digit_en = 4'b1000;  // thousands
            default: digit_en = 4'b1111;
        endcase
    end

endmodule

```