
module timer_display ( clk, rst_n, interval, dir, seg, timeout );
  input [2:0] interval;
  output [6:0] seg;
  input clk, rst_n, dir;
  output timeout;
  wire   \u_interval/N86 , \u_interval/finished , \u_interval/clk_div[0] ,
         \u_interval/clk_div[1] , \u_interval/clk_div[2] ,
         \u_interval/clk_div[3] , \u_interval/clk_div[4] ,
         \u_interval/clk_div[5] , \u_interval/clk_div[6] ,
         \u_interval/clk_div[7] , \u_interval/clk_div[8] ,
         \u_interval/clk_div[9] , \u_interval/clk_div[10] ,
         \u_interval/clk_div[11] , \u_interval/clk_div[12] ,
         \u_interval/clk_div[13] , \u_interval/clk_div[14] ,
         \u_interval/clk_div[15] , \u_sevenseg/N26 , \u_sevenseg/N25 ,
         \u_sevenseg/N22 , \u_sevenseg/N18 , \u_sevenseg/N14 ,
         \u_sevenseg/N11 , n66, n67, n68, n69, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n120, n121, n122, n123, n124, n125,
         n126, n127, n128, n129, n130, n131, n132, n133, n134, n135, n136,
         n137, n138, n139, n140, n141, n142, n143, n144, n145, n146, n147,
         n148, n149, n150, n151, n152, n153, n154, n155, n156, n157, n158,
         n159, n160, n161, n162, n163, n164, n165, n166, n167, n168, n169,
         n170, n171, n172, n173, n174, n175, n176;
  wire   [2:0] count;
  assign seg[1] = \u_sevenseg/N26 ;
  assign seg[2] = \u_sevenseg/N25 ;
  assign seg[3] = \u_sevenseg/N22 ;
  assign seg[4] = \u_sevenseg/N18 ;
  assign seg[5] = \u_sevenseg/N14 ;
  assign seg[6] = \u_sevenseg/N11 ;

  DFFHQ \u_interval/clk_div_reg[15]  ( .D(n176), .CK(clk), .Q(
        \u_interval/clk_div[15] ) );
  DFFHQ \u_interval/clk_div_reg[14]  ( .D(n175), .CK(clk), .Q(
        \u_interval/clk_div[14] ) );
  DFFHQ \u_interval/clk_div_reg[0]  ( .D(n161), .CK(clk), .Q(
        \u_interval/clk_div[0] ) );
  DFFHQ \u_interval/clk_div_reg[1]  ( .D(n162), .CK(clk), .Q(
        \u_interval/clk_div[1] ) );
  DFFHQ \u_interval/clk_div_reg[2]  ( .D(n163), .CK(clk), .Q(
        \u_interval/clk_div[2] ) );
  DFFHQ \u_interval/clk_div_reg[3]  ( .D(n164), .CK(clk), .Q(
        \u_interval/clk_div[3] ) );
  DFFHQ \u_interval/clk_div_reg[4]  ( .D(n165), .CK(clk), .Q(
        \u_interval/clk_div[4] ) );
  DFFHQ \u_interval/clk_div_reg[5]  ( .D(n166), .CK(clk), .Q(
        \u_interval/clk_div[5] ) );
  DFFHQ \u_interval/clk_div_reg[6]  ( .D(n167), .CK(clk), .Q(
        \u_interval/clk_div[6] ) );
  DFFHQ \u_interval/clk_div_reg[7]  ( .D(n168), .CK(clk), .Q(
        \u_interval/clk_div[7] ) );
  DFFHQ \u_interval/clk_div_reg[8]  ( .D(n169), .CK(clk), .Q(
        \u_interval/clk_div[8] ) );
  DFFHQ \u_interval/clk_div_reg[9]  ( .D(n170), .CK(clk), .Q(
        \u_interval/clk_div[9] ) );
  DFFHQ \u_interval/clk_div_reg[10]  ( .D(n171), .CK(clk), .Q(
        \u_interval/clk_div[10] ) );
  DFFHQ \u_interval/clk_div_reg[11]  ( .D(n172), .CK(clk), .Q(
        \u_interval/clk_div[11] ) );
  DFFHQ \u_interval/clk_div_reg[12]  ( .D(n173), .CK(clk), .Q(
        \u_interval/clk_div[12] ) );
  DFFHQ \u_interval/clk_div_reg[13]  ( .D(n174), .CK(clk), .Q(
        \u_interval/clk_div[13] ) );
  DFFHQ \u_interval/count_reg[0]  ( .D(n68), .CK(clk), .Q(count[0]) );
  DFFHQ \u_interval/count_reg[1]  ( .D(n67), .CK(clk), .Q(count[1]) );
  DFFHQ \u_interval/count_reg[2]  ( .D(n69), .CK(clk), .Q(count[2]) );
  DFFHQ \u_interval/finished_reg  ( .D(n66), .CK(clk), .Q(
        \u_interval/finished ) );
  DFFHQ \u_interval/timeout_reg  ( .D(\u_interval/N86 ), .CK(clk), .Q(timeout)
         );
  OAI22 U95 ( .A0(n71), .A1(n72), .B0(count[0]), .B1(count[1]), .Y(
        \u_sevenseg/N26 ) );
  OAI211 U96 ( .A0(n72), .A1(n73), .B0(n74), .C0(n75), .Y(\u_sevenseg/N22 ) );
  INV U97 ( .A(\u_sevenseg/N25 ), .Y(n74) );
  NAND2B U98 ( .AN(n76), .B(n77), .Y(\u_sevenseg/N25 ) );
  INV U99 ( .A(n78), .Y(n73) );
  NAND2 U100 ( .A(count[1]), .B(n79), .Y(\u_sevenseg/N18 ) );
  NAND2B U101 ( .AN(n80), .B(count[2]), .Y(\u_sevenseg/N14 ) );
  OAI211 U102 ( .A0(n81), .A1(n72), .B0(n82), .C0(n77), .Y(\u_sevenseg/N11 )
         );
  INV U103 ( .A(n79), .Y(n77) );
  OAI2BB1 U104 ( .A0N(n83), .A1N(n84), .B0(n85), .Y(\u_interval/N86 ) );
  INV U105 ( .A(dir), .Y(n84) );
  MX2 U106 ( .A(n86), .B(n161), .S0(\u_interval/clk_div[1] ), .Y(n162) );
  NOR2B U107 ( .AN(\u_interval/clk_div[0] ), .B(n87), .Y(n86) );
  OAI2BB2 U108 ( .B0(n88), .B1(n89), .A0N(n90), .A1N(n91), .Y(n163) );
  MX2 U109 ( .A(\u_interval/clk_div[2] ), .B(n92), .S0(\u_interval/clk_div[1] ), .Y(n91) );
  NOR2B U110 ( .AN(\u_interval/clk_div[0] ), .B(\u_interval/clk_div[2] ), .Y(
        n92) );
  INV U111 ( .A(n161), .Y(n89) );
  NOR2B U112 ( .AN(n90), .B(\u_interval/clk_div[0] ), .Y(n161) );
  INV U113 ( .A(\u_interval/clk_div[2] ), .Y(n88) );
  NOR2 U114 ( .A(n87), .B(n93), .Y(n164) );
  XOR2 U115 ( .A(\u_interval/clk_div[3] ), .B(n94), .Y(n93) );
  NOR2 U116 ( .A(n87), .B(n95), .Y(n165) );
  XNOR2 U117 ( .A(n96), .B(\u_interval/clk_div[4] ), .Y(n95) );
  NOR2 U118 ( .A(n87), .B(n97), .Y(n166) );
  XNOR2 U119 ( .A(\u_interval/clk_div[5] ), .B(n98), .Y(n97) );
  NOR2 U120 ( .A(n87), .B(n99), .Y(n167) );
  XNOR2 U121 ( .A(\u_interval/clk_div[6] ), .B(n100), .Y(n99) );
  NOR2 U122 ( .A(n87), .B(n101), .Y(n168) );
  XNOR2 U123 ( .A(\u_interval/clk_div[7] ), .B(n102), .Y(n101) );
  NOR2 U124 ( .A(n87), .B(n103), .Y(n169) );
  XNOR2 U125 ( .A(\u_interval/clk_div[8] ), .B(n104), .Y(n103) );
  NOR2 U126 ( .A(n87), .B(n105), .Y(n170) );
  XNOR2 U127 ( .A(\u_interval/clk_div[9] ), .B(n106), .Y(n105) );
  NOR2 U128 ( .A(n87), .B(n107), .Y(n171) );
  XNOR2 U129 ( .A(\u_interval/clk_div[10] ), .B(n108), .Y(n107) );
  NOR2 U130 ( .A(n87), .B(n109), .Y(n172) );
  XNOR2 U131 ( .A(\u_interval/clk_div[11] ), .B(n110), .Y(n109) );
  NOR2 U132 ( .A(n87), .B(n111), .Y(n173) );
  XNOR2 U133 ( .A(\u_interval/clk_div[12] ), .B(n112), .Y(n111) );
  NOR2 U134 ( .A(n87), .B(n113), .Y(n174) );
  XNOR2 U135 ( .A(\u_interval/clk_div[13] ), .B(n114), .Y(n113) );
  NOR2 U136 ( .A(n87), .B(n115), .Y(n175) );
  XNOR2 U137 ( .A(\u_interval/clk_div[14] ), .B(n116), .Y(n115) );
  NOR2 U138 ( .A(n87), .B(n117), .Y(n176) );
  XNOR2 U139 ( .A(\u_interval/clk_div[15] ), .B(n118), .Y(n117) );
  NOR2B U140 ( .AN(n116), .B(n119), .Y(n118) );
  NOR2B U141 ( .AN(n114), .B(n120), .Y(n116) );
  INV U142 ( .A(\u_interval/clk_div[13] ), .Y(n120) );
  NOR2B U143 ( .AN(n112), .B(n121), .Y(n114) );
  INV U144 ( .A(\u_interval/clk_div[12] ), .Y(n121) );
  NOR2B U145 ( .AN(n110), .B(n122), .Y(n112) );
  INV U146 ( .A(\u_interval/clk_div[11] ), .Y(n122) );
  NOR2B U147 ( .AN(n108), .B(n123), .Y(n110) );
  INV U148 ( .A(\u_interval/clk_div[10] ), .Y(n123) );
  NOR2B U149 ( .AN(\u_interval/clk_div[9] ), .B(n124), .Y(n108) );
  INV U150 ( .A(n106), .Y(n124) );
  NOR2B U151 ( .AN(\u_interval/clk_div[8] ), .B(n125), .Y(n106) );
  INV U152 ( .A(n104), .Y(n125) );
  NOR2B U153 ( .AN(n102), .B(n126), .Y(n104) );
  INV U154 ( .A(\u_interval/clk_div[7] ), .Y(n126) );
  NOR2B U155 ( .AN(\u_interval/clk_div[6] ), .B(n127), .Y(n102) );
  INV U156 ( .A(n100), .Y(n127) );
  NOR2B U157 ( .AN(n98), .B(n128), .Y(n100) );
  INV U158 ( .A(\u_interval/clk_div[5] ), .Y(n128) );
  NOR2B U159 ( .AN(n96), .B(n129), .Y(n98) );
  INV U160 ( .A(\u_interval/clk_div[4] ), .Y(n129) );
  INV U161 ( .A(n90), .Y(n87) );
  NOR2B U162 ( .AN(rst_n), .B(n130), .Y(n90) );
  OAI21 U163 ( .A0(n71), .A1(n72), .B0(n75), .Y(seg[0]) );
  NAND2B U164 ( .AN(count[2]), .B(count[1]), .Y(n75) );
  NOR2B U165 ( .AN(count[0]), .B(n82), .Y(n71) );
  OAI222 U166 ( .A0(n131), .A1(n132), .B0(n133), .B1(n72), .C0(n134), .C1(n135), .Y(n69) );
  INV U167 ( .A(interval[2]), .Y(n135) );
  INV U168 ( .A(n136), .Y(n134) );
  INV U169 ( .A(count[2]), .Y(n72) );
  XNOR2 U170 ( .A(count[2]), .B(n137), .Y(n131) );
  NOR2 U171 ( .A(n78), .B(n138), .Y(n137) );
  MX2 U172 ( .A(n81), .B(count[1]), .S0(n139), .Y(n138) );
  OAI2BB1 U173 ( .A0N(interval[0]), .A1N(n136), .B0(n140), .Y(n68) );
  MX2 U174 ( .A(n132), .B(n133), .S0(count[0]), .Y(n140) );
  INV U175 ( .A(n141), .Y(n133) );
  INV U176 ( .A(n142), .Y(n132) );
  INV U177 ( .A(n143), .Y(n67) );
  AOI222 U178 ( .A0(n144), .A1(n142), .B0(interval[1]), .B1(n136), .C0(
        count[1]), .C1(n141), .Y(n143) );
  AOI211 U179 ( .A0(n130), .A1(n145), .B0(dir), .C0(n141), .Y(n136) );
  NOR2B U180 ( .AN(rst_n), .B(n142), .Y(n141) );
  NOR2 U181 ( .A(n83), .B(\u_interval/finished ), .Y(n145) );
  INV U182 ( .A(n146), .Y(n130) );
  AOI211 U183 ( .A0(n147), .A1(n148), .B0(\u_interval/finished ), .C0(n146), 
        .Y(n142) );
  NAND2 U184 ( .A(n96), .B(n149), .Y(n146) );
  NOR4BB U185 ( .AN(\u_interval/clk_div[15] ), .BN(n150), .C(n151), .D(n119), 
        .Y(n149) );
  INV U186 ( .A(\u_interval/clk_div[14] ), .Y(n119) );
  NAND3 U187 ( .A(\u_interval/clk_div[9] ), .B(\u_interval/clk_div[6] ), .C(
        \u_interval/clk_div[8] ), .Y(n151) );
  NOR4B U188 ( .AN(n152), .B(\u_interval/clk_div[12] ), .C(
        \u_interval/clk_div[10] ), .D(\u_interval/clk_div[11] ), .Y(n150) );
  NOR4 U189 ( .A(\u_interval/clk_div[7] ), .B(\u_interval/clk_div[5] ), .C(
        \u_interval/clk_div[4] ), .D(\u_interval/clk_div[13] ), .Y(n152) );
  NOR2B U190 ( .AN(\u_interval/clk_div[3] ), .B(n94), .Y(n96) );
  NAND3 U191 ( .A(\u_interval/clk_div[2] ), .B(\u_interval/clk_div[0] ), .C(
        \u_interval/clk_div[1] ), .Y(n94) );
  INV U192 ( .A(n139), .Y(n148) );
  OAI211 U193 ( .A0(n153), .A1(n154), .B0(n155), .C0(n156), .Y(n147) );
  XNOR2 U194 ( .A(n80), .B(n139), .Y(n144) );
  NOR2 U195 ( .A(dir), .B(n83), .Y(n139) );
  NOR2B U196 ( .AN(n79), .B(count[1]), .Y(n83) );
  NOR2 U197 ( .A(count[0]), .B(count[2]), .Y(n79) );
  NOR2 U198 ( .A(n76), .B(n78), .Y(n80) );
  NOR2B U199 ( .AN(count[0]), .B(count[1]), .Y(n78) );
  NOR2B U200 ( .AN(count[1]), .B(count[0]), .Y(n76) );
  OAI2BB1 U201 ( .A0N(rst_n), .A1N(\u_interval/finished ), .B0(n85), .Y(n66)
         );
  OAI211 U202 ( .A0(interval[0]), .A1(n81), .B0(n157), .C0(n154), .Y(n85) );
  NAND2B U203 ( .AN(interval[1]), .B(count[1]), .Y(n154) );
  NOR2B U204 ( .AN(n155), .B(n156), .Y(n157) );
  INV U205 ( .A(n158), .Y(n156) );
  AOI211 U206 ( .A0(interval[1]), .A1(n82), .B0(n159), .C0(n153), .Y(n158) );
  NOR2B U207 ( .AN(interval[2]), .B(count[2]), .Y(n153) );
  NOR2B U208 ( .AN(interval[0]), .B(count[0]), .Y(n159) );
  INV U209 ( .A(count[1]), .Y(n82) );
  NOR2B U210 ( .AN(dir), .B(n160), .Y(n155) );
  NOR2B U211 ( .AN(count[2]), .B(interval[2]), .Y(n160) );
  INV U212 ( .A(count[0]), .Y(n81) );
endmodule
