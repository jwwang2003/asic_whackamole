`default_nettype none

module top (
    input  wire       clk,   // system clock
    input  wire       rst,   // active‐high reset
    output wire [6:0] seg    // seven‐segment outputs {a,b,c,d,e,f,g}, active HIGH
);
    wire [7:0] rnd_out;

    lfsr_prng u_prng (
        .clk (clk),
        .rst (rst),
        .random (rnd_out)
    );

    seven_seg u_7seg (
        .digit (rnd_out[2:0]),
        .seg   (seg)
    );

endmodule
