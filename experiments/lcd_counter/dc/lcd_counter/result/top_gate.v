
module top ( clk, rst_n, seg, digit_en );
  output [6:0] seg;
  output [3:0] digit_en;
  input clk, rst_n;
  wire   N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N45, N46, N47, N48, N49, N50, N51, N52, N53, N54, N55, N56, N57,
         N58, N59, N60, N61, \u_display/N27 , \u_display/N22 , \u_display/N20 ,
         \u_display/N19 , \u_display/N18 , \u_display/N17 , \u_display/N16 ,
         \u_display/N15 , \u_display/N14 , \u_display/N13 , \u_display/N12 ,
         \u_display/digit_idx[0] , \u_display/digit_idx[1] ,
         \u_display/scan_cnt[0] , \u_display/scan_cnt[1] ,
         \u_display/scan_cnt[2] , \u_display/scan_cnt[3] ,
         \u_display/scan_cnt[4] , \u_display/u_seg/N43 , \u_display/u_seg/N39 ,
         \u_display/u_seg/N36 , \u_display/u_seg/N33 , \u_display/u_seg/N24 ,
         \u_display/u_seg/N21 , \u_display/u_seg/N14 , \U3/U1/Z_0 ,
         \U3/U1/Z_1 , \U3/U1/Z_2 , \U3/U1/Z_3 , \U3/U1/Z_4 , \U3/U1/Z_5 ,
         \U3/U1/Z_6 , \U3/U1/Z_7 , \U3/U1/Z_8 , \U3/U1/Z_9 , \U3/U1/Z_10 ,
         \U3/U1/Z_11 , \U3/U1/Z_12 , \U3/U1/Z_13 , \U3/U1/Z_14 , \U3/U1/Z_15 ,
         n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n97,
         n98, n99, n100, n101, n104, n105, n106, n107, n108, n109, n110, n111,
         n112, n113, n114, n115, n116, n117, n118, n119, n120, n121, n122,
         n123, n124, n125, n126, n127, n128, n129, n130, n131, n132, n133,
         n134, n135, n136, n137, n138, n139, n140, n141, n142, n143, n144,
         n145, n146, n147, n148, n149, n150, n151, n152, n153, n154, n155,
         n156, n157, n158, n159, n160, n161, n162, n163, n164, n165, n166,
         n167, n168, n169, n170, n171, n172, n173;
  wire   [22:0] ms_cnt;
  wire   [15:0] counter_reg;
  assign digit_en[3] = \u_display/N27 ;
  assign digit_en[0] = \u_display/N22 ;
  assign seg[0] = \u_display/u_seg/N43 ;
  assign seg[1] = \u_display/u_seg/N39 ;
  assign seg[2] = \u_display/u_seg/N36 ;
  assign seg[3] = \u_display/u_seg/N33 ;
  assign seg[4] = \u_display/u_seg/N24 ;
  assign seg[5] = \u_display/u_seg/N21 ;
  assign seg[6] = \u_display/u_seg/N14 ;

  DFFRHQ \ms_cnt_reg[0]  ( .D(N45), .CK(clk), .RN(rst_n), .Q(ms_cnt[0]) );
  DFFRHQ \counter_reg_reg[0]  ( .D(n101), .CK(clk), .RN(rst_n), .Q(
        counter_reg[0]) );
  DFFRHQ \counter_reg_reg[1]  ( .D(n100), .CK(clk), .RN(rst_n), .Q(
        counter_reg[1]) );
  DFFRHQ \counter_reg_reg[2]  ( .D(n99), .CK(clk), .RN(rst_n), .Q(
        counter_reg[2]) );
  DFFRHQ \counter_reg_reg[3]  ( .D(n98), .CK(clk), .RN(rst_n), .Q(
        counter_reg[3]) );
  DFFRHQ \counter_reg_reg[4]  ( .D(n97), .CK(clk), .RN(rst_n), .Q(
        counter_reg[4]) );
  DFFRHQ \counter_reg_reg[5]  ( .D(n96), .CK(clk), .RN(rst_n), .Q(
        counter_reg[5]) );
  DFFRHQ \counter_reg_reg[6]  ( .D(n95), .CK(clk), .RN(rst_n), .Q(
        counter_reg[6]) );
  DFFRHQ \counter_reg_reg[7]  ( .D(n94), .CK(clk), .RN(rst_n), .Q(
        counter_reg[7]) );
  DFFRHQ \counter_reg_reg[8]  ( .D(n93), .CK(clk), .RN(rst_n), .Q(
        counter_reg[8]) );
  DFFRHQ \counter_reg_reg[9]  ( .D(n92), .CK(clk), .RN(rst_n), .Q(
        counter_reg[9]) );
  DFFRHQ \counter_reg_reg[10]  ( .D(n91), .CK(clk), .RN(rst_n), .Q(
        counter_reg[10]) );
  DFFRHQ \counter_reg_reg[11]  ( .D(n90), .CK(clk), .RN(rst_n), .Q(
        counter_reg[11]) );
  DFFRHQ \counter_reg_reg[12]  ( .D(n89), .CK(clk), .RN(rst_n), .Q(
        counter_reg[12]) );
  DFFRHQ \counter_reg_reg[13]  ( .D(n88), .CK(clk), .RN(rst_n), .Q(
        counter_reg[13]) );
  DFFRHQ \counter_reg_reg[14]  ( .D(n87), .CK(clk), .RN(rst_n), .Q(
        counter_reg[14]) );
  DFFRHQ \counter_reg_reg[15]  ( .D(n86), .CK(clk), .RN(rst_n), .Q(
        counter_reg[15]) );
  DFFRHQ \ms_cnt_reg[1]  ( .D(N46), .CK(clk), .RN(rst_n), .Q(ms_cnt[1]) );
  DFFRHQ \ms_cnt_reg[2]  ( .D(N47), .CK(clk), .RN(rst_n), .Q(ms_cnt[2]) );
  DFFRHQ \ms_cnt_reg[3]  ( .D(N48), .CK(clk), .RN(rst_n), .Q(ms_cnt[3]) );
  DFFRHQ \ms_cnt_reg[4]  ( .D(N49), .CK(clk), .RN(rst_n), .Q(ms_cnt[4]) );
  DFFRHQ \ms_cnt_reg[5]  ( .D(N50), .CK(clk), .RN(rst_n), .Q(ms_cnt[5]) );
  DFFRHQ \ms_cnt_reg[6]  ( .D(N51), .CK(clk), .RN(rst_n), .Q(ms_cnt[6]) );
  DFFRHQ \ms_cnt_reg[7]  ( .D(N52), .CK(clk), .RN(rst_n), .Q(ms_cnt[7]) );
  DFFRHQ \ms_cnt_reg[8]  ( .D(N53), .CK(clk), .RN(rst_n), .Q(ms_cnt[8]) );
  DFFRHQ \ms_cnt_reg[9]  ( .D(N54), .CK(clk), .RN(rst_n), .Q(ms_cnt[9]) );
  DFFRHQ \ms_cnt_reg[10]  ( .D(N55), .CK(clk), .RN(rst_n), .Q(ms_cnt[10]) );
  DFFRHQ \ms_cnt_reg[11]  ( .D(N56), .CK(clk), .RN(rst_n), .Q(ms_cnt[11]) );
  DFFRHQ \ms_cnt_reg[12]  ( .D(N57), .CK(clk), .RN(rst_n), .Q(ms_cnt[12]) );
  DFFRHQ \ms_cnt_reg[13]  ( .D(N58), .CK(clk), .RN(rst_n), .Q(ms_cnt[13]) );
  DFFRHQ \ms_cnt_reg[14]  ( .D(N59), .CK(clk), .RN(rst_n), .Q(ms_cnt[14]) );
  DFFRHQ \ms_cnt_reg[15]  ( .D(N60), .CK(clk), .RN(rst_n), .Q(ms_cnt[15]) );
  DFFRHQ \ms_cnt_reg[16]  ( .D(N61), .CK(clk), .RN(rst_n), .Q(ms_cnt[16]) );
  DFFRHQ \u_display/scan_cnt_reg[4]  ( .D(\u_display/N20 ), .CK(clk), .RN(
        rst_n), .Q(\u_display/scan_cnt[4] ) );
  DFFRHQ \u_display/scan_cnt_reg[3]  ( .D(\u_display/N19 ), .CK(clk), .RN(
        rst_n), .Q(\u_display/scan_cnt[3] ) );
  DFFRHQ \u_display/scan_cnt_reg[0]  ( .D(\u_display/N16 ), .CK(clk), .RN(
        rst_n), .Q(\u_display/scan_cnt[0] ) );
  DFFRHQ \u_display/scan_cnt_reg[1]  ( .D(\u_display/N17 ), .CK(clk), .RN(
        rst_n), .Q(\u_display/scan_cnt[1] ) );
  DFFRHQ \u_display/scan_cnt_reg[2]  ( .D(\u_display/N18 ), .CK(clk), .RN(
        rst_n), .Q(\u_display/scan_cnt[2] ) );
  DFFRHQ \u_display/digit_idx_reg[0]  ( .D(n85), .CK(clk), .RN(rst_n), .Q(
        \u_display/digit_idx[0] ) );
  DFFRHQ \u_display/digit_idx_reg[1]  ( .D(n84), .CK(clk), .RN(rst_n), .Q(
        \u_display/digit_idx[1] ) );
  LOGIC_1 U139 ( .LOGIC_1_PIN(n104) );
  AND2 U140 ( .A(n167), .B(n104), .Y(n166) );
  AND2 U141 ( .A(\u_display/scan_cnt[1] ), .B(\u_display/scan_cnt[0] ), .Y(
        n105) );
  AND2 U142 ( .A(\u_display/scan_cnt[2] ), .B(n105), .Y(n106) );
  AND2 U143 ( .A(\U3/U1/Z_1 ), .B(\U3/U1/Z_0 ), .Y(n107) );
  AND2 U144 ( .A(\U3/U1/Z_2 ), .B(n107), .Y(n108) );
  AND2 U145 ( .A(\U3/U1/Z_3 ), .B(n108), .Y(n109) );
  AND2 U146 ( .A(\U3/U1/Z_4 ), .B(n109), .Y(n110) );
  AND2 U147 ( .A(\U3/U1/Z_5 ), .B(n110), .Y(n111) );
  AND2 U148 ( .A(\U3/U1/Z_6 ), .B(n111), .Y(n112) );
  AND2 U149 ( .A(\U3/U1/Z_7 ), .B(n112), .Y(n113) );
  AND2 U150 ( .A(\U3/U1/Z_8 ), .B(n113), .Y(n114) );
  AND2 U151 ( .A(\U3/U1/Z_9 ), .B(n114), .Y(n115) );
  AND2 U152 ( .A(\U3/U1/Z_10 ), .B(n115), .Y(n116) );
  AND2 U153 ( .A(\U3/U1/Z_11 ), .B(n116), .Y(n117) );
  AND2 U154 ( .A(\U3/U1/Z_12 ), .B(n117), .Y(n118) );
  AND2 U155 ( .A(\U3/U1/Z_13 ), .B(n118), .Y(n119) );
  AND2 U156 ( .A(\U3/U1/Z_14 ), .B(n119), .Y(n120) );
  AND2 U157 ( .A(\u_display/scan_cnt[3] ), .B(n106), .Y(n121) );
  AND2 U158 ( .A(\U3/U1/Z_15 ), .B(n120), .Y(n122) );
  INV U159 ( .A(n166), .Y(n123) );
  INV U160 ( .A(n166), .Y(n124) );
  XOR2 U161 ( .A(\u_display/scan_cnt[1] ), .B(\u_display/scan_cnt[0] ), .Y(
        \u_display/N12 ) );
  XOR2 U162 ( .A(\u_display/scan_cnt[2] ), .B(n105), .Y(\u_display/N13 ) );
  XOR2 U163 ( .A(\u_display/scan_cnt[3] ), .B(n106), .Y(\u_display/N14 ) );
  XOR2 U164 ( .A(\u_display/scan_cnt[4] ), .B(n121), .Y(\u_display/N15 ) );
  XOR2 U165 ( .A(\U3/U1/Z_1 ), .B(\U3/U1/Z_0 ), .Y(N23) );
  XOR2 U166 ( .A(\U3/U1/Z_2 ), .B(n107), .Y(N24) );
  XOR2 U167 ( .A(\U3/U1/Z_3 ), .B(n108), .Y(N25) );
  XOR2 U168 ( .A(\U3/U1/Z_4 ), .B(n109), .Y(N26) );
  XOR2 U169 ( .A(\U3/U1/Z_5 ), .B(n110), .Y(N27) );
  XOR2 U170 ( .A(\U3/U1/Z_6 ), .B(n111), .Y(N28) );
  XOR2 U171 ( .A(\U3/U1/Z_7 ), .B(n112), .Y(N29) );
  XOR2 U172 ( .A(\U3/U1/Z_8 ), .B(n113), .Y(N30) );
  XOR2 U173 ( .A(\U3/U1/Z_9 ), .B(n114), .Y(N31) );
  XOR2 U174 ( .A(\U3/U1/Z_10 ), .B(n115), .Y(N32) );
  XOR2 U175 ( .A(\U3/U1/Z_11 ), .B(n116), .Y(N33) );
  XOR2 U176 ( .A(\U3/U1/Z_12 ), .B(n117), .Y(N34) );
  XOR2 U177 ( .A(\U3/U1/Z_13 ), .B(n118), .Y(N35) );
  XOR2 U178 ( .A(\U3/U1/Z_14 ), .B(n119), .Y(N36) );
  XOR2 U179 ( .A(\U3/U1/Z_15 ), .B(n120), .Y(N37) );
  OAI211 U180 ( .A0(n125), .A1(n126), .B0(n127), .C0(n128), .Y(
        \u_display/u_seg/N43 ) );
  INV U181 ( .A(n129), .Y(n128) );
  MX2 U182 ( .A(n130), .B(n126), .S0(n131), .Y(n129) );
  NOR2B U183 ( .AN(n125), .B(n132), .Y(n130) );
  OAI2BB1 U184 ( .A0N(n127), .A1N(n125), .B0(n133), .Y(\u_display/u_seg/N39 )
         );
  XNOR2 U185 ( .A(n134), .B(n126), .Y(n133) );
  INV U186 ( .A(n135), .Y(n127) );
  OAI2BB2 U187 ( .B0(n134), .B1(n136), .A0N(n125), .A1N(n126), .Y(
        \u_display/u_seg/N36 ) );
  NAND2 U188 ( .A(n137), .B(n138), .Y(n126) );
  NOR2B U189 ( .AN(n138), .B(n137), .Y(n136) );
  NAND2B U190 ( .AN(n139), .B(n140), .Y(\u_display/u_seg/N33 ) );
  XNOR2 U191 ( .A(n141), .B(n132), .Y(n140) );
  MX2 U192 ( .A(n142), .B(n138), .S0(n131), .Y(n139) );
  NOR2 U193 ( .A(n143), .B(n138), .Y(n142) );
  NAND2 U194 ( .A(n144), .B(n145), .Y(\u_display/u_seg/N24 ) );
  MX2 U195 ( .A(n146), .B(n137), .S0(n131), .Y(n144) );
  NOR2B U196 ( .AN(n135), .B(n143), .Y(n146) );
  NOR2 U197 ( .A(n137), .B(n138), .Y(n135) );
  OAI21 U198 ( .A0(n147), .A1(n137), .B0(n148), .Y(\u_display/u_seg/N21 ) );
  MX2 U199 ( .A(n141), .B(n145), .S0(n131), .Y(n148) );
  OAI21 U200 ( .A0(n138), .A1(n143), .B0(n145), .Y(n141) );
  NAND2B U201 ( .AN(n125), .B(n138), .Y(n145) );
  NOR2B U202 ( .AN(n131), .B(n125), .Y(n147) );
  NAND2B U203 ( .AN(n149), .B(n150), .Y(\u_display/u_seg/N14 ) );
  XOR2 U204 ( .A(n138), .B(n151), .Y(n150) );
  NOR2B U205 ( .AN(n131), .B(n137), .Y(n151) );
  AOI221 U206 ( .A0(digit_en[1]), .A1(counter_reg[5]), .B0(digit_en[2]), .B1(
        counter_reg[9]), .C0(n152), .Y(n138) );
  INV U207 ( .A(n153), .Y(n152) );
  AOI22 U208 ( .A0(counter_reg[1]), .A1(\u_display/N22 ), .B0(\u_display/N27 ), 
        .B1(counter_reg[13]), .Y(n153) );
  XNOR2 U209 ( .A(n143), .B(n154), .Y(n149) );
  NOR2B U210 ( .AN(n137), .B(n131), .Y(n154) );
  INV U211 ( .A(n134), .Y(n131) );
  AOI221 U212 ( .A0(digit_en[1]), .A1(counter_reg[7]), .B0(digit_en[2]), .B1(
        counter_reg[11]), .C0(n155), .Y(n134) );
  INV U213 ( .A(n156), .Y(n155) );
  AOI22 U214 ( .A0(counter_reg[3]), .A1(\u_display/N22 ), .B0(\u_display/N27 ), 
        .B1(counter_reg[15]), .Y(n156) );
  INV U215 ( .A(n132), .Y(n137) );
  AOI221 U216 ( .A0(digit_en[1]), .A1(counter_reg[6]), .B0(digit_en[2]), .B1(
        counter_reg[10]), .C0(n157), .Y(n132) );
  INV U217 ( .A(n158), .Y(n157) );
  AOI22 U218 ( .A0(counter_reg[2]), .A1(\u_display/N22 ), .B0(\u_display/N27 ), 
        .B1(counter_reg[14]), .Y(n158) );
  INV U219 ( .A(n125), .Y(n143) );
  AOI221 U220 ( .A0(digit_en[1]), .A1(counter_reg[4]), .B0(digit_en[2]), .B1(
        counter_reg[8]), .C0(n159), .Y(n125) );
  INV U221 ( .A(n160), .Y(n159) );
  AOI22 U222 ( .A0(counter_reg[0]), .A1(\u_display/N22 ), .B0(\u_display/N27 ), 
        .B1(counter_reg[12]), .Y(n160) );
  NOR2B U223 ( .AN(\u_display/digit_idx[1] ), .B(n161), .Y(\u_display/N27 ) );
  NOR2B U224 ( .AN(n161), .B(\u_display/digit_idx[1] ), .Y(\u_display/N22 ) );
  NOR2B U225 ( .AN(\u_display/N15 ), .B(n162), .Y(\u_display/N20 ) );
  NOR2B U226 ( .AN(\u_display/N14 ), .B(n162), .Y(\u_display/N19 ) );
  NOR2B U227 ( .AN(\u_display/N13 ), .B(n162), .Y(\u_display/N18 ) );
  NOR2B U228 ( .AN(\u_display/N12 ), .B(n162), .Y(\u_display/N17 ) );
  NOR2 U229 ( .A(n162), .B(\u_display/scan_cnt[0] ), .Y(\u_display/N16 ) );
  MX2 U230 ( .A(counter_reg[2]), .B(N24), .S0(n123), .Y(n99) );
  MX2 U231 ( .A(counter_reg[3]), .B(N25), .S0(n163), .Y(n98) );
  MX2 U232 ( .A(counter_reg[4]), .B(N26), .S0(n124), .Y(n97) );
  MX2 U233 ( .A(counter_reg[5]), .B(N27), .S0(n123), .Y(n96) );
  MX2 U234 ( .A(counter_reg[6]), .B(N28), .S0(n163), .Y(n95) );
  MX2 U235 ( .A(counter_reg[7]), .B(N29), .S0(n124), .Y(n94) );
  MX2 U236 ( .A(counter_reg[8]), .B(N30), .S0(n123), .Y(n93) );
  MX2 U237 ( .A(counter_reg[9]), .B(N31), .S0(n163), .Y(n92) );
  MX2 U238 ( .A(counter_reg[10]), .B(N32), .S0(n124), .Y(n91) );
  MX2 U239 ( .A(counter_reg[11]), .B(N33), .S0(n123), .Y(n90) );
  MX2 U240 ( .A(counter_reg[12]), .B(N34), .S0(n163), .Y(n89) );
  MX2 U241 ( .A(counter_reg[13]), .B(N35), .S0(n124), .Y(n88) );
  MX2 U242 ( .A(counter_reg[14]), .B(N36), .S0(n123), .Y(n87) );
  MX2 U243 ( .A(counter_reg[15]), .B(N37), .S0(n163), .Y(n86) );
  XNOR2 U244 ( .A(n162), .B(n161), .Y(n85) );
  INV U245 ( .A(\u_display/digit_idx[0] ), .Y(n161) );
  OR2 U246 ( .A(n164), .B(digit_en[2]), .Y(n84) );
  MX2 U247 ( .A(\u_display/digit_idx[1] ), .B(digit_en[1]), .S0(n162), .Y(n164) );
  AND4 U248 ( .A(\u_display/scan_cnt[4] ), .B(\u_display/scan_cnt[3] ), .C(
        \u_display/scan_cnt[2] ), .D(\u_display/scan_cnt[1] ), .Y(n162) );
  MX2 U249 ( .A(counter_reg[0]), .B(n165), .S0(n124), .Y(n101) );
  MX2 U250 ( .A(counter_reg[1]), .B(N23), .S0(n123), .Y(n100) );
  NOR2B U251 ( .AN(\u_display/digit_idx[1] ), .B(\u_display/digit_idx[0] ), 
        .Y(digit_en[2]) );
  NOR2B U252 ( .AN(\u_display/digit_idx[0] ), .B(\u_display/digit_idx[1] ), 
        .Y(digit_en[1]) );
  MX2 U253 ( .A(ms_cnt[9]), .B(counter_reg[9]), .S0(n163), .Y(\U3/U1/Z_9 ) );
  MX2 U254 ( .A(ms_cnt[8]), .B(counter_reg[8]), .S0(n124), .Y(\U3/U1/Z_8 ) );
  MX2 U255 ( .A(ms_cnt[7]), .B(counter_reg[7]), .S0(n123), .Y(\U3/U1/Z_7 ) );
  MX2 U256 ( .A(ms_cnt[6]), .B(counter_reg[6]), .S0(n163), .Y(\U3/U1/Z_6 ) );
  MX2 U257 ( .A(ms_cnt[5]), .B(counter_reg[5]), .S0(n124), .Y(\U3/U1/Z_5 ) );
  MX2 U258 ( .A(ms_cnt[4]), .B(counter_reg[4]), .S0(n123), .Y(\U3/U1/Z_4 ) );
  MX2 U259 ( .A(ms_cnt[3]), .B(counter_reg[3]), .S0(n163), .Y(\U3/U1/Z_3 ) );
  MX2 U260 ( .A(ms_cnt[2]), .B(counter_reg[2]), .S0(n124), .Y(\U3/U1/Z_2 ) );
  NOR2B U261 ( .AN(counter_reg[15]), .B(n166), .Y(\U3/U1/Z_15 ) );
  NOR2B U262 ( .AN(counter_reg[14]), .B(n166), .Y(\U3/U1/Z_14 ) );
  NOR2B U263 ( .AN(counter_reg[13]), .B(n166), .Y(\U3/U1/Z_13 ) );
  MX2 U264 ( .A(ms_cnt[12]), .B(counter_reg[12]), .S0(n123), .Y(\U3/U1/Z_12 )
         );
  MX2 U265 ( .A(ms_cnt[11]), .B(counter_reg[11]), .S0(n163), .Y(\U3/U1/Z_11 )
         );
  MX2 U266 ( .A(ms_cnt[10]), .B(counter_reg[10]), .S0(n124), .Y(\U3/U1/Z_10 )
         );
  MX2 U267 ( .A(ms_cnt[1]), .B(counter_reg[1]), .S0(n123), .Y(\U3/U1/Z_1 ) );
  NOR2B U268 ( .AN(n122), .B(n163), .Y(N61) );
  NOR2B U269 ( .AN(N37), .B(n124), .Y(N60) );
  NOR2B U270 ( .AN(N36), .B(n123), .Y(N59) );
  NOR2B U271 ( .AN(N35), .B(n163), .Y(N58) );
  NOR2B U272 ( .AN(N34), .B(n124), .Y(N57) );
  NOR2B U273 ( .AN(N33), .B(n123), .Y(N56) );
  NOR2B U274 ( .AN(N32), .B(n163), .Y(N55) );
  NOR2B U275 ( .AN(N31), .B(n124), .Y(N54) );
  NOR2B U276 ( .AN(N30), .B(n123), .Y(N53) );
  NOR2B U277 ( .AN(N29), .B(n163), .Y(N52) );
  NOR2B U278 ( .AN(N28), .B(n124), .Y(N51) );
  NOR2B U279 ( .AN(N27), .B(n123), .Y(N50) );
  NOR2B U280 ( .AN(N26), .B(n163), .Y(N49) );
  NOR2B U281 ( .AN(N25), .B(n124), .Y(N48) );
  NOR2B U282 ( .AN(N24), .B(n123), .Y(N47) );
  NOR2B U283 ( .AN(N23), .B(n163), .Y(N46) );
  NOR2B U284 ( .AN(n165), .B(n124), .Y(N45) );
  INV U285 ( .A(\U3/U1/Z_0 ), .Y(n165) );
  MX2 U286 ( .A(ms_cnt[0]), .B(counter_reg[0]), .S0(n163), .Y(\U3/U1/Z_0 ) );
  INV U287 ( .A(n166), .Y(n163) );
  NOR4BB U288 ( .AN(n168), .BN(n169), .C(ms_cnt[14]), .D(ms_cnt[13]), .Y(n167)
         );
  NOR2 U289 ( .A(ms_cnt[16]), .B(ms_cnt[15]), .Y(n169) );
  OAI31 U290 ( .A0(n170), .A1(ms_cnt[11]), .A2(ms_cnt[10]), .B0(ms_cnt[12]), 
        .Y(n168) );
  NOR4BB U291 ( .AN(ms_cnt[9]), .BN(ms_cnt[7]), .C(n171), .D(n172), .Y(n170)
         );
  NOR4B U292 ( .AN(n173), .B(ms_cnt[5]), .C(ms_cnt[4]), .D(ms_cnt[6]), .Y(n172) );
  AOI31 U293 ( .A0(ms_cnt[2]), .A1(ms_cnt[0]), .A2(ms_cnt[1]), .B0(ms_cnt[3]), 
        .Y(n173) );
  INV U294 ( .A(ms_cnt[8]), .Y(n171) );
endmodule

