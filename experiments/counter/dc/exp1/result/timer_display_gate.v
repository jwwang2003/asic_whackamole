
module timer_display ( clk, rst_n, interval, dir, seg, timeout );
  input [2:0] interval;
  output [6:0] seg;
  input clk, rst_n, dir;
  output timeout;
  wire   \u_interval/N71 , \u_interval/clk_div[0] , \u_interval/clk_div[1] ,
         \u_interval/clk_div[2] , \u_interval/clk_div[3] ,
         \u_interval/clk_div[4] , \u_interval/clk_div[5] ,
         \u_interval/clk_div[6] , \u_interval/clk_div[7] ,
         \u_interval/clk_div[8] , \u_interval/clk_div[9] ,
         \u_interval/clk_div[10] , \u_interval/clk_div[11] ,
         \u_interval/clk_div[12] , \u_interval/clk_div[13] ,
         \u_interval/clk_div[14] , \u_interval/clk_div[15] , \u_sevenseg/N27 ,
         \u_sevenseg/N26 , \u_sevenseg/N25 , \u_sevenseg/N22 ,
         \u_sevenseg/N18 , \u_sevenseg/N14 , \u_sevenseg/N11 , n55, n56, n57,
         n59, n60, n61, n62, n63, n64, n65, n66, n67, n68, n69, n70, n71, n72,
         n73, n74, n75, n76, n77, n78, n79, n80, n81, n82, n83, n84, n85, n86,
         n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98, n99, n100,
         n101, n102, n103, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158;
  wire   [2:0] count;
  assign seg[0] = \u_sevenseg/N27 ;
  assign seg[1] = \u_sevenseg/N26 ;
  assign seg[2] = \u_sevenseg/N25 ;
  assign seg[3] = \u_sevenseg/N22 ;
  assign seg[4] = \u_sevenseg/N18 ;
  assign seg[5] = \u_sevenseg/N14 ;
  assign seg[6] = \u_sevenseg/N11 ;

  DFFHQ \u_interval/clk_div_reg[15]  ( .D(n158), .CK(clk), .Q(
        \u_interval/clk_div[15] ) );
  DFFHQ \u_interval/count_reg[0]  ( .D(n57), .CK(clk), .Q(count[0]) );
  DFFHQ \u_interval/count_reg[2]  ( .D(n55), .CK(clk), .Q(count[2]) );
  DFFHQ \u_interval/count_reg[1]  ( .D(n56), .CK(clk), .Q(count[1]) );
  DFFHQ \u_interval/timeout_reg  ( .D(\u_interval/N71 ), .CK(clk), .Q(timeout)
         );
  DFFHQ \u_interval/clk_div_reg[14]  ( .D(n157), .CK(clk), .Q(
        \u_interval/clk_div[14] ) );
  DFFHQ \u_interval/clk_div_reg[0]  ( .D(n143), .CK(clk), .Q(
        \u_interval/clk_div[0] ) );
  DFFHQ \u_interval/clk_div_reg[1]  ( .D(n144), .CK(clk), .Q(
        \u_interval/clk_div[1] ) );
  DFFHQ \u_interval/clk_div_reg[2]  ( .D(n145), .CK(clk), .Q(
        \u_interval/clk_div[2] ) );
  DFFHQ \u_interval/clk_div_reg[3]  ( .D(n146), .CK(clk), .Q(
        \u_interval/clk_div[3] ) );
  DFFHQ \u_interval/clk_div_reg[4]  ( .D(n147), .CK(clk), .Q(
        \u_interval/clk_div[4] ) );
  DFFHQ \u_interval/clk_div_reg[5]  ( .D(n148), .CK(clk), .Q(
        \u_interval/clk_div[5] ) );
  DFFHQ \u_interval/clk_div_reg[6]  ( .D(n149), .CK(clk), .Q(
        \u_interval/clk_div[6] ) );
  DFFHQ \u_interval/clk_div_reg[7]  ( .D(n150), .CK(clk), .Q(
        \u_interval/clk_div[7] ) );
  DFFHQ \u_interval/clk_div_reg[8]  ( .D(n151), .CK(clk), .Q(
        \u_interval/clk_div[8] ) );
  DFFHQ \u_interval/clk_div_reg[9]  ( .D(n152), .CK(clk), .Q(
        \u_interval/clk_div[9] ) );
  DFFHQ \u_interval/clk_div_reg[10]  ( .D(n153), .CK(clk), .Q(
        \u_interval/clk_div[10] ) );
  DFFHQ \u_interval/clk_div_reg[11]  ( .D(n154), .CK(clk), .Q(
        \u_interval/clk_div[11] ) );
  DFFHQ \u_interval/clk_div_reg[12]  ( .D(n155), .CK(clk), .Q(
        \u_interval/clk_div[12] ) );
  DFFHQ \u_interval/clk_div_reg[13]  ( .D(n156), .CK(clk), .Q(
        \u_interval/clk_div[13] ) );
  OR2 U84 ( .A(n116), .B(n117), .Y(n59) );
  INV U85 ( .A(n59), .Y(n60) );
  MX2 U86 ( .A(count[1]), .B(n61), .S0(count[2]), .Y(\u_sevenseg/N27 ) );
  INV U87 ( .A(n62), .Y(n61) );
  OAI22 U88 ( .A0(n62), .A1(n63), .B0(count[1]), .B1(count[0]), .Y(
        \u_sevenseg/N26 ) );
  NOR2B U89 ( .AN(count[0]), .B(n64), .Y(n62) );
  OR2 U90 ( .A(\u_sevenseg/N25 ), .B(n65), .Y(\u_sevenseg/N22 ) );
  MX2 U91 ( .A(n66), .B(n63), .S0(count[1]), .Y(n65) );
  NOR2B U92 ( .AN(count[0]), .B(n63), .Y(n66) );
  OAI21 U93 ( .A0(count[2]), .A1(count[0]), .B0(n67), .Y(\u_sevenseg/N25 ) );
  INV U94 ( .A(n68), .Y(n67) );
  NAND2B U95 ( .AN(count[2]), .B(n68), .Y(\u_sevenseg/N18 ) );
  NAND2B U96 ( .AN(n69), .B(count[2]), .Y(\u_sevenseg/N14 ) );
  NAND2B U97 ( .AN(count[1]), .B(n70), .Y(\u_sevenseg/N11 ) );
  XOR2 U98 ( .A(count[2]), .B(count[0]), .Y(n70) );
  NOR3B U99 ( .AN(n71), .B(n72), .C(n73), .Y(\u_interval/N71 ) );
  MX2 U100 ( .A(n74), .B(n143), .S0(\u_interval/clk_div[1] ), .Y(n144) );
  NOR2B U101 ( .AN(n60), .B(n75), .Y(n74) );
  OAI2BB2 U102 ( .B0(n76), .B1(n77), .A0N(n60), .A1N(n78), .Y(n145) );
  MX2 U103 ( .A(\u_interval/clk_div[2] ), .B(n79), .S0(\u_interval/clk_div[1] ), .Y(n78) );
  NOR2 U104 ( .A(\u_interval/clk_div[2] ), .B(n75), .Y(n79) );
  INV U105 ( .A(n143), .Y(n77) );
  NOR2B U106 ( .AN(n60), .B(\u_interval/clk_div[0] ), .Y(n143) );
  INV U107 ( .A(\u_interval/clk_div[2] ), .Y(n76) );
  NOR2B U108 ( .AN(n60), .B(n80), .Y(n146) );
  XNOR2 U109 ( .A(n81), .B(\u_interval/clk_div[3] ), .Y(n80) );
  NOR2B U110 ( .AN(n60), .B(n82), .Y(n147) );
  XOR2 U111 ( .A(\u_interval/clk_div[4] ), .B(n83), .Y(n82) );
  NOR2B U112 ( .AN(n60), .B(n84), .Y(n148) );
  XNOR2 U113 ( .A(\u_interval/clk_div[5] ), .B(n85), .Y(n84) );
  NOR2B U114 ( .AN(n60), .B(n86), .Y(n149) );
  XNOR2 U115 ( .A(\u_interval/clk_div[6] ), .B(n87), .Y(n86) );
  NOR2B U116 ( .AN(n60), .B(n88), .Y(n150) );
  XNOR2 U117 ( .A(\u_interval/clk_div[7] ), .B(n89), .Y(n88) );
  NOR2B U118 ( .AN(n60), .B(n90), .Y(n151) );
  XNOR2 U119 ( .A(\u_interval/clk_div[8] ), .B(n91), .Y(n90) );
  NOR2B U120 ( .AN(n60), .B(n92), .Y(n152) );
  XNOR2 U121 ( .A(\u_interval/clk_div[9] ), .B(n93), .Y(n92) );
  NOR2B U122 ( .AN(n60), .B(n94), .Y(n153) );
  XNOR2 U123 ( .A(\u_interval/clk_div[10] ), .B(n95), .Y(n94) );
  NOR2B U124 ( .AN(n60), .B(n96), .Y(n154) );
  XNOR2 U125 ( .A(\u_interval/clk_div[11] ), .B(n97), .Y(n96) );
  NOR2B U126 ( .AN(n60), .B(n98), .Y(n155) );
  XNOR2 U127 ( .A(\u_interval/clk_div[12] ), .B(n99), .Y(n98) );
  NOR2B U128 ( .AN(n60), .B(n100), .Y(n156) );
  XNOR2 U129 ( .A(\u_interval/clk_div[13] ), .B(n101), .Y(n100) );
  NOR2B U130 ( .AN(n60), .B(n102), .Y(n157) );
  XNOR2 U131 ( .A(\u_interval/clk_div[14] ), .B(n103), .Y(n102) );
  NOR2B U132 ( .AN(n60), .B(n104), .Y(n158) );
  XNOR2 U133 ( .A(\u_interval/clk_div[15] ), .B(n105), .Y(n104) );
  NOR2B U134 ( .AN(n103), .B(n106), .Y(n105) );
  NOR2B U135 ( .AN(n101), .B(n107), .Y(n103) );
  INV U136 ( .A(\u_interval/clk_div[13] ), .Y(n107) );
  NOR2B U137 ( .AN(n99), .B(n108), .Y(n101) );
  INV U138 ( .A(\u_interval/clk_div[12] ), .Y(n108) );
  NOR2B U139 ( .AN(n97), .B(n109), .Y(n99) );
  INV U140 ( .A(\u_interval/clk_div[11] ), .Y(n109) );
  NOR2B U141 ( .AN(n95), .B(n110), .Y(n97) );
  INV U142 ( .A(\u_interval/clk_div[10] ), .Y(n110) );
  NOR2B U143 ( .AN(\u_interval/clk_div[9] ), .B(n111), .Y(n95) );
  INV U144 ( .A(n93), .Y(n111) );
  NOR2B U145 ( .AN(\u_interval/clk_div[8] ), .B(n112), .Y(n93) );
  INV U146 ( .A(n91), .Y(n112) );
  NOR2B U147 ( .AN(n89), .B(n113), .Y(n91) );
  INV U148 ( .A(\u_interval/clk_div[7] ), .Y(n113) );
  NOR2B U149 ( .AN(\u_interval/clk_div[6] ), .B(n114), .Y(n89) );
  INV U150 ( .A(n87), .Y(n114) );
  NOR2B U151 ( .AN(n85), .B(n115), .Y(n87) );
  INV U152 ( .A(\u_interval/clk_div[5] ), .Y(n115) );
  NOR2B U153 ( .AN(\u_interval/clk_div[4] ), .B(n83), .Y(n85) );
  OAI2BB1 U154 ( .A0N(interval[0]), .A1N(n118), .B0(n119), .Y(n57) );
  MX2 U155 ( .A(n120), .B(n121), .S0(count[0]), .Y(n119) );
  INV U156 ( .A(n122), .Y(n118) );
  OAI222 U157 ( .A0(n121), .A1(n64), .B0(n120), .B1(n123), .C0(n124), .C1(n122), .Y(n56) );
  INV U158 ( .A(interval[1]), .Y(n124) );
  XOR2 U159 ( .A(n69), .B(n125), .Y(n123) );
  NOR2 U160 ( .A(n68), .B(n126), .Y(n69) );
  NOR2B U161 ( .AN(count[0]), .B(count[1]), .Y(n126) );
  OAI222 U162 ( .A0(n121), .A1(n63), .B0(n127), .B1(n120), .C0(n128), .C1(n122), .Y(n55) );
  AOI2BB2 U163 ( .B0(n129), .B1(n121), .A0N(rst_n), .A1N(dir), .Y(n122) );
  NOR2B U164 ( .AN(n130), .B(dir), .Y(n129) );
  INV U165 ( .A(interval[2]), .Y(n128) );
  NOR2 U166 ( .A(n125), .B(n131), .Y(n120) );
  NOR2B U167 ( .AN(n132), .B(n71), .Y(n131) );
  OAI31 U168 ( .A0(n133), .A1(n134), .A2(n135), .B0(dir), .Y(n71) );
  XOR2 U169 ( .A(count[1]), .B(interval[1]), .Y(n135) );
  XOR2 U170 ( .A(count[2]), .B(interval[2]), .Y(n134) );
  XOR2 U171 ( .A(count[0]), .B(interval[0]), .Y(n133) );
  XNOR2 U172 ( .A(count[2]), .B(n136), .Y(n127) );
  NOR2 U173 ( .A(n68), .B(n137), .Y(n136) );
  MX2 U174 ( .A(n64), .B(count[0]), .S0(n125), .Y(n137) );
  NOR2B U175 ( .AN(n72), .B(n73), .Y(n125) );
  INV U176 ( .A(n132), .Y(n73) );
  NOR2 U177 ( .A(dir), .B(n130), .Y(n72) );
  NOR3 U178 ( .A(count[1]), .B(count[2]), .C(count[0]), .Y(n130) );
  INV U179 ( .A(count[1]), .Y(n64) );
  NOR2B U180 ( .AN(count[1]), .B(count[0]), .Y(n68) );
  INV U181 ( .A(count[2]), .Y(n63) );
  NAND2B U182 ( .AN(n132), .B(rst_n), .Y(n121) );
  NOR2B U183 ( .AN(n116), .B(n117), .Y(n132) );
  INV U184 ( .A(rst_n), .Y(n117) );
  NOR2B U185 ( .AN(n138), .B(n83), .Y(n116) );
  NAND2 U186 ( .A(n81), .B(\u_interval/clk_div[3] ), .Y(n83) );
  NOR3B U187 ( .AN(\u_interval/clk_div[2] ), .B(n75), .C(n139), .Y(n81) );
  INV U188 ( .A(\u_interval/clk_div[1] ), .Y(n139) );
  INV U189 ( .A(\u_interval/clk_div[0] ), .Y(n75) );
  NOR4BB U190 ( .AN(\u_interval/clk_div[15] ), .BN(n140), .C(n141), .D(n106), 
        .Y(n138) );
  INV U191 ( .A(\u_interval/clk_div[14] ), .Y(n106) );
  NAND3 U192 ( .A(\u_interval/clk_div[9] ), .B(\u_interval/clk_div[6] ), .C(
        \u_interval/clk_div[8] ), .Y(n141) );
  NOR4B U193 ( .AN(n142), .B(\u_interval/clk_div[12] ), .C(
        \u_interval/clk_div[10] ), .D(\u_interval/clk_div[11] ), .Y(n140) );
  NOR4 U194 ( .A(\u_interval/clk_div[7] ), .B(\u_interval/clk_div[5] ), .C(
        \u_interval/clk_div[4] ), .D(\u_interval/clk_div[13] ), .Y(n142) );
endmodule

