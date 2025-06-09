
module seven_seg ( digit, seg );
  input [3:0] digit;
  output [6:0] seg;
  wire   N11, N14, N18, N22, N25, N26, N27, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34;
  assign seg[6] = N11;
  assign seg[5] = N14;
  assign seg[4] = N18;
  assign seg[3] = N22;
  assign seg[2] = N25;
  assign seg[1] = N26;
  assign seg[0] = N27;

  NAND2B U24 ( .AN(n17), .B(n18), .Y(N27) );
  NAND2B U25 ( .AN(n19), .B(n18), .Y(N26) );
  AOI2BB1 U26 ( .A0N(n20), .A1N(n21), .B0(n22), .Y(n18) );
  NOR2B U27 ( .AN(digit[1]), .B(n23), .Y(n20) );
  AOI21 U28 ( .A0(n24), .A1(n25), .B0(digit[0]), .Y(N25) );
  INV U29 ( .A(n26), .Y(N22) );
  NOR3B U30 ( .AN(n27), .B(n17), .C(n28), .Y(n26) );
  MX2 U31 ( .A(n29), .B(n30), .S0(n23), .Y(n28) );
  NOR2 U32 ( .A(n21), .B(digit[1]), .Y(n29) );
  NOR2B U33 ( .AN(n31), .B(n25), .Y(n17) );
  OAI211 U34 ( .A0(digit[3]), .A1(n23), .B0(n24), .C0(n21), .Y(N18) );
  OAI221 U35 ( .A0(n25), .A1(n23), .B0(digit[3]), .B1(digit[2]), .C0(n32), .Y(
        N14) );
  NOR2 U36 ( .A(n33), .B(n19), .Y(n32) );
  NOR3B U37 ( .AN(n34), .B(digit[0]), .C(digit[1]), .Y(n19) );
  OAI211 U38 ( .A0(n23), .A1(n21), .B0(n25), .C0(n27), .Y(N11) );
  AOI31 U39 ( .A0(n23), .A1(n34), .A2(n31), .B0(n22), .Y(n27) );
  NOR2B U40 ( .AN(digit[3]), .B(n24), .Y(n22) );
  INV U41 ( .A(n33), .Y(n24) );
  NOR2 U42 ( .A(digit[2]), .B(digit[1]), .Y(n33) );
  INV U43 ( .A(digit[2]), .Y(n31) );
  INV U44 ( .A(digit[3]), .Y(n34) );
  INV U45 ( .A(n30), .Y(n25) );
  NOR2B U46 ( .AN(digit[1]), .B(digit[3]), .Y(n30) );
  NAND2B U47 ( .AN(digit[3]), .B(digit[2]), .Y(n21) );
  INV U48 ( .A(digit[0]), .Y(n23) );
endmodule

