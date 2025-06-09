
module timer_display ( clk, rst_n, interval, dir, seg, timeout );
  input [2:0] interval;
  output [6:0] seg;
  input clk, rst_n, dir;
  output timeout;
  wire   \u_interval/clk_div[0] , \u_interval/clk_div[1] ,
         \u_interval/clk_div[2] , \u_interval/clk_div[3] ,
         \u_interval/clk_div[4] , \u_interval/clk_div[5] ,
         \u_interval/clk_div[6] , \u_interval/clk_div[7] ,
         \u_interval/clk_div[8] , \u_interval/clk_div[9] ,
         \u_interval/clk_div[10] , \u_interval/clk_div[11] ,
         \u_interval/clk_div[12] , \u_interval/clk_div[13] ,
         \u_interval/clk_div[14] , \u_interval/clk_div[15] , \u_sevenseg/N27 ,
         \u_sevenseg/N26 , \u_sevenseg/N25 , \u_sevenseg/N22 ,
         \u_sevenseg/N18 , \u_sevenseg/N14 , \u_sevenseg/N11 , n58, n59, n60,
         n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75,
         n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89,
         n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102,
         n103, n104, n105, n106, n107, n108, n109, n110, n111, n112, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161;
  wire   [2:0] count;
  assign seg[0] = \u_sevenseg/N27 ;
  assign seg[1] = \u_sevenseg/N26 ;
  assign seg[2] = \u_sevenseg/N25 ;
  assign seg[3] = \u_sevenseg/N22 ;
  assign seg[4] = \u_sevenseg/N18 ;
  assign seg[5] = \u_sevenseg/N14 ;
  assign seg[6] = \u_sevenseg/N11 ;

  DFFHQ \u_interval/clk_div_reg[15]  ( .D(n159), .CK(clk), .Q(
        \u_interval/clk_div[15] ) );
  DFFHQ \u_interval/count_reg[1]  ( .D(n59), .CK(clk), .Q(count[1]) );
  DFFHQ \u_interval/count_reg[0]  ( .D(n60), .CK(clk), .Q(count[0]) );
  DFFHQ \u_interval/count_reg[2]  ( .D(n58), .CK(clk), .Q(count[2]) );
  EDFFTRHQ \u_interval/timeout_reg  ( .RN(rst_n), .D(n160), .E(n161), .CK(clk), 
        .Q(timeout) );
  DFFHQ \u_interval/clk_div_reg[14]  ( .D(n158), .CK(clk), .Q(
        \u_interval/clk_div[14] ) );
  DFFHQ \u_interval/clk_div_reg[0]  ( .D(n144), .CK(clk), .Q(
        \u_interval/clk_div[0] ) );
  DFFHQ \u_interval/clk_div_reg[1]  ( .D(n145), .CK(clk), .Q(
        \u_interval/clk_div[1] ) );
  DFFHQ \u_interval/clk_div_reg[2]  ( .D(n146), .CK(clk), .Q(
        \u_interval/clk_div[2] ) );
  DFFHQ \u_interval/clk_div_reg[3]  ( .D(n147), .CK(clk), .Q(
        \u_interval/clk_div[3] ) );
  DFFHQ \u_interval/clk_div_reg[4]  ( .D(n148), .CK(clk), .Q(
        \u_interval/clk_div[4] ) );
  DFFHQ \u_interval/clk_div_reg[5]  ( .D(n149), .CK(clk), .Q(
        \u_interval/clk_div[5] ) );
  DFFHQ \u_interval/clk_div_reg[6]  ( .D(n150), .CK(clk), .Q(
        \u_interval/clk_div[6] ) );
  DFFHQ \u_interval/clk_div_reg[7]  ( .D(n151), .CK(clk), .Q(
        \u_interval/clk_div[7] ) );
  DFFHQ \u_interval/clk_div_reg[8]  ( .D(n152), .CK(clk), .Q(
        \u_interval/clk_div[8] ) );
  DFFHQ \u_interval/clk_div_reg[9]  ( .D(n153), .CK(clk), .Q(
        \u_interval/clk_div[9] ) );
  DFFHQ \u_interval/clk_div_reg[10]  ( .D(n154), .CK(clk), .Q(
        \u_interval/clk_div[10] ) );
  DFFHQ \u_interval/clk_div_reg[11]  ( .D(n155), .CK(clk), .Q(
        \u_interval/clk_div[11] ) );
  DFFHQ \u_interval/clk_div_reg[12]  ( .D(n156), .CK(clk), .Q(
        \u_interval/clk_div[12] ) );
  DFFHQ \u_interval/clk_div_reg[13]  ( .D(n157), .CK(clk), .Q(
        \u_interval/clk_div[13] ) );
  OR2 U86 ( .A(n161), .B(n116), .Y(n62) );
  INV U87 ( .A(n62), .Y(n63) );
  MX2 U88 ( .A(count[1]), .B(n64), .S0(count[2]), .Y(\u_sevenseg/N27 ) );
  INV U89 ( .A(n65), .Y(n64) );
  OAI22 U90 ( .A0(n65), .A1(n66), .B0(count[1]), .B1(count[0]), .Y(
        \u_sevenseg/N26 ) );
  NOR2B U91 ( .AN(count[0]), .B(n67), .Y(n65) );
  OR2 U92 ( .A(\u_sevenseg/N25 ), .B(n68), .Y(\u_sevenseg/N22 ) );
  MX2 U93 ( .A(n69), .B(n66), .S0(count[1]), .Y(n68) );
  NOR2B U94 ( .AN(count[0]), .B(n66), .Y(n69) );
  OAI21 U95 ( .A0(count[2]), .A1(count[0]), .B0(n70), .Y(\u_sevenseg/N25 ) );
  INV U96 ( .A(n71), .Y(n70) );
  NAND2B U97 ( .AN(count[2]), .B(n71), .Y(\u_sevenseg/N18 ) );
  NAND2B U98 ( .AN(n72), .B(count[2]), .Y(\u_sevenseg/N14 ) );
  NAND2B U99 ( .AN(count[1]), .B(n73), .Y(\u_sevenseg/N11 ) );
  XOR2 U100 ( .A(count[2]), .B(count[0]), .Y(n73) );
  MX2 U101 ( .A(n74), .B(n144), .S0(\u_interval/clk_div[1] ), .Y(n145) );
  NOR2B U102 ( .AN(n63), .B(n75), .Y(n74) );
  OAI2BB2 U103 ( .B0(n76), .B1(n77), .A0N(n63), .A1N(n78), .Y(n146) );
  MX2 U104 ( .A(\u_interval/clk_div[2] ), .B(n79), .S0(\u_interval/clk_div[1] ), .Y(n78) );
  NOR2 U105 ( .A(\u_interval/clk_div[2] ), .B(n75), .Y(n79) );
  INV U106 ( .A(n144), .Y(n77) );
  NOR2B U107 ( .AN(n63), .B(\u_interval/clk_div[0] ), .Y(n144) );
  INV U108 ( .A(\u_interval/clk_div[2] ), .Y(n76) );
  NOR2B U109 ( .AN(n63), .B(n80), .Y(n147) );
  XNOR2 U110 ( .A(n81), .B(\u_interval/clk_div[3] ), .Y(n80) );
  NOR2B U111 ( .AN(n63), .B(n82), .Y(n148) );
  XOR2 U112 ( .A(\u_interval/clk_div[4] ), .B(n83), .Y(n82) );
  NOR2B U113 ( .AN(n63), .B(n84), .Y(n149) );
  XNOR2 U114 ( .A(\u_interval/clk_div[5] ), .B(n85), .Y(n84) );
  NOR2B U115 ( .AN(n63), .B(n86), .Y(n150) );
  XNOR2 U116 ( .A(\u_interval/clk_div[6] ), .B(n87), .Y(n86) );
  NOR2B U117 ( .AN(n63), .B(n88), .Y(n151) );
  XNOR2 U118 ( .A(\u_interval/clk_div[7] ), .B(n89), .Y(n88) );
  NOR2B U119 ( .AN(n63), .B(n90), .Y(n152) );
  XNOR2 U120 ( .A(\u_interval/clk_div[8] ), .B(n91), .Y(n90) );
  NOR2B U121 ( .AN(n63), .B(n92), .Y(n153) );
  XNOR2 U122 ( .A(\u_interval/clk_div[9] ), .B(n93), .Y(n92) );
  NOR2B U123 ( .AN(n63), .B(n94), .Y(n154) );
  XNOR2 U124 ( .A(\u_interval/clk_div[10] ), .B(n95), .Y(n94) );
  NOR2B U125 ( .AN(n63), .B(n96), .Y(n155) );
  XNOR2 U126 ( .A(\u_interval/clk_div[11] ), .B(n97), .Y(n96) );
  NOR2B U127 ( .AN(n63), .B(n98), .Y(n156) );
  XNOR2 U128 ( .A(\u_interval/clk_div[12] ), .B(n99), .Y(n98) );
  NOR2B U129 ( .AN(n63), .B(n100), .Y(n157) );
  XNOR2 U130 ( .A(\u_interval/clk_div[13] ), .B(n101), .Y(n100) );
  NOR2B U131 ( .AN(n63), .B(n102), .Y(n158) );
  XNOR2 U132 ( .A(\u_interval/clk_div[14] ), .B(n103), .Y(n102) );
  NOR2B U133 ( .AN(n63), .B(n104), .Y(n159) );
  XNOR2 U134 ( .A(\u_interval/clk_div[15] ), .B(n105), .Y(n104) );
  NOR2B U135 ( .AN(n103), .B(n106), .Y(n105) );
  NOR2B U136 ( .AN(n101), .B(n107), .Y(n103) );
  INV U137 ( .A(\u_interval/clk_div[13] ), .Y(n107) );
  NOR2B U138 ( .AN(n99), .B(n108), .Y(n101) );
  INV U139 ( .A(\u_interval/clk_div[12] ), .Y(n108) );
  NOR2B U140 ( .AN(n97), .B(n109), .Y(n99) );
  INV U141 ( .A(\u_interval/clk_div[11] ), .Y(n109) );
  NOR2B U142 ( .AN(n95), .B(n110), .Y(n97) );
  INV U143 ( .A(\u_interval/clk_div[10] ), .Y(n110) );
  NOR2B U144 ( .AN(\u_interval/clk_div[9] ), .B(n111), .Y(n95) );
  INV U145 ( .A(n93), .Y(n111) );
  NOR2B U146 ( .AN(\u_interval/clk_div[8] ), .B(n112), .Y(n93) );
  INV U147 ( .A(n91), .Y(n112) );
  NOR2B U148 ( .AN(n89), .B(n113), .Y(n91) );
  INV U149 ( .A(\u_interval/clk_div[7] ), .Y(n113) );
  NOR2B U150 ( .AN(\u_interval/clk_div[6] ), .B(n114), .Y(n89) );
  INV U151 ( .A(n87), .Y(n114) );
  NOR2B U152 ( .AN(n85), .B(n115), .Y(n87) );
  INV U153 ( .A(\u_interval/clk_div[5] ), .Y(n115) );
  NOR2B U154 ( .AN(\u_interval/clk_div[4] ), .B(n83), .Y(n85) );
  OAI21 U155 ( .A0(n117), .A1(n118), .B0(n119), .Y(n160) );
  INV U156 ( .A(n120), .Y(n119) );
  INV U157 ( .A(dir), .Y(n117) );
  OAI2BB1 U158 ( .A0N(interval[0]), .A1N(n121), .B0(n122), .Y(n60) );
  MX2 U159 ( .A(n123), .B(n124), .S0(count[0]), .Y(n122) );
  INV U160 ( .A(n125), .Y(n121) );
  OAI222 U161 ( .A0(n124), .A1(n67), .B0(n123), .B1(n126), .C0(n127), .C1(n125), .Y(n59) );
  INV U162 ( .A(interval[1]), .Y(n127) );
  XOR2 U163 ( .A(n72), .B(n128), .Y(n126) );
  NOR2 U164 ( .A(n71), .B(n129), .Y(n72) );
  NOR2B U165 ( .AN(count[0]), .B(count[1]), .Y(n129) );
  OAI222 U166 ( .A0(n124), .A1(n66), .B0(n130), .B1(n123), .C0(n131), .C1(n125), .Y(n58) );
  AOI2BB2 U167 ( .B0(n120), .B1(n124), .A0N(rst_n), .A1N(dir), .Y(n125) );
  NOR2B U168 ( .AN(n132), .B(dir), .Y(n120) );
  INV U169 ( .A(interval[2]), .Y(n131) );
  AOI31 U170 ( .A0(dir), .A1(n133), .A2(n118), .B0(n128), .Y(n123) );
  NAND3 U171 ( .A(n134), .B(n135), .C(n136), .Y(n118) );
  XNOR2 U172 ( .A(count[1]), .B(interval[1]), .Y(n136) );
  XNOR2 U173 ( .A(count[2]), .B(interval[2]), .Y(n135) );
  XNOR2 U174 ( .A(count[0]), .B(interval[0]), .Y(n134) );
  XNOR2 U175 ( .A(count[2]), .B(n137), .Y(n130) );
  NOR2 U176 ( .A(n71), .B(n138), .Y(n137) );
  MX2 U177 ( .A(n67), .B(count[0]), .S0(n128), .Y(n138) );
  NOR3B U178 ( .AN(n133), .B(n132), .C(dir), .Y(n128) );
  NOR3 U179 ( .A(count[1]), .B(count[2]), .C(count[0]), .Y(n132) );
  INV U180 ( .A(count[1]), .Y(n67) );
  NOR2B U181 ( .AN(count[1]), .B(count[0]), .Y(n71) );
  INV U182 ( .A(count[2]), .Y(n66) );
  NAND2B U183 ( .AN(n133), .B(rst_n), .Y(n124) );
  NOR2B U184 ( .AN(n161), .B(n116), .Y(n133) );
  INV U185 ( .A(rst_n), .Y(n116) );
  NOR2B U186 ( .AN(n139), .B(n83), .Y(n161) );
  NAND2 U187 ( .A(n81), .B(\u_interval/clk_div[3] ), .Y(n83) );
  NOR3B U188 ( .AN(\u_interval/clk_div[2] ), .B(n75), .C(n140), .Y(n81) );
  INV U189 ( .A(\u_interval/clk_div[1] ), .Y(n140) );
  INV U190 ( .A(\u_interval/clk_div[0] ), .Y(n75) );
  NOR4BB U191 ( .AN(\u_interval/clk_div[15] ), .BN(n141), .C(n142), .D(n106), 
        .Y(n139) );
  INV U192 ( .A(\u_interval/clk_div[14] ), .Y(n106) );
  NAND3 U193 ( .A(\u_interval/clk_div[9] ), .B(\u_interval/clk_div[6] ), .C(
        \u_interval/clk_div[8] ), .Y(n142) );
  NOR4B U194 ( .AN(n143), .B(\u_interval/clk_div[12] ), .C(
        \u_interval/clk_div[10] ), .D(\u_interval/clk_div[11] ), .Y(n141) );
  NOR4 U195 ( .A(\u_interval/clk_div[7] ), .B(\u_interval/clk_div[5] ), .C(
        \u_interval/clk_div[4] ), .D(\u_interval/clk_div[13] ), .Y(n143) );
endmodule
