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

