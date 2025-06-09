`timescale 1ns/1ps
`include "defines.vh"

module top (
    input  wire        clk,      // 系统时钟，例如 50 MHz
    input  wire        rst_n,    // 主动低复位
    output wire [6:0]  seg,      // 7 段段选
    output wire [3:0]  digit_en  // 4 位使能（低电平亮）
);

    //======================================================
    // 1) 参数：生成 100 ms 一次的 tick
    //======================================================
    localparam integer TICKS_100MS = 5000; // 50 MHz/10 = 5 000 000

    //======================================================
    // 2) 寄存器
    //======================================================
    reg [22:0] ms_cnt;       // 23 位足够数到 5 000 000
    reg [15:0] counter_reg;  // 16 位十六进制计数器

    //======================================================
    // 3) 100 ms 计时器 + 计数逻辑
    //======================================================
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            ms_cnt      <= 23'd0;
            counter_reg <= 16'd0;
        end else begin
            if (ms_cnt >= TICKS_100MS - 1) begin
                ms_cnt      <= 23'd0;
                counter_reg <= counter_reg + 1;
            end else begin
                ms_cnt <= ms_cnt + 1;
            end
        end
    end

    //======================================================
    // 4) 实例化四位显示模块，把 counter_reg 送进去
    //======================================================
    four_digit_display u_display (
        .clk      (clk),
        .rst_n    (rst_n),
        .value    (counter_reg),
        .seg      (seg),
        .digit_en (digit_en)
    );

endmodule
