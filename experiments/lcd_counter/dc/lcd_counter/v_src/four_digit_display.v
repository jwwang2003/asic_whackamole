`include "defines.vh"

module four_digit_display (
    input  wire        clk,        // System clock (e.g. 50 MHz)
    input  wire        rst_n,      // Active-low reset
    input  wire [15:0] value,      // {hex3, hex2, hex1, hex0}
    output reg  [6:0]  seg,        // {a,b,c,d,e,f,g}, active HIGH
    output reg  [3:0]  digit_en    // Active-HIGH enables: digit_en[i]=1 → digit i on
);

    //======================================================
    // 1) Parameters / localparams
    //======================================================
    localparam integer NUM_DIGITS    = 4;       
    // “整体刷新率” 400 Hz → 每个 digit 更新 400 Hz / 4 = 100 Hz
    localparam integer REFRESH_HZ    = 400;    
    localparam integer SCAN_FREQ_HZ  = REFRESH_HZ * NUM_DIGITS; // 400 × 4 = 1600 Hz
    localparam integer SCAN_CNT_MAX  = `CLK_FREQ / SCAN_FREQ_HZ; 
    localparam integer DIV_W         = $clog2(SCAN_CNT_MAX);

    //======================================================
    // 2) Registers / wires
    //======================================================
    reg [DIV_W-1:0] scan_cnt;   // 分频计数器，用来把 clk 降到 1600 Hz
    reg [1:0]       digit_idx;  // 当前要点亮的 digit (0..3)

    wire [3:0] current_nibble;
    wire [6:0] decoded_segments;

    //======================================================
    // 3) Clock divider → 生成 1600 Hz tick，同时复位时清零
    //    1600 Hz tick 意味着 digit_idx 每 1/1600 s 自增一次 → 整体 4 位 400 Hz 刷新
    //======================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            scan_cnt  <= {DIV_W{1'b0}};
            digit_idx <= 2'd0;
        end else if (scan_cnt >= SCAN_CNT_MAX - 1) begin
            scan_cnt  <= {DIV_W{1'b0}};
            digit_idx <= digit_idx + 1;
        end else begin
            scan_cnt <= scan_cnt + 1;
        end
    end

    //======================================================
    // 4) 根据 digit_idx 选出对应的 4-bit nibble
    //    digit_idx=0 → value[3:0]   (最右)
    //    digit_idx=1 → value[7:4]
    //    digit_idx=2 → value[11:8]
    //    digit_idx=3 → value[15:12] (最左)
    //======================================================
    assign current_nibble = (digit_idx == 2'd0) ? value[3:0]   :
                            (digit_idx == 2'd1) ? value[7:4]   :
                            (digit_idx == 2'd2) ? value[11:8]  :
                                                   value[15:12] ;

    //======================================================
    // 5) 单段七段译码器实例化
    //======================================================
    seven_seg u_seg (
        .hex(current_nibble),
        .seg(decoded_segments)
    );

    //======================================================
    // 6) 驱动 seg & digit_en
    //    digit_en[i]=1 → 数码管 i 亮 (active-HIGH)
    //======================================================
    always @(*) begin
        seg = decoded_segments;
        case (digit_idx)
            2'd0: digit_en = 4'b0001; // 仅最右一位亮
            2'd1: digit_en = 4'b0010; // 第二位亮
            2'd2: digit_en = 4'b0100; // 第三位亮
            2'd3: digit_en = 4'b1000; // 最左一位亮
            default: digit_en = 4'b0000;
        endcase
    end

endmodule

