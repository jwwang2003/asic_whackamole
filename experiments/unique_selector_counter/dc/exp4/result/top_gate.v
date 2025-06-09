
module top ( clk, rstn, seg, trigger );
  output [6:0] seg;
  input clk, rstn;
  output trigger;
  wire   req, done, N25, N26, N27, N28, N29, N30, N31, N32, N33, N34, N35, N36,
         N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47, N48, N49, N50,
         N51, N52, N53, N54, N55, \prng_inst/feedback , \unique_inst/N43 ,
         \unique_inst/N40 , \unique_inst/searching ,
         \unique_inst/selected_mask[0] , \unique_inst/selected_mask[1] ,
         \unique_inst/selected_mask[2] , \unique_inst/selected_mask[3] ,
         \unique_inst/selected_mask[4] , \unique_inst/selected_mask[5] ,
         \unique_inst/selected_mask[6] , \unique_inst/selected_mask[7] ,
         \unique_inst/N18 , \unique_inst/N17 , \unique_inst/N16 ,
         \seg_driver/N68 , \seg_driver/N39 , \seg_driver/N36 ,
         \seg_driver/N24 , \seg_driver/N21 , \seg_driver/N14 , n69, n70, n71,
         n72, n73, n74, n75, n76, n110, n111, n112, n113, n114, n115, n116,
         n117, n118, n119, n120, n121, n122, n123, n124, n125, n126, n127,
         n128, n129, n130, n131, n132, n133, n134, n135, n136, n137, n138,
         n139, n140, n141, n142, n143, n144, n145, n146, n147, n148, n149,
         n150, n151, n152, n153, n154, n155, n156, n157, n158, n159, n160,
         n161, n162, n163, n164, n165, n166, n167, n168, n169, n170, n171,
         n172, n173, n174, n175, n176, n177, n178, n179, n180, n181, n182,
         n183, n184, n185, n186, n187, n188, n189, n190, n191, n192, n193,
         n194, n195, n196, n197, n198, n199, n200, n201, n202, n203, n204,
         n205, n206, n207, n208, n209, n210, n211, n212, n213, n214, n215,
         n216, n217, n218, n219, n220, n221, n222, n223, n224, n225, n226,
         n227, n228, n229, n230, n231, n232, n233, n234, n235, n236, n237,
         n238, n239, n240, n241, n242, n243, n244, n245, n246, n247, n248,
         n249, n250, n251, n252, n253, n254, n255, n256, n257, n258, n259,
         n260, n261, n262, n263, n264;
  wire   [7:0] random;
  wire   [2:0] selected_number;
  wire   [1:0] state;
  wire   [31:0] sec_cnt;
  assign seg[0] = \seg_driver/N68 ;
  assign seg[1] = \seg_driver/N39 ;
  assign seg[2] = \seg_driver/N36 ;
  assign seg[4] = \seg_driver/N24 ;
  assign seg[5] = \seg_driver/N21 ;
  assign seg[6] = \seg_driver/N14 ;

  DFFSHQ \prng_inst/random_reg[7]  ( .D(random[6]), .CK(clk), .SN(rstn), .Q(
        random[7]) );
  DFFSHQ \prng_inst/random_reg[0]  ( .D(\prng_inst/feedback ), .CK(clk), .SN(
        rstn), .Q(random[0]) );
  DFFRHQ \prng_inst/random_reg[1]  ( .D(random[0]), .CK(clk), .RN(rstn), .Q(
        random[1]) );
  DFFSHQ \prng_inst/random_reg[2]  ( .D(random[1]), .CK(clk), .SN(rstn), .Q(
        random[2]) );
  DFFRHQ \prng_inst/random_reg[3]  ( .D(random[2]), .CK(clk), .RN(rstn), .Q(
        random[3]) );
  DFFRHQ \prng_inst/random_reg[4]  ( .D(random[3]), .CK(clk), .RN(rstn), .Q(
        random[4]) );
  DFFSHQ \prng_inst/random_reg[5]  ( .D(random[4]), .CK(clk), .SN(rstn), .Q(
        random[5]) );
  DFFRHQ \prng_inst/random_reg[6]  ( .D(random[5]), .CK(clk), .RN(rstn), .Q(
        random[6]) );
  DFFRHQ \unique_inst/done_reg  ( .D(\unique_inst/N40 ), .CK(clk), .RN(rstn), 
        .Q(done) );
  DFFHQ \sec_cnt_reg[0]  ( .D(n264), .CK(clk), .Q(sec_cnt[0]) );
  DFFHQ \sec_cnt_reg[31]  ( .D(n233), .CK(clk), .Q(sec_cnt[31]) );
  DFFHQ \state_reg[0]  ( .D(n115), .CK(clk), .Q(state[0]) );
  EDFFTRHQ req_reg ( .RN(rstn), .D(n111), .E(n110), .CK(clk), .Q(req) );
  DFFRHQ \unique_inst/searching_reg  ( .D(n116), .CK(clk), .RN(rstn), .Q(
        \unique_inst/searching ) );
  EDFFHQ \unique_inst/potential_number_reg[0]  ( .D(random[0]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N16 ) );
  EDFFHQ \unique_inst/potential_number_reg[1]  ( .D(random[1]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N17 ) );
  EDFFHQ \unique_inst/potential_number_reg[2]  ( .D(random[2]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N18 ) );
  DFFRHQ \unique_inst/selected_mask_reg[3]  ( .D(n76), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[3] ) );
  DFFRHQ \unique_inst/selected_mask_reg[2]  ( .D(n75), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[2] ) );
  DFFRHQ \unique_inst/selected_mask_reg[1]  ( .D(n74), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[1] ) );
  DFFRHQ \unique_inst/selected_mask_reg[0]  ( .D(n73), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[0] ) );
  DFFRHQ \unique_inst/selected_number_reg[0]  ( .D(n114), .CK(clk), .RN(rstn), 
        .Q(selected_number[0]) );
  DFFRHQ \unique_inst/selected_number_reg[1]  ( .D(n113), .CK(clk), .RN(rstn), 
        .Q(selected_number[1]) );
  DFFRHQ \unique_inst/selected_mask_reg[7]  ( .D(n72), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[7] ) );
  DFFRHQ \unique_inst/selected_mask_reg[6]  ( .D(n71), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[6] ) );
  DFFRHQ \unique_inst/selected_mask_reg[5]  ( .D(n70), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[5] ) );
  DFFRHQ \unique_inst/selected_mask_reg[4]  ( .D(n69), .CK(clk), .RN(rstn), 
        .Q(\unique_inst/selected_mask[4] ) );
  DFFRHQ \unique_inst/selected_number_reg[2]  ( .D(n112), .CK(clk), .RN(rstn), 
        .Q(selected_number[2]) );
  DFFHQ \state_reg[1]  ( .D(n117), .CK(clk), .Q(state[1]) );
  DFFHQ \sec_cnt_reg[30]  ( .D(n234), .CK(clk), .Q(sec_cnt[30]) );
  DFFHQ \sec_cnt_reg[29]  ( .D(n235), .CK(clk), .Q(sec_cnt[29]) );
  DFFHQ \sec_cnt_reg[28]  ( .D(n236), .CK(clk), .Q(sec_cnt[28]) );
  DFFHQ \sec_cnt_reg[27]  ( .D(n237), .CK(clk), .Q(sec_cnt[27]) );
  DFFHQ \sec_cnt_reg[26]  ( .D(n238), .CK(clk), .Q(sec_cnt[26]) );
  DFFHQ \sec_cnt_reg[25]  ( .D(n239), .CK(clk), .Q(sec_cnt[25]) );
  DFFHQ \sec_cnt_reg[24]  ( .D(n240), .CK(clk), .Q(sec_cnt[24]) );
  DFFHQ \sec_cnt_reg[23]  ( .D(n241), .CK(clk), .Q(sec_cnt[23]) );
  DFFHQ \sec_cnt_reg[22]  ( .D(n242), .CK(clk), .Q(sec_cnt[22]) );
  DFFHQ \sec_cnt_reg[21]  ( .D(n243), .CK(clk), .Q(sec_cnt[21]) );
  DFFHQ \sec_cnt_reg[20]  ( .D(n244), .CK(clk), .Q(sec_cnt[20]) );
  DFFHQ \sec_cnt_reg[19]  ( .D(n245), .CK(clk), .Q(sec_cnt[19]) );
  DFFHQ \sec_cnt_reg[18]  ( .D(n246), .CK(clk), .Q(sec_cnt[18]) );
  DFFHQ \sec_cnt_reg[17]  ( .D(n247), .CK(clk), .Q(sec_cnt[17]) );
  DFFHQ \sec_cnt_reg[16]  ( .D(n248), .CK(clk), .Q(sec_cnt[16]) );
  DFFHQ \sec_cnt_reg[15]  ( .D(n249), .CK(clk), .Q(sec_cnt[15]) );
  DFFHQ \sec_cnt_reg[14]  ( .D(n250), .CK(clk), .Q(sec_cnt[14]) );
  DFFHQ \sec_cnt_reg[13]  ( .D(n251), .CK(clk), .Q(sec_cnt[13]) );
  DFFHQ \sec_cnt_reg[12]  ( .D(n252), .CK(clk), .Q(sec_cnt[12]) );
  DFFHQ \sec_cnt_reg[11]  ( .D(n253), .CK(clk), .Q(sec_cnt[11]) );
  DFFHQ \sec_cnt_reg[10]  ( .D(n254), .CK(clk), .Q(sec_cnt[10]) );
  DFFHQ \sec_cnt_reg[9]  ( .D(n255), .CK(clk), .Q(sec_cnt[9]) );
  DFFHQ \sec_cnt_reg[8]  ( .D(n256), .CK(clk), .Q(sec_cnt[8]) );
  DFFHQ \sec_cnt_reg[7]  ( .D(n257), .CK(clk), .Q(sec_cnt[7]) );
  DFFHQ \sec_cnt_reg[6]  ( .D(n258), .CK(clk), .Q(sec_cnt[6]) );
  DFFHQ \sec_cnt_reg[5]  ( .D(n259), .CK(clk), .Q(sec_cnt[5]) );
  DFFHQ \sec_cnt_reg[4]  ( .D(n260), .CK(clk), .Q(sec_cnt[4]) );
  DFFHQ \sec_cnt_reg[3]  ( .D(n261), .CK(clk), .Q(sec_cnt[3]) );
  DFFHQ \sec_cnt_reg[2]  ( .D(n262), .CK(clk), .Q(sec_cnt[2]) );
  DFFHQ \sec_cnt_reg[1]  ( .D(n263), .CK(clk), .Q(sec_cnt[1]) );
  MX2 U129 ( .A(\unique_inst/selected_mask[6] ), .B(
        \unique_inst/selected_mask[7] ), .S0(\unique_inst/N16 ), .Y(n118) );
  MX2 U130 ( .A(\unique_inst/selected_mask[4] ), .B(
        \unique_inst/selected_mask[5] ), .S0(\unique_inst/N16 ), .Y(n119) );
  MX2 U131 ( .A(n119), .B(n118), .S0(\unique_inst/N17 ), .Y(n120) );
  MX2 U132 ( .A(\unique_inst/selected_mask[2] ), .B(
        \unique_inst/selected_mask[3] ), .S0(\unique_inst/N16 ), .Y(n121) );
  MX2 U133 ( .A(\unique_inst/selected_mask[0] ), .B(
        \unique_inst/selected_mask[1] ), .S0(\unique_inst/N16 ), .Y(n122) );
  MX2 U134 ( .A(n122), .B(n121), .S0(\unique_inst/N17 ), .Y(n123) );
  AND2 U135 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(n124) );
  AND2 U136 ( .A(sec_cnt[2]), .B(n124), .Y(n125) );
  AND2 U137 ( .A(sec_cnt[3]), .B(n125), .Y(n126) );
  AND2 U138 ( .A(sec_cnt[4]), .B(n126), .Y(n127) );
  AND2 U139 ( .A(sec_cnt[5]), .B(n127), .Y(n128) );
  AND2 U140 ( .A(sec_cnt[6]), .B(n128), .Y(n129) );
  AND2 U141 ( .A(sec_cnt[7]), .B(n129), .Y(n130) );
  AND2 U142 ( .A(sec_cnt[8]), .B(n130), .Y(n131) );
  AND2 U143 ( .A(sec_cnt[9]), .B(n131), .Y(n132) );
  AND2 U144 ( .A(sec_cnt[10]), .B(n132), .Y(n133) );
  AND2 U145 ( .A(sec_cnt[11]), .B(n133), .Y(n134) );
  AND2 U146 ( .A(sec_cnt[12]), .B(n134), .Y(n135) );
  AND2 U147 ( .A(sec_cnt[13]), .B(n135), .Y(n136) );
  AND2 U148 ( .A(sec_cnt[14]), .B(n136), .Y(n137) );
  AND2 U149 ( .A(sec_cnt[15]), .B(n137), .Y(n138) );
  AND2 U150 ( .A(sec_cnt[16]), .B(n138), .Y(n139) );
  AND2 U151 ( .A(sec_cnt[17]), .B(n139), .Y(n140) );
  AND2 U152 ( .A(sec_cnt[18]), .B(n140), .Y(n141) );
  AND2 U153 ( .A(sec_cnt[19]), .B(n141), .Y(n142) );
  AND2 U154 ( .A(sec_cnt[20]), .B(n142), .Y(n143) );
  AND2 U155 ( .A(sec_cnt[21]), .B(n143), .Y(n144) );
  AND2 U156 ( .A(sec_cnt[22]), .B(n144), .Y(n145) );
  AND2 U157 ( .A(sec_cnt[23]), .B(n145), .Y(n146) );
  AND2 U158 ( .A(sec_cnt[24]), .B(n146), .Y(n147) );
  AND2 U159 ( .A(sec_cnt[25]), .B(n147), .Y(n148) );
  AND2 U160 ( .A(sec_cnt[26]), .B(n148), .Y(n149) );
  AND2 U161 ( .A(sec_cnt[27]), .B(n149), .Y(n150) );
  AND2 U162 ( .A(sec_cnt[28]), .B(n150), .Y(n151) );
  AND2 U163 ( .A(sec_cnt[29]), .B(n151), .Y(n152) );
  AND2 U164 ( .A(sec_cnt[30]), .B(n152), .Y(n153) );
  INV U165 ( .A(n161), .Y(n154) );
  BUF U166 ( .I(n163), .O(n155) );
  XOR2 U167 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(N25) );
  XOR2 U168 ( .A(sec_cnt[2]), .B(n124), .Y(N26) );
  XOR2 U169 ( .A(sec_cnt[3]), .B(n125), .Y(N27) );
  XOR2 U170 ( .A(sec_cnt[4]), .B(n126), .Y(N28) );
  XOR2 U171 ( .A(sec_cnt[5]), .B(n127), .Y(N29) );
  XOR2 U172 ( .A(sec_cnt[6]), .B(n128), .Y(N30) );
  XOR2 U173 ( .A(sec_cnt[7]), .B(n129), .Y(N31) );
  XOR2 U174 ( .A(sec_cnt[8]), .B(n130), .Y(N32) );
  XOR2 U175 ( .A(sec_cnt[9]), .B(n131), .Y(N33) );
  XOR2 U176 ( .A(sec_cnt[10]), .B(n132), .Y(N34) );
  XOR2 U177 ( .A(sec_cnt[11]), .B(n133), .Y(N35) );
  XOR2 U178 ( .A(sec_cnt[12]), .B(n134), .Y(N36) );
  XOR2 U179 ( .A(sec_cnt[13]), .B(n135), .Y(N37) );
  XOR2 U180 ( .A(sec_cnt[14]), .B(n136), .Y(N38) );
  XOR2 U181 ( .A(sec_cnt[15]), .B(n137), .Y(N39) );
  XOR2 U182 ( .A(sec_cnt[16]), .B(n138), .Y(N40) );
  XOR2 U183 ( .A(sec_cnt[17]), .B(n139), .Y(N41) );
  XOR2 U184 ( .A(sec_cnt[18]), .B(n140), .Y(N42) );
  XOR2 U185 ( .A(sec_cnt[19]), .B(n141), .Y(N43) );
  XOR2 U186 ( .A(sec_cnt[20]), .B(n142), .Y(N44) );
  XOR2 U187 ( .A(sec_cnt[21]), .B(n143), .Y(N45) );
  XOR2 U188 ( .A(sec_cnt[22]), .B(n144), .Y(N46) );
  XOR2 U189 ( .A(sec_cnt[23]), .B(n145), .Y(N47) );
  XOR2 U190 ( .A(sec_cnt[24]), .B(n146), .Y(N48) );
  XOR2 U191 ( .A(sec_cnt[25]), .B(n147), .Y(N49) );
  XOR2 U192 ( .A(sec_cnt[26]), .B(n148), .Y(N50) );
  XOR2 U193 ( .A(sec_cnt[27]), .B(n149), .Y(N51) );
  XOR2 U194 ( .A(sec_cnt[28]), .B(n150), .Y(N52) );
  XOR2 U195 ( .A(sec_cnt[29]), .B(n151), .Y(N53) );
  XOR2 U196 ( .A(sec_cnt[30]), .B(n152), .Y(N54) );
  XOR2 U197 ( .A(sec_cnt[31]), .B(n153), .Y(N55) );
  NOR2B U198 ( .AN(\unique_inst/searching ), .B(n156), .Y(\unique_inst/N43 )
         );
  MX2 U199 ( .A(n157), .B(selected_number[1]), .S0(n158), .Y(\seg_driver/N68 )
         );
  OAI2BB2 U200 ( .B0(selected_number[1]), .B1(selected_number[0]), .A0N(
        selected_number[2]), .A1N(n157), .Y(\seg_driver/N39 ) );
  NAND3B U201 ( .AN(selected_number[0]), .B(selected_number[1]), .C(n158), .Y(
        \seg_driver/N24 ) );
  OAI211 U202 ( .A0(selected_number[1]), .A1(selected_number[0]), .B0(n157), 
        .C0(selected_number[2]), .Y(\seg_driver/N21 ) );
  NAND2 U203 ( .A(selected_number[0]), .B(selected_number[1]), .Y(n157) );
  NAND2B U204 ( .AN(selected_number[1]), .B(n159), .Y(\seg_driver/N14 ) );
  XNOR2 U205 ( .A(n158), .B(selected_number[0]), .Y(n159) );
  ADDF U206 ( .A(random[4]), .B(random[3]), .CI(n160), .S(\prng_inst/feedback ) );
  XOR2 U207 ( .A(random[7]), .B(random[5]), .Y(n160) );
  OAI2BB2 U208 ( .B0(n161), .B1(n162), .A0N(N55), .A1N(n155), .Y(n233) );
  INV U209 ( .A(n164), .Y(n234) );
  AOI22 U210 ( .A0(n154), .A1(sec_cnt[30]), .B0(N54), .B1(n155), .Y(n164) );
  OAI2BB2 U211 ( .B0(n161), .B1(n166), .A0N(N53), .A1N(n155), .Y(n235) );
  INV U212 ( .A(sec_cnt[29]), .Y(n166) );
  INV U213 ( .A(n167), .Y(n236) );
  AOI22 U214 ( .A0(n154), .A1(sec_cnt[28]), .B0(N52), .B1(n155), .Y(n167) );
  INV U215 ( .A(n168), .Y(n237) );
  AOI22 U216 ( .A0(n154), .A1(sec_cnt[27]), .B0(N51), .B1(n155), .Y(n168) );
  OAI2BB2 U217 ( .B0(n161), .B1(n169), .A0N(N50), .A1N(n155), .Y(n238) );
  OAI2BB2 U218 ( .B0(n161), .B1(n170), .A0N(N49), .A1N(n155), .Y(n239) );
  INV U219 ( .A(sec_cnt[25]), .Y(n170) );
  OAI2BB2 U220 ( .B0(n161), .B1(n171), .A0N(N48), .A1N(n155), .Y(n240) );
  INV U221 ( .A(n172), .Y(n241) );
  AOI22 U222 ( .A0(n154), .A1(sec_cnt[23]), .B0(N47), .B1(n155), .Y(n172) );
  OAI2BB2 U223 ( .B0(n161), .B1(n173), .A0N(N46), .A1N(n155), .Y(n242) );
  OAI2BB2 U224 ( .B0(n161), .B1(n174), .A0N(N45), .A1N(n155), .Y(n243) );
  INV U225 ( .A(sec_cnt[21]), .Y(n174) );
  OAI2BB2 U226 ( .B0(n161), .B1(n175), .A0N(N44), .A1N(n155), .Y(n244) );
  INV U227 ( .A(n176), .Y(n245) );
  AOI22 U228 ( .A0(n154), .A1(sec_cnt[19]), .B0(N43), .B1(n155), .Y(n176) );
  OAI2BB2 U229 ( .B0(n161), .B1(n177), .A0N(N42), .A1N(n155), .Y(n246) );
  INV U230 ( .A(n178), .Y(n247) );
  AOI22 U231 ( .A0(n154), .A1(sec_cnt[17]), .B0(N41), .B1(n155), .Y(n178) );
  OAI2BB2 U232 ( .B0(n161), .B1(n179), .A0N(N40), .A1N(n155), .Y(n248) );
  OAI2BB2 U233 ( .B0(n180), .B1(n161), .A0N(N39), .A1N(n155), .Y(n249) );
  OAI2BB2 U234 ( .B0(n181), .B1(n161), .A0N(N38), .A1N(n155), .Y(n250) );
  OAI2BB2 U235 ( .B0(n161), .B1(n182), .A0N(N37), .A1N(n155), .Y(n251) );
  INV U236 ( .A(sec_cnt[13]), .Y(n182) );
  OAI2BB2 U237 ( .B0(n161), .B1(n183), .A0N(N36), .A1N(n155), .Y(n252) );
  OAI2BB2 U238 ( .B0(n161), .B1(n184), .A0N(N35), .A1N(n155), .Y(n253) );
  OAI2BB2 U239 ( .B0(n161), .B1(n185), .A0N(N34), .A1N(n155), .Y(n254) );
  INV U240 ( .A(sec_cnt[10]), .Y(n185) );
  OAI2BB2 U241 ( .B0(n186), .B1(n161), .A0N(N33), .A1N(n155), .Y(n255) );
  OAI2BB2 U242 ( .B0(n187), .B1(n161), .A0N(N32), .A1N(n155), .Y(n256) );
  OAI2BB2 U243 ( .B0(n161), .B1(n188), .A0N(N31), .A1N(n155), .Y(n257) );
  INV U244 ( .A(n189), .Y(n258) );
  AOI22 U245 ( .A0(sec_cnt[6]), .A1(n154), .B0(N30), .B1(n155), .Y(n189) );
  INV U246 ( .A(n190), .Y(n259) );
  AOI22 U247 ( .A0(n154), .A1(sec_cnt[5]), .B0(N29), .B1(n155), .Y(n190) );
  INV U248 ( .A(n191), .Y(n260) );
  AOI22 U249 ( .A0(n165), .A1(sec_cnt[4]), .B0(N28), .B1(n155), .Y(n191) );
  INV U250 ( .A(n192), .Y(n261) );
  AOI22 U251 ( .A0(sec_cnt[3]), .A1(n165), .B0(N27), .B1(n155), .Y(n192) );
  OAI2BB2 U252 ( .B0(n193), .B1(n161), .A0N(N26), .A1N(n155), .Y(n262) );
  OAI2BB2 U253 ( .B0(n194), .B1(n161), .A0N(N25), .A1N(n155), .Y(n263) );
  INV U254 ( .A(n165), .Y(n161) );
  MX2 U255 ( .A(n155), .B(n165), .S0(sec_cnt[0]), .Y(n264) );
  NOR4BB U256 ( .AN(n195), .BN(n110), .C(n156), .D(done), .Y(n165) );
  NOR3B U257 ( .AN(n196), .B(n110), .C(n156), .Y(n163) );
  OR2 U258 ( .A(n197), .B(\seg_driver/N36 ), .Y(seg[3]) );
  AOI2BB1 U259 ( .A0N(selected_number[1]), .A1N(n158), .B0(selected_number[0]), 
        .Y(\seg_driver/N36 ) );
  MX2 U260 ( .A(n198), .B(n158), .S0(selected_number[1]), .Y(n197) );
  NOR2B U261 ( .AN(selected_number[0]), .B(n158), .Y(n198) );
  INV U262 ( .A(selected_number[2]), .Y(n158) );
  INV U263 ( .A(n199), .Y(n76) );
  AOI31 U264 ( .A0(\unique_inst/N17 ), .A1(n200), .A2(\unique_inst/N16 ), .B0(
        \unique_inst/selected_mask[3] ), .Y(n199) );
  INV U265 ( .A(n201), .Y(n75) );
  AOI31 U266 ( .A0(\unique_inst/N17 ), .A1(n202), .A2(n200), .B0(
        \unique_inst/selected_mask[2] ), .Y(n201) );
  OAI31 U267 ( .A0(n202), .A1(\unique_inst/N17 ), .A2(n203), .B0(n204), .Y(n74) );
  OAI31 U268 ( .A0(n203), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n205), .Y(n73) );
  INV U269 ( .A(n200), .Y(n203) );
  INV U270 ( .A(n206), .Y(n72) );
  AOI31 U271 ( .A0(n207), .A1(\unique_inst/N16 ), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[7] ), .Y(n206) );
  INV U272 ( .A(n208), .Y(n71) );
  AOI31 U273 ( .A0(n207), .A1(n202), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[6] ), .Y(n208) );
  OAI31 U274 ( .A0(n209), .A1(\unique_inst/N17 ), .A2(n202), .B0(n210), .Y(n70) );
  INV U275 ( .A(\unique_inst/N16 ), .Y(n202) );
  OAI31 U276 ( .A0(n209), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n211), .Y(n69) );
  MX2 U277 ( .A(state[1]), .B(n212), .S0(n213), .Y(n117) );
  NOR2 U278 ( .A(n156), .B(n214), .Y(n212) );
  AOI21 U279 ( .A0(n215), .A1(trigger), .B0(state[0]), .Y(n214) );
  AOI2BB1 U280 ( .A0N(req), .A1N(\unique_inst/searching ), .B0(
        \unique_inst/N40 ), .Y(n116) );
  OAI22 U281 ( .A0(n156), .A1(n195), .B0(n216), .B1(n213), .Y(n115) );
  OAI211 U282 ( .A0(n110), .A1(n196), .B0(n195), .C0(n217), .Y(n213) );
  AOI21 U283 ( .A0(done), .A1(state[0]), .B0(n156), .Y(n217) );
  AND2 U284 ( .A(n218), .B(n219), .Y(n196) );
  NOR4BB U285 ( .AN(n220), .BN(n221), .C(sec_cnt[28]), .D(sec_cnt[27]), .Y(
        n219) );
  NOR4BB U286 ( .AN(n169), .BN(n171), .C(sec_cnt[23]), .D(sec_cnt[25]), .Y(
        n221) );
  INV U287 ( .A(sec_cnt[24]), .Y(n171) );
  INV U288 ( .A(sec_cnt[26]), .Y(n169) );
  NOR3B U289 ( .AN(n162), .B(sec_cnt[30]), .C(sec_cnt[29]), .Y(n220) );
  INV U290 ( .A(sec_cnt[31]), .Y(n162) );
  NOR4BB U291 ( .AN(n222), .BN(n177), .C(sec_cnt[17]), .D(n223), .Y(n218) );
  OAI31 U292 ( .A0(n180), .A1(n224), .A2(n181), .B0(n179), .Y(n223) );
  INV U293 ( .A(sec_cnt[16]), .Y(n179) );
  INV U294 ( .A(sec_cnt[14]), .Y(n181) );
  NOR4BB U295 ( .AN(n225), .BN(n184), .C(sec_cnt[10]), .D(n226), .Y(n224) );
  AOI211 U296 ( .A0(n227), .A1(n188), .B0(n186), .C0(n187), .Y(n226) );
  INV U297 ( .A(sec_cnt[8]), .Y(n187) );
  INV U298 ( .A(sec_cnt[9]), .Y(n186) );
  INV U299 ( .A(sec_cnt[7]), .Y(n188) );
  OAI31 U300 ( .A0(n228), .A1(sec_cnt[5]), .A2(sec_cnt[4]), .B0(sec_cnt[6]), 
        .Y(n227) );
  NOR4BB U301 ( .AN(sec_cnt[3]), .BN(sec_cnt[0]), .C(n193), .D(n194), .Y(n228)
         );
  INV U302 ( .A(sec_cnt[1]), .Y(n194) );
  INV U303 ( .A(sec_cnt[2]), .Y(n193) );
  INV U304 ( .A(sec_cnt[11]), .Y(n184) );
  NOR2B U305 ( .AN(n183), .B(sec_cnt[13]), .Y(n225) );
  INV U306 ( .A(sec_cnt[12]), .Y(n183) );
  INV U307 ( .A(sec_cnt[15]), .Y(n180) );
  INV U308 ( .A(sec_cnt[18]), .Y(n177) );
  NOR4BB U309 ( .AN(n173), .BN(n175), .C(sec_cnt[19]), .D(sec_cnt[21]), .Y(
        n222) );
  INV U310 ( .A(sec_cnt[20]), .Y(n175) );
  INV U311 ( .A(sec_cnt[22]), .Y(n173) );
  OAI2BB1 U312 ( .A0N(n215), .A1N(state[0]), .B0(n110), .Y(n195) );
  INV U313 ( .A(rstn), .Y(n156) );
  MX2 U314 ( .A(selected_number[0]), .B(\unique_inst/N16 ), .S0(
        \unique_inst/N40 ), .Y(n114) );
  MX2 U315 ( .A(selected_number[1]), .B(\unique_inst/N17 ), .S0(
        \unique_inst/N40 ), .Y(n113) );
  INV U316 ( .A(n229), .Y(\unique_inst/N40 ) );
  OAI2BB1 U317 ( .A0N(n229), .A1N(selected_number[2]), .B0(n209), .Y(n112) );
  INV U318 ( .A(n207), .Y(n209) );
  NOR2 U319 ( .A(n207), .B(n200), .Y(n229) );
  NOR3 U320 ( .A(n230), .B(n123), .C(\unique_inst/N18 ), .Y(n200) );
  NOR3B U321 ( .AN(\unique_inst/N18 ), .B(n230), .C(n120), .Y(n207) );
  INV U322 ( .A(\unique_inst/searching ), .Y(n230) );
  NOR2B U323 ( .AN(n216), .B(trigger), .Y(n111) );
  AND2 U324 ( .A(n231), .B(n232), .Y(trigger) );
  NOR4BB U325 ( .AN(\unique_inst/selected_mask[3] ), .BN(
        \unique_inst/selected_mask[2] ), .C(n205), .D(n204), .Y(n232) );
  INV U326 ( .A(\unique_inst/selected_mask[1] ), .Y(n204) );
  INV U327 ( .A(\unique_inst/selected_mask[0] ), .Y(n205) );
  NOR4BB U328 ( .AN(\unique_inst/selected_mask[7] ), .BN(
        \unique_inst/selected_mask[6] ), .C(n211), .D(n210), .Y(n231) );
  INV U329 ( .A(\unique_inst/selected_mask[5] ), .Y(n210) );
  INV U330 ( .A(\unique_inst/selected_mask[4] ), .Y(n211) );
  INV U331 ( .A(state[0]), .Y(n216) );
  OR2 U332 ( .A(state[0]), .B(n215), .Y(n110) );
  INV U333 ( .A(state[1]), .Y(n215) );
endmodule

