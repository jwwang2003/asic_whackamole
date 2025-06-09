
module top ( clk, rst, seed, seg );
  input [7:0] seed;
  output [6:0] seg;
  input clk, rst;
  wire   \u_prng/feedback , \u_7seg/N18 , \u_7seg/N17 , \u_7seg/N16 ,
         \u_7seg/N12 , \u_7seg/N11 , \u_7seg/N9 , \u_7seg/N5 , n1, n18, n19,
         n20, n21, n22, n23, n24, n25, n26;
  wire   [7:0] rnd_out;
  assign seg[0] = \u_7seg/N18 ;
  assign seg[1] = \u_7seg/N17 ;
  assign seg[3] = \u_7seg/N16 ;
  assign seg[4] = \u_7seg/N12 ;
  assign seg[5] = \u_7seg/N11 ;
  assign seg[6] = \u_7seg/N9 ;
  assign seg[2] = \u_7seg/N5 ;

  DFFSHQ \u_prng/random_reg[7]  ( .D(rnd_out[6]), .CK(clk), .SN(n1), .Q(
        rnd_out[7]) );
  DFFSHQ \u_prng/random_reg[0]  ( .D(\u_prng/feedback ), .CK(clk), .SN(n1), 
        .Q(rnd_out[0]) );
  DFFSHQ \u_prng/random_reg[1]  ( .D(rnd_out[0]), .CK(clk), .SN(n1), .Q(
        rnd_out[1]) );
  DFFRHQ \u_prng/random_reg[2]  ( .D(rnd_out[1]), .CK(clk), .RN(n1), .Q(
        rnd_out[2]) );
  DFFSHQ \u_prng/random_reg[3]  ( .D(rnd_out[2]), .CK(clk), .SN(n1), .Q(
        rnd_out[3]) );
  DFFRHQ \u_prng/random_reg[4]  ( .D(rnd_out[3]), .CK(clk), .RN(n1), .Q(
        rnd_out[4]) );
  DFFSHQ \u_prng/random_reg[5]  ( .D(rnd_out[4]), .CK(clk), .SN(n1), .Q(
        rnd_out[5]) );
  DFFRHQ \u_prng/random_reg[6]  ( .D(rnd_out[5]), .CK(clk), .RN(n1), .Q(
        rnd_out[6]) );
  ADDF U26 ( .A(rnd_out[7]), .B(rnd_out[5]), .CI(n18), .S(\u_prng/feedback )
         );
  XOR2 U27 ( .A(rnd_out[4]), .B(rnd_out[3]), .Y(n18) );
  NAND2B U28 ( .AN(rnd_out[1]), .B(n19), .Y(\u_7seg/N9 ) );
  XOR2 U29 ( .A(rnd_out[2]), .B(rnd_out[0]), .Y(n19) );
  MX2 U30 ( .A(rnd_out[1]), .B(n20), .S0(rnd_out[2]), .Y(\u_7seg/N18 ) );
  OAI2BB1 U31 ( .A0N(rnd_out[2]), .A1N(n20), .B0(n21), .Y(\u_7seg/N17 ) );
  OR2 U32 ( .A(\u_7seg/N5 ), .B(n22), .Y(\u_7seg/N16 ) );
  MX2 U33 ( .A(n23), .B(n24), .S0(rnd_out[1]), .Y(n22) );
  NOR2B U34 ( .AN(rnd_out[0]), .B(n24), .Y(n23) );
  INV U35 ( .A(rnd_out[2]), .Y(n24) );
  NOR2 U36 ( .A(rnd_out[0]), .B(n25), .Y(\u_7seg/N5 ) );
  NOR2B U37 ( .AN(rnd_out[2]), .B(rnd_out[1]), .Y(n25) );
  INV U38 ( .A(n26), .Y(\u_7seg/N12 ) );
  NOR3B U39 ( .AN(rnd_out[1]), .B(rnd_out[2]), .C(rnd_out[0]), .Y(n26) );
  NAND3 U40 ( .A(rnd_out[2]), .B(n20), .C(n21), .Y(\u_7seg/N11 ) );
  OR2 U41 ( .A(rnd_out[1]), .B(rnd_out[0]), .Y(n21) );
  NAND2 U42 ( .A(rnd_out[0]), .B(rnd_out[1]), .Y(n20) );
  INV U43 ( .A(rst), .Y(n1) );
endmodule
