
module timer_display ( clk, rst_n, interval, dir, seg, timeout );
  input [2:0] interval;
  output [6:0] seg;
  input clk, rst_n, dir;
  output timeout;
  wire   \u_interval/N84 , \u_interval/N83 , \u_interval/N82 ,
         \u_interval/N81 , \u_interval/N80 , \u_interval/N79 ,
         \u_interval/N78 , \u_interval/N77 , \u_interval/N76 ,
         \u_interval/N75 , \u_interval/N74 , \u_interval/N73 ,
         \u_interval/N72 , \u_interval/N71 , \u_interval/N70 ,
         \u_interval/N69 , \u_interval/N30 , \u_interval/N29 ,
         \u_interval/N28 , \u_interval/N27 , \u_interval/N26 ,
         \u_interval/N25 , \u_interval/N24 , \u_interval/N23 ,
         \u_interval/N22 , \u_interval/N21 , \u_interval/N20 ,
         \u_interval/N19 , \u_interval/N18 , \u_interval/N17 ,
         \u_interval/N16 , \u_interval/done , \u_interval/div_cnt[0] ,
         \u_interval/div_cnt[1] , \u_interval/div_cnt[2] ,
         \u_interval/div_cnt[3] , \u_interval/div_cnt[4] ,
         \u_interval/div_cnt[5] , \u_interval/div_cnt[6] ,
         \u_interval/div_cnt[7] , \u_interval/div_cnt[8] ,
         \u_interval/div_cnt[9] , \u_interval/div_cnt[10] ,
         \u_interval/div_cnt[11] , \u_interval/div_cnt[12] ,
         \u_interval/div_cnt[13] , \u_interval/div_cnt[14] ,
         \u_interval/div_cnt[15] , \u_sevenseg/N27 , \u_sevenseg/N26 ,
         \u_sevenseg/N25 , \u_sevenseg/N18 , \u_sevenseg/N11 , n47, n48, n49,
         n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63,
         n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77,
         n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91,
         n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103, n104;
  wire   [2:0] count;
  assign seg[0] = \u_sevenseg/N27 ;
  assign seg[1] = \u_sevenseg/N26 ;
  assign seg[2] = \u_sevenseg/N25 ;
  assign seg[4] = \u_sevenseg/N18 ;
  assign seg[6] = \u_sevenseg/N11 ;

  DFFHQ \u_interval/div_cnt_reg[15]  ( .D(\u_interval/N84 ), .CK(clk), .Q(
        \u_interval/div_cnt[15] ) );
  DFFHQ \u_interval/div_cnt_reg[0]  ( .D(\u_interval/N69 ), .CK(clk), .Q(
        \u_interval/div_cnt[0] ) );
  DFFHQ \u_interval/div_cnt_reg[1]  ( .D(\u_interval/N70 ), .CK(clk), .Q(
        \u_interval/div_cnt[1] ) );
  DFFHQ \u_interval/div_cnt_reg[2]  ( .D(\u_interval/N71 ), .CK(clk), .Q(
        \u_interval/div_cnt[2] ) );
  DFFHQ \u_interval/div_cnt_reg[3]  ( .D(\u_interval/N72 ), .CK(clk), .Q(
        \u_interval/div_cnt[3] ) );
  DFFHQ \u_interval/div_cnt_reg[4]  ( .D(\u_interval/N73 ), .CK(clk), .Q(
        \u_interval/div_cnt[4] ) );
  DFFHQ \u_interval/div_cnt_reg[5]  ( .D(\u_interval/N74 ), .CK(clk), .Q(
        \u_interval/div_cnt[5] ) );
  DFFHQ \u_interval/div_cnt_reg[6]  ( .D(\u_interval/N75 ), .CK(clk), .Q(
        \u_interval/div_cnt[6] ) );
  DFFHQ \u_interval/div_cnt_reg[7]  ( .D(\u_interval/N76 ), .CK(clk), .Q(
        \u_interval/div_cnt[7] ) );
  DFFHQ \u_interval/div_cnt_reg[8]  ( .D(\u_interval/N77 ), .CK(clk), .Q(
        \u_interval/div_cnt[8] ) );
  DFFHQ \u_interval/div_cnt_reg[9]  ( .D(\u_interval/N78 ), .CK(clk), .Q(
        \u_interval/div_cnt[9] ) );
  DFFHQ \u_interval/div_cnt_reg[10]  ( .D(\u_interval/N79 ), .CK(clk), .Q(
        \u_interval/div_cnt[10] ) );
  DFFHQ \u_interval/div_cnt_reg[11]  ( .D(\u_interval/N80 ), .CK(clk), .Q(
        \u_interval/div_cnt[11] ) );
  DFFHQ \u_interval/div_cnt_reg[12]  ( .D(\u_interval/N81 ), .CK(clk), .Q(
        \u_interval/div_cnt[12] ) );
  DFFHQ \u_interval/div_cnt_reg[13]  ( .D(\u_interval/N82 ), .CK(clk), .Q(
        \u_interval/div_cnt[13] ) );
  DFFHQ \u_interval/div_cnt_reg[14]  ( .D(\u_interval/N83 ), .CK(clk), .Q(
        \u_interval/div_cnt[14] ) );
  DFFHQ \u_interval/count_reg[0]  ( .D(n50), .CK(clk), .Q(count[0]) );
  DFFHQ \u_interval/count_reg[1]  ( .D(n49), .CK(clk), .Q(count[1]) );
  DFFHQ \u_interval/count_reg[2]  ( .D(n51), .CK(clk), .Q(count[2]) );
  DFFHQ \u_interval/done_reg  ( .D(n48), .CK(clk), .Q(\u_interval/done ) );
  DFFHQ \u_interval/timeout_reg  ( .D(n47), .CK(clk), .Q(timeout) );
  AND2 U69 ( .A(\u_interval/div_cnt[1] ), .B(\u_interval/div_cnt[0] ), .Y(n52)
         );
  AND2 U70 ( .A(\u_interval/div_cnt[2] ), .B(n52), .Y(n53) );
  AND2 U71 ( .A(\u_interval/div_cnt[3] ), .B(n53), .Y(n54) );
  AND2 U72 ( .A(\u_interval/div_cnt[4] ), .B(n54), .Y(n55) );
  AND2 U73 ( .A(\u_interval/div_cnt[5] ), .B(n55), .Y(n56) );
  AND2 U74 ( .A(\u_interval/div_cnt[6] ), .B(n56), .Y(n57) );
  AND2 U75 ( .A(\u_interval/div_cnt[7] ), .B(n57), .Y(n58) );
  AND2 U76 ( .A(\u_interval/div_cnt[8] ), .B(n58), .Y(n59) );
  AND2 U77 ( .A(\u_interval/div_cnt[9] ), .B(n59), .Y(n60) );
  AND2 U78 ( .A(\u_interval/div_cnt[10] ), .B(n60), .Y(n61) );
  AND2 U79 ( .A(\u_interval/div_cnt[11] ), .B(n61), .Y(n62) );
  AND2 U80 ( .A(\u_interval/div_cnt[12] ), .B(n62), .Y(n63) );
  AND2 U81 ( .A(\u_interval/div_cnt[13] ), .B(n63), .Y(n64) );
  AND2 U82 ( .A(\u_interval/div_cnt[14] ), .B(n64), .Y(n65) );
  XOR2 U83 ( .A(\u_interval/div_cnt[1] ), .B(\u_interval/div_cnt[0] ), .Y(
        \u_interval/N16 ) );
  XOR2 U84 ( .A(\u_interval/div_cnt[2] ), .B(n52), .Y(\u_interval/N17 ) );
  XOR2 U85 ( .A(\u_interval/div_cnt[3] ), .B(n53), .Y(\u_interval/N18 ) );
  XOR2 U86 ( .A(\u_interval/div_cnt[4] ), .B(n54), .Y(\u_interval/N19 ) );
  XOR2 U87 ( .A(\u_interval/div_cnt[5] ), .B(n55), .Y(\u_interval/N20 ) );
  XOR2 U88 ( .A(\u_interval/div_cnt[6] ), .B(n56), .Y(\u_interval/N21 ) );
  XOR2 U89 ( .A(\u_interval/div_cnt[7] ), .B(n57), .Y(\u_interval/N22 ) );
  XOR2 U90 ( .A(\u_interval/div_cnt[8] ), .B(n58), .Y(\u_interval/N23 ) );
  XOR2 U91 ( .A(\u_interval/div_cnt[9] ), .B(n59), .Y(\u_interval/N24 ) );
  XOR2 U92 ( .A(\u_interval/div_cnt[10] ), .B(n60), .Y(\u_interval/N25 ) );
  XOR2 U93 ( .A(\u_interval/div_cnt[11] ), .B(n61), .Y(\u_interval/N26 ) );
  XOR2 U94 ( .A(\u_interval/div_cnt[12] ), .B(n62), .Y(\u_interval/N27 ) );
  XOR2 U95 ( .A(\u_interval/div_cnt[13] ), .B(n63), .Y(\u_interval/N28 ) );
  XOR2 U96 ( .A(\u_interval/div_cnt[14] ), .B(n64), .Y(\u_interval/N29 ) );
  XOR2 U97 ( .A(\u_interval/div_cnt[15] ), .B(n65), .Y(\u_interval/N30 ) );
  OAI21 U98 ( .A0(count[2]), .A1(n66), .B0(n67), .Y(\u_sevenseg/N27 ) );
  OAI21 U99 ( .A0(count[1]), .A1(count[0]), .B0(n67), .Y(\u_sevenseg/N26 ) );
  NAND2 U100 ( .A(count[1]), .B(n68), .Y(\u_sevenseg/N18 ) );
  OAI211 U101 ( .A0(n69), .A1(n70), .B0(n71), .C0(n66), .Y(\u_sevenseg/N11 )
         );
  NOR2B U102 ( .AN(\u_interval/N30 ), .B(n72), .Y(\u_interval/N84 ) );
  NOR2B U103 ( .AN(\u_interval/N29 ), .B(n72), .Y(\u_interval/N83 ) );
  NOR2B U104 ( .AN(\u_interval/N28 ), .B(n72), .Y(\u_interval/N82 ) );
  NOR2B U105 ( .AN(\u_interval/N27 ), .B(n72), .Y(\u_interval/N81 ) );
  NOR2B U106 ( .AN(\u_interval/N26 ), .B(n72), .Y(\u_interval/N80 ) );
  NOR2B U107 ( .AN(\u_interval/N25 ), .B(n72), .Y(\u_interval/N79 ) );
  NOR2B U108 ( .AN(\u_interval/N24 ), .B(n72), .Y(\u_interval/N78 ) );
  NOR2B U109 ( .AN(\u_interval/N23 ), .B(n72), .Y(\u_interval/N77 ) );
  NOR2B U110 ( .AN(\u_interval/N22 ), .B(n72), .Y(\u_interval/N76 ) );
  NOR2B U111 ( .AN(\u_interval/N21 ), .B(n72), .Y(\u_interval/N75 ) );
  NOR2B U112 ( .AN(\u_interval/N20 ), .B(n72), .Y(\u_interval/N74 ) );
  NOR2B U113 ( .AN(\u_interval/N19 ), .B(n72), .Y(\u_interval/N73 ) );
  NOR2B U114 ( .AN(\u_interval/N18 ), .B(n72), .Y(\u_interval/N72 ) );
  NOR2B U115 ( .AN(\u_interval/N17 ), .B(n72), .Y(\u_interval/N71 ) );
  NOR2B U116 ( .AN(\u_interval/N16 ), .B(n72), .Y(\u_interval/N70 ) );
  NOR2 U117 ( .A(n72), .B(\u_interval/div_cnt[0] ), .Y(\u_interval/N69 ) );
  NAND2 U118 ( .A(rst_n), .B(n73), .Y(n72) );
  OR2 U119 ( .A(n74), .B(\u_sevenseg/N25 ), .Y(seg[3]) );
  OAI21 U120 ( .A0(count[0]), .A1(n66), .B0(n71), .Y(\u_sevenseg/N25 ) );
  MX2 U121 ( .A(n75), .B(n70), .S0(count[1]), .Y(n74) );
  NOR2B U122 ( .AN(count[2]), .B(n69), .Y(n75) );
  INV U123 ( .A(n76), .Y(n51) );
  AOI222 U124 ( .A0(n77), .A1(rst_n), .B0(n78), .B1(interval[2]), .C0(count[2]), .C1(n79), .Y(n76) );
  NAND2B U125 ( .AN(n80), .B(seg[5]), .Y(n77) );
  OR2 U126 ( .A(n81), .B(n70), .Y(seg[5]) );
  MX2 U127 ( .A(n82), .B(n83), .S0(dir), .Y(n80) );
  OAI31 U128 ( .A0(n84), .A1(count[2]), .A2(n79), .B0(n67), .Y(n83) );
  NAND2 U129 ( .A(count[2]), .B(n84), .Y(n67) );
  NOR2B U130 ( .AN(count[2]), .B(n84), .Y(n82) );
  OAI2BB1 U131 ( .A0N(n78), .A1N(interval[0]), .B0(n85), .Y(n50) );
  INV U132 ( .A(n86), .Y(n85) );
  MX2 U133 ( .A(n87), .B(n79), .S0(count[0]), .Y(n86) );
  NOR2B U134 ( .AN(rst_n), .B(n79), .Y(n87) );
  OAI2BB1 U135 ( .A0N(n78), .A1N(interval[1]), .B0(n88), .Y(n49) );
  INV U136 ( .A(n89), .Y(n88) );
  MX2 U137 ( .A(n90), .B(count[1]), .S0(n79), .Y(n89) );
  INV U138 ( .A(n91), .Y(n79) );
  OAI31 U139 ( .A0(n73), .A1(\u_interval/done ), .A2(n92), .B0(rst_n), .Y(n91)
         );
  NOR2B U140 ( .AN(rst_n), .B(n93), .Y(n90) );
  XNOR2 U141 ( .A(n81), .B(dir), .Y(n93) );
  OAI21 U142 ( .A0(count[0]), .A1(count[1]), .B0(n84), .Y(n81) );
  NAND2B U143 ( .AN(n69), .B(count[1]), .Y(n84) );
  INV U144 ( .A(count[0]), .Y(n69) );
  NOR2 U145 ( .A(rst_n), .B(dir), .Y(n78) );
  INV U146 ( .A(n94), .Y(n48) );
  OAI2BB1 U147 ( .A0N(timeout), .A1N(rst_n), .B0(n94), .Y(n47) );
  OAI21 U148 ( .A0(n95), .A1(\u_interval/done ), .B0(rst_n), .Y(n94) );
  NOR2B U149 ( .AN(n92), .B(n73), .Y(n95) );
  NAND4 U150 ( .A(n96), .B(n97), .C(n98), .D(n99), .Y(n73) );
  NOR4 U151 ( .A(\u_interval/div_cnt[7] ), .B(\u_interval/div_cnt[5] ), .C(
        \u_interval/div_cnt[4] ), .D(\u_interval/div_cnt[13] ), .Y(n99) );
  NOR4B U152 ( .AN(\u_interval/div_cnt[0] ), .B(\u_interval/div_cnt[12] ), .C(
        \u_interval/div_cnt[11] ), .D(\u_interval/div_cnt[10] ), .Y(n98) );
  AND4 U153 ( .A(\u_interval/div_cnt[2] ), .B(\u_interval/div_cnt[1] ), .C(
        \u_interval/div_cnt[15] ), .D(\u_interval/div_cnt[14] ), .Y(n97) );
  AND4 U154 ( .A(\u_interval/div_cnt[9] ), .B(\u_interval/div_cnt[8] ), .C(
        \u_interval/div_cnt[6] ), .D(\u_interval/div_cnt[3] ), .Y(n96) );
  MX2 U155 ( .A(n100), .B(n101), .S0(dir), .Y(n92) );
  NOR3 U156 ( .A(n102), .B(n103), .C(n104), .Y(n101) );
  XOR2 U157 ( .A(interval[2]), .B(count[2]), .Y(n104) );
  XOR2 U158 ( .A(interval[0]), .B(count[0]), .Y(n103) );
  XOR2 U159 ( .A(interval[1]), .B(count[1]), .Y(n102) );
  NOR2B U160 ( .AN(n66), .B(n71), .Y(n100) );
  INV U161 ( .A(n68), .Y(n71) );
  NOR2B U162 ( .AN(n70), .B(count[0]), .Y(n68) );
  INV U163 ( .A(count[2]), .Y(n70) );
  INV U164 ( .A(count[1]), .Y(n66) );
endmodule

