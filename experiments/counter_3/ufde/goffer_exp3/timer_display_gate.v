
module timer_display ( clk, rst_n, reset_signal, interval, dir, seg, timeout
 );
  input [2:0] interval;
  output [6:0] seg;
  input clk, rst_n, reset_signal, dir;
  output timeout;
  wire   \u_interval/N72 , \u_interval/finished , \u_interval/clk_div[0] ,
         \u_interval/clk_div[1] , \u_interval/clk_div[2] ,
         \u_interval/clk_div[3] , \u_interval/clk_div[4] ,
         \u_interval/clk_div[5] , \u_interval/clk_div[6] ,
         \u_interval/clk_div[7] , \u_interval/clk_div[8] ,
         \u_interval/clk_div[9] , \u_interval/clk_div[10] ,
         \u_interval/clk_div[11] , \u_interval/clk_div[12] ,
         \u_interval/clk_div[13] , \u_interval/clk_div[14] ,
         \u_interval/clk_div[15] , \u_sevenseg/N26 , \u_sevenseg/N25 ,
         \u_sevenseg/N22 , \u_sevenseg/N18 , \u_sevenseg/N14 ,
         \u_sevenseg/N11 , n74, n75, n76, n77, n79, n80, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97, n98,
         n99, n100, n101, n102, n103, n104, n105, n106, n107, n108, n109, n110,
         n111, n112, n113, n114, n115, n116, n117, n118, n119, n120, n121,
         n122, n123, n124, n125, n126, n127, n128, n129, n130, n131, n132,
         n133, n134, n135, n136, n137, n138, n139, n140, n141, n142, n143,
         n144, n145, n146, n147, n148, n149, n150, n151, n152, n153, n154,
         n155, n156, n157, n158, n159, n160, n161, n162, n163, n164, n165,
         n166, n167, n168, n169, n170, n171, n172, n173, n174, n175, n176,
         n177, n178, n179, n180, n181, n182, n183;
  wire   [2:0] count;
  assign seg[1] = \u_sevenseg/N26 ;
  assign seg[2] = \u_sevenseg/N25 ;
  assign seg[3] = \u_sevenseg/N22 ;
  assign seg[4] = \u_sevenseg/N18 ;
  assign seg[5] = \u_sevenseg/N14 ;
  assign seg[6] = \u_sevenseg/N11 ;

  DFFHQ \u_interval/clk_div_reg[15]  ( .D(n183), .CK(clk), .Q(
        \u_interval/clk_div[15] ) );
  DFFHQ \u_interval/clk_div_reg[14]  ( .D(n182), .CK(clk), .Q(
        \u_interval/clk_div[14] ) );
  DFFHQ \u_interval/clk_div_reg[0]  ( .D(n168), .CK(clk), .Q(
        \u_interval/clk_div[0] ) );
  DFFHQ \u_interval/clk_div_reg[1]  ( .D(n169), .CK(clk), .Q(
        \u_interval/clk_div[1] ) );
  DFFHQ \u_interval/clk_div_reg[2]  ( .D(n170), .CK(clk), .Q(
        \u_interval/clk_div[2] ) );
  DFFHQ \u_interval/clk_div_reg[3]  ( .D(n171), .CK(clk), .Q(
        \u_interval/clk_div[3] ) );
  DFFHQ \u_interval/clk_div_reg[4]  ( .D(n172), .CK(clk), .Q(
        \u_interval/clk_div[4] ) );
  DFFHQ \u_interval/clk_div_reg[5]  ( .D(n173), .CK(clk), .Q(
        \u_interval/clk_div[5] ) );
  DFFHQ \u_interval/clk_div_reg[6]  ( .D(n174), .CK(clk), .Q(
        \u_interval/clk_div[6] ) );
  DFFHQ \u_interval/clk_div_reg[7]  ( .D(n175), .CK(clk), .Q(
        \u_interval/clk_div[7] ) );
  DFFHQ \u_interval/clk_div_reg[8]  ( .D(n176), .CK(clk), .Q(
        \u_interval/clk_div[8] ) );
  DFFHQ \u_interval/clk_div_reg[9]  ( .D(n177), .CK(clk), .Q(
        \u_interval/clk_div[9] ) );
  DFFHQ \u_interval/clk_div_reg[10]  ( .D(n178), .CK(clk), .Q(
        \u_interval/clk_div[10] ) );
  DFFHQ \u_interval/clk_div_reg[11]  ( .D(n179), .CK(clk), .Q(
        \u_interval/clk_div[11] ) );
  DFFHQ \u_interval/clk_div_reg[12]  ( .D(n180), .CK(clk), .Q(
        \u_interval/clk_div[12] ) );
  DFFHQ \u_interval/clk_div_reg[13]  ( .D(n181), .CK(clk), .Q(
        \u_interval/clk_div[13] ) );
  DFFHQ \u_interval/count_reg[0]  ( .D(n76), .CK(clk), .Q(count[0]) );
  DFFHQ \u_interval/count_reg[1]  ( .D(n75), .CK(clk), .Q(count[1]) );
  DFFHQ \u_interval/count_reg[2]  ( .D(n77), .CK(clk), .Q(count[2]) );
  DFFHQ \u_interval/timeout_reg  ( .D(\u_interval/N72 ), .CK(clk), .Q(timeout)
         );
  DFFHQ \u_interval/finished_reg  ( .D(n74), .CK(clk), .Q(
        \u_interval/finished ) );
  INV U103 ( .A(n90), .Y(n79) );
  INV U104 ( .A(n79), .Y(n80) );
  OAI21 U105 ( .A0(n81), .A1(n82), .B0(n83), .Y(\u_sevenseg/N26 ) );
  OR2 U106 ( .A(\u_sevenseg/N25 ), .B(n84), .Y(\u_sevenseg/N22 ) );
  MX2 U107 ( .A(n85), .B(n82), .S0(count[1]), .Y(n84) );
  NOR2 U108 ( .A(n86), .B(n82), .Y(n85) );
  AOI2BB1 U109 ( .A0N(count[1]), .A1N(n82), .B0(count[0]), .Y(\u_sevenseg/N25 ) );
  INV U110 ( .A(count[2]), .Y(n82) );
  NAND2 U111 ( .A(count[1]), .B(n87), .Y(\u_sevenseg/N18 ) );
  NAND3B U112 ( .AN(n81), .B(count[2]), .C(n83), .Y(\u_sevenseg/N14 ) );
  OR2 U113 ( .A(count[0]), .B(count[1]), .Y(n83) );
  NAND2B U114 ( .AN(count[1]), .B(n88), .Y(\u_sevenseg/N11 ) );
  XOR2 U115 ( .A(count[0]), .B(count[2]), .Y(n88) );
  MX2 U116 ( .A(n89), .B(n168), .S0(\u_interval/clk_div[1] ), .Y(n169) );
  NOR2B U117 ( .AN(n80), .B(n91), .Y(n89) );
  OAI2BB2 U118 ( .B0(n92), .B1(n93), .A0N(n80), .A1N(n94), .Y(n170) );
  MX2 U119 ( .A(\u_interval/clk_div[2] ), .B(n95), .S0(\u_interval/clk_div[1] ), .Y(n94) );
  NOR2B U120 ( .AN(\u_interval/clk_div[0] ), .B(\u_interval/clk_div[2] ), .Y(
        n95) );
  INV U121 ( .A(n168), .Y(n93) );
  NOR2B U122 ( .AN(n80), .B(\u_interval/clk_div[0] ), .Y(n168) );
  INV U123 ( .A(\u_interval/clk_div[2] ), .Y(n92) );
  NOR2B U124 ( .AN(n80), .B(n96), .Y(n171) );
  XNOR2 U125 ( .A(n97), .B(\u_interval/clk_div[3] ), .Y(n96) );
  NOR2B U126 ( .AN(n80), .B(n98), .Y(n172) );
  XOR2 U127 ( .A(\u_interval/clk_div[4] ), .B(n99), .Y(n98) );
  NOR2B U128 ( .AN(n80), .B(n100), .Y(n173) );
  XNOR2 U129 ( .A(\u_interval/clk_div[5] ), .B(n101), .Y(n100) );
  NOR2B U130 ( .AN(n80), .B(n102), .Y(n174) );
  XNOR2 U131 ( .A(\u_interval/clk_div[6] ), .B(n103), .Y(n102) );
  NOR2B U132 ( .AN(n80), .B(n104), .Y(n175) );
  XNOR2 U133 ( .A(\u_interval/clk_div[7] ), .B(n105), .Y(n104) );
  NOR2B U134 ( .AN(n80), .B(n106), .Y(n176) );
  XNOR2 U135 ( .A(\u_interval/clk_div[8] ), .B(n107), .Y(n106) );
  NOR2B U136 ( .AN(n80), .B(n108), .Y(n177) );
  XNOR2 U137 ( .A(\u_interval/clk_div[9] ), .B(n109), .Y(n108) );
  NOR2B U138 ( .AN(n80), .B(n110), .Y(n178) );
  XNOR2 U139 ( .A(\u_interval/clk_div[10] ), .B(n111), .Y(n110) );
  NOR2B U140 ( .AN(n80), .B(n112), .Y(n179) );
  XNOR2 U141 ( .A(\u_interval/clk_div[11] ), .B(n113), .Y(n112) );
  NOR2B U142 ( .AN(n80), .B(n114), .Y(n180) );
  XNOR2 U143 ( .A(\u_interval/clk_div[12] ), .B(n115), .Y(n114) );
  NOR2B U144 ( .AN(n80), .B(n116), .Y(n181) );
  XNOR2 U145 ( .A(\u_interval/clk_div[13] ), .B(n117), .Y(n116) );
  NOR2B U146 ( .AN(n80), .B(n118), .Y(n182) );
  XNOR2 U147 ( .A(\u_interval/clk_div[14] ), .B(n119), .Y(n118) );
  NOR2B U148 ( .AN(n80), .B(n120), .Y(n183) );
  XNOR2 U149 ( .A(\u_interval/clk_div[15] ), .B(n121), .Y(n120) );
  NOR2B U150 ( .AN(n119), .B(n122), .Y(n121) );
  NOR2B U151 ( .AN(n117), .B(n123), .Y(n119) );
  INV U152 ( .A(\u_interval/clk_div[13] ), .Y(n123) );
  NOR2B U153 ( .AN(n115), .B(n124), .Y(n117) );
  INV U154 ( .A(\u_interval/clk_div[12] ), .Y(n124) );
  NOR2B U155 ( .AN(n113), .B(n125), .Y(n115) );
  INV U156 ( .A(\u_interval/clk_div[11] ), .Y(n125) );
  NOR2B U157 ( .AN(n111), .B(n126), .Y(n113) );
  INV U158 ( .A(\u_interval/clk_div[10] ), .Y(n126) );
  NOR2B U159 ( .AN(\u_interval/clk_div[9] ), .B(n127), .Y(n111) );
  INV U160 ( .A(n109), .Y(n127) );
  NOR2B U161 ( .AN(\u_interval/clk_div[8] ), .B(n128), .Y(n109) );
  INV U162 ( .A(n107), .Y(n128) );
  NOR2B U163 ( .AN(n105), .B(n129), .Y(n107) );
  INV U164 ( .A(\u_interval/clk_div[7] ), .Y(n129) );
  NOR2B U165 ( .AN(\u_interval/clk_div[6] ), .B(n130), .Y(n105) );
  INV U166 ( .A(n103), .Y(n130) );
  NOR2B U167 ( .AN(n101), .B(n131), .Y(n103) );
  INV U168 ( .A(\u_interval/clk_div[5] ), .Y(n131) );
  NOR2B U169 ( .AN(\u_interval/clk_div[4] ), .B(n99), .Y(n101) );
  NOR2B U170 ( .AN(rst_n), .B(n132), .Y(n90) );
  MX2 U171 ( .A(count[1]), .B(n133), .S0(count[2]), .Y(seg[0]) );
  INV U172 ( .A(n81), .Y(n133) );
  NOR2B U173 ( .AN(count[1]), .B(n86), .Y(n81) );
  INV U174 ( .A(count[0]), .Y(n86) );
  OAI2BB1 U175 ( .A0N(interval[2]), .A1N(n134), .B0(n135), .Y(n77) );
  MX2 U176 ( .A(n136), .B(n137), .S0(count[2]), .Y(n135) );
  NOR2B U177 ( .AN(n138), .B(n139), .Y(n137) );
  NOR2B U178 ( .AN(n140), .B(n141), .Y(n139) );
  NAND2B U179 ( .AN(n140), .B(n142), .Y(n136) );
  OAI2BB1 U180 ( .A0N(count[0]), .A1N(n143), .B0(n144), .Y(n140) );
  MX2 U181 ( .A(n143), .B(count[0]), .S0(count[1]), .Y(n144) );
  OAI2BB1 U182 ( .A0N(interval[0]), .A1N(n134), .B0(n145), .Y(n76) );
  MX2 U183 ( .A(n146), .B(n138), .S0(count[0]), .Y(n145) );
  INV U184 ( .A(n147), .Y(n75) );
  AOI21 U185 ( .A0(interval[1]), .A1(n134), .B0(n148), .Y(n147) );
  MX2 U186 ( .A(n149), .B(n150), .S0(count[1]), .Y(n148) );
  OAI21 U187 ( .A0(n151), .A1(n141), .B0(n138), .Y(n150) );
  INV U188 ( .A(n152), .Y(n151) );
  NOR2 U189 ( .A(n146), .B(n152), .Y(n149) );
  XNOR2 U190 ( .A(count[0]), .B(n143), .Y(n152) );
  INV U191 ( .A(n142), .Y(n146) );
  NOR2B U192 ( .AN(n138), .B(n141), .Y(n142) );
  OAI211 U193 ( .A0(n141), .A1(n153), .B0(n154), .C0(n155), .Y(n138) );
  INV U194 ( .A(n143), .Y(n155) );
  NOR2B U195 ( .AN(n156), .B(n141), .Y(n143) );
  NOR2 U196 ( .A(n154), .B(dir), .Y(n134) );
  MX2 U197 ( .A(n157), .B(\u_interval/finished ), .S0(n158), .Y(n74) );
  NOR2B U198 ( .AN(n154), .B(\u_interval/N72 ), .Y(n158) );
  NOR3B U199 ( .AN(n153), .B(n156), .C(n141), .Y(\u_interval/N72 ) );
  NOR2 U200 ( .A(dir), .B(n159), .Y(n156) );
  NOR2B U201 ( .AN(n87), .B(count[1]), .Y(n159) );
  NOR2 U202 ( .A(count[0]), .B(count[2]), .Y(n87) );
  OAI31 U203 ( .A0(n160), .A1(n161), .A2(n162), .B0(dir), .Y(n153) );
  XOR2 U204 ( .A(count[0]), .B(interval[0]), .Y(n162) );
  XOR2 U205 ( .A(count[2]), .B(interval[2]), .Y(n161) );
  XOR2 U206 ( .A(count[1]), .B(interval[1]), .Y(n160) );
  INV U207 ( .A(n141), .Y(n157) );
  NAND3B U208 ( .AN(\u_interval/finished ), .B(n132), .C(n154), .Y(n141) );
  NOR2B U209 ( .AN(rst_n), .B(reset_signal), .Y(n154) );
  NOR2B U210 ( .AN(n163), .B(n99), .Y(n132) );
  NAND2 U211 ( .A(n97), .B(\u_interval/clk_div[3] ), .Y(n99) );
  NOR3B U212 ( .AN(\u_interval/clk_div[2] ), .B(n91), .C(n164), .Y(n97) );
  INV U213 ( .A(\u_interval/clk_div[1] ), .Y(n164) );
  INV U214 ( .A(\u_interval/clk_div[0] ), .Y(n91) );
  NOR4BB U215 ( .AN(\u_interval/clk_div[15] ), .BN(n165), .C(n166), .D(n122), 
        .Y(n163) );
  INV U216 ( .A(\u_interval/clk_div[14] ), .Y(n122) );
  NAND3 U217 ( .A(\u_interval/clk_div[9] ), .B(\u_interval/clk_div[6] ), .C(
        \u_interval/clk_div[8] ), .Y(n166) );
  NOR4B U218 ( .AN(n167), .B(\u_interval/clk_div[12] ), .C(
        \u_interval/clk_div[10] ), .D(\u_interval/clk_div[11] ), .Y(n165) );
  NOR4 U219 ( .A(\u_interval/clk_div[7] ), .B(\u_interval/clk_div[5] ), .C(
        \u_interval/clk_div[4] ), .D(\u_interval/clk_div[13] ), .Y(n167) );
endmodule

