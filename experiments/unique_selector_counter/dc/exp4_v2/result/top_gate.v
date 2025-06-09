
module top ( clk, rst, seg, trigger );
  output [6:0] seg;
  input clk, rst;
  output trigger;
  wire   req, done, N22, N23, N24, N25, N26, N27, N28, N29, N30, N31, N32, N33,
         N34, N35, N36, N37, N38, N39, N40, N41, N42, N43, N44, N45, N46, N47,
         N48, N49, N50, N51, N52, \prng_inst/feedback , \unique_inst/N43 ,
         \unique_inst/N40 , \unique_inst/searching ,
         \unique_inst/selected_mask[0] , \unique_inst/selected_mask[1] ,
         \unique_inst/selected_mask[2] , \unique_inst/selected_mask[3] ,
         \unique_inst/selected_mask[4] , \unique_inst/selected_mask[5] ,
         \unique_inst/selected_mask[6] , \unique_inst/selected_mask[7] ,
         \unique_inst/N18 , \unique_inst/N17 , \unique_inst/N16 ,
         \seg_driver/N68 , \seg_driver/N39 , \seg_driver/N36 ,
         \seg_driver/N24 , \seg_driver/N21 , \seg_driver/N14 , n75, n76, n77,
         n78, n79, n80, n81, n82, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n129, n130, n131, n132, n133, n134, n135,
         n136, n137, n138, n139, n140, n141, n142, n143, n144, n145, n146,
         n147, n148, n149, n150, n151, n152, n153, n154, n155, n156, n157,
         n158, n159, n160, n161, n162, n163, n164, n165, n166, n167, n168,
         n169, n170, n171, n172, n173, n174, n175, n176, n177, n178, n179,
         n180, n181, n182, n183, n184, n185, n186, n187, n188, n189, n190,
         n191, n192, n193, n194, n195, n196, n197, n198, n199, n200, n201,
         n202, n203, n204, n205, n206, n207, n208, n209, n210, n211, n212,
         n213, n214, n215, n216, n217, n218, n219, n220, n221, n222, n223,
         n224, n225, n226, n227, n228, n229, n230, n231, n232, n233, n234,
         n235, n236, n237, n238, n239, n240, n241, n242, n243, n244, n245,
         n246, n247, n248, n249, n250, n251, n252, n253, n254, n255, n256,
         n257, n258, n259, n260, n261, n262, n263, n264, n265, n266, n267,
         n268, n269, n270, n271, n272, n273, n274;
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

  DFFSHQ \prng_inst/random_reg[7]  ( .D(random[6]), .CK(clk), .SN(n242), .Q(
        random[7]) );
  DFFSHQ \prng_inst/random_reg[0]  ( .D(\prng_inst/feedback ), .CK(clk), .SN(
        n242), .Q(random[0]) );
  DFFRHQ \prng_inst/random_reg[1]  ( .D(random[0]), .CK(clk), .RN(n242), .Q(
        random[1]) );
  DFFSHQ \prng_inst/random_reg[2]  ( .D(random[1]), .CK(clk), .SN(n242), .Q(
        random[2]) );
  DFFRHQ \prng_inst/random_reg[3]  ( .D(random[2]), .CK(clk), .RN(n242), .Q(
        random[3]) );
  DFFRHQ \prng_inst/random_reg[4]  ( .D(random[3]), .CK(clk), .RN(n242), .Q(
        random[4]) );
  DFFSHQ \prng_inst/random_reg[5]  ( .D(random[4]), .CK(clk), .SN(n242), .Q(
        random[5]) );
  DFFRHQ \prng_inst/random_reg[6]  ( .D(random[5]), .CK(clk), .RN(n242), .Q(
        random[6]) );
  DFFRHQ \unique_inst/done_reg  ( .D(\unique_inst/N40 ), .CK(clk), .RN(n242), 
        .Q(done) );
  DFFHQ \sec_cnt_reg[31]  ( .D(n274), .CK(clk), .Q(sec_cnt[31]) );
  DFFHQ \sec_cnt_reg[0]  ( .D(n273), .CK(clk), .Q(sec_cnt[0]) );
  DFFHQ \sec_cnt_reg[1]  ( .D(n272), .CK(clk), .Q(sec_cnt[1]) );
  DFFHQ \sec_cnt_reg[2]  ( .D(n271), .CK(clk), .Q(sec_cnt[2]) );
  DFFHQ \sec_cnt_reg[3]  ( .D(n270), .CK(clk), .Q(sec_cnt[3]) );
  DFFHQ \sec_cnt_reg[4]  ( .D(n269), .CK(clk), .Q(sec_cnt[4]) );
  DFFHQ \sec_cnt_reg[5]  ( .D(n268), .CK(clk), .Q(sec_cnt[5]) );
  DFFHQ \sec_cnt_reg[6]  ( .D(n267), .CK(clk), .Q(sec_cnt[6]) );
  DFFHQ \sec_cnt_reg[7]  ( .D(n266), .CK(clk), .Q(sec_cnt[7]) );
  DFFHQ \sec_cnt_reg[8]  ( .D(n265), .CK(clk), .Q(sec_cnt[8]) );
  DFFHQ \sec_cnt_reg[9]  ( .D(n264), .CK(clk), .Q(sec_cnt[9]) );
  DFFHQ \sec_cnt_reg[10]  ( .D(n263), .CK(clk), .Q(sec_cnt[10]) );
  DFFHQ \sec_cnt_reg[11]  ( .D(n262), .CK(clk), .Q(sec_cnt[11]) );
  DFFHQ \sec_cnt_reg[12]  ( .D(n261), .CK(clk), .Q(sec_cnt[12]) );
  DFFHQ \sec_cnt_reg[13]  ( .D(n260), .CK(clk), .Q(sec_cnt[13]) );
  DFFHQ \sec_cnt_reg[14]  ( .D(n259), .CK(clk), .Q(sec_cnt[14]) );
  DFFHQ \sec_cnt_reg[15]  ( .D(n258), .CK(clk), .Q(sec_cnt[15]) );
  DFFHQ \sec_cnt_reg[16]  ( .D(n257), .CK(clk), .Q(sec_cnt[16]) );
  DFFHQ \sec_cnt_reg[17]  ( .D(n256), .CK(clk), .Q(sec_cnt[17]) );
  DFFHQ \sec_cnt_reg[18]  ( .D(n255), .CK(clk), .Q(sec_cnt[18]) );
  DFFHQ \sec_cnt_reg[19]  ( .D(n254), .CK(clk), .Q(sec_cnt[19]) );
  DFFHQ \sec_cnt_reg[20]  ( .D(n253), .CK(clk), .Q(sec_cnt[20]) );
  DFFHQ \sec_cnt_reg[21]  ( .D(n252), .CK(clk), .Q(sec_cnt[21]) );
  DFFHQ \sec_cnt_reg[22]  ( .D(n251), .CK(clk), .Q(sec_cnt[22]) );
  DFFHQ \sec_cnt_reg[23]  ( .D(n250), .CK(clk), .Q(sec_cnt[23]) );
  DFFHQ \sec_cnt_reg[24]  ( .D(n249), .CK(clk), .Q(sec_cnt[24]) );
  DFFHQ \sec_cnt_reg[25]  ( .D(n248), .CK(clk), .Q(sec_cnt[25]) );
  DFFHQ \sec_cnt_reg[26]  ( .D(n247), .CK(clk), .Q(sec_cnt[26]) );
  DFFHQ \sec_cnt_reg[27]  ( .D(n246), .CK(clk), .Q(sec_cnt[27]) );
  DFFHQ \sec_cnt_reg[28]  ( .D(n245), .CK(clk), .Q(sec_cnt[28]) );
  DFFHQ \sec_cnt_reg[29]  ( .D(n244), .CK(clk), .Q(sec_cnt[29]) );
  DFFHQ \sec_cnt_reg[30]  ( .D(n243), .CK(clk), .Q(sec_cnt[30]) );
  DFFHQ \state_reg[0]  ( .D(n121), .CK(clk), .Q(state[0]) );
  DFFHQ req_reg ( .D(n241), .CK(clk), .Q(req) );
  DFFRHQ \unique_inst/searching_reg  ( .D(n122), .CK(clk), .RN(n242), .Q(
        \unique_inst/searching ) );
  EDFFHQ \unique_inst/potential_number_reg[0]  ( .D(random[0]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N16 ) );
  EDFFHQ \unique_inst/potential_number_reg[1]  ( .D(random[1]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N17 ) );
  EDFFHQ \unique_inst/potential_number_reg[2]  ( .D(random[2]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N18 ) );
  DFFRHQ \unique_inst/selected_mask_reg[3]  ( .D(n82), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[3] ) );
  DFFRHQ \unique_inst/selected_mask_reg[2]  ( .D(n81), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[2] ) );
  DFFRHQ \unique_inst/selected_mask_reg[1]  ( .D(n80), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[1] ) );
  DFFRHQ \unique_inst/selected_mask_reg[0]  ( .D(n79), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[0] ) );
  DFFRHQ \unique_inst/selected_number_reg[0]  ( .D(n120), .CK(clk), .RN(n242), 
        .Q(selected_number[0]) );
  DFFRHQ \unique_inst/selected_number_reg[1]  ( .D(n119), .CK(clk), .RN(n242), 
        .Q(selected_number[1]) );
  DFFRHQ \unique_inst/selected_mask_reg[7]  ( .D(n78), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[7] ) );
  DFFRHQ \unique_inst/selected_mask_reg[6]  ( .D(n77), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[6] ) );
  DFFRHQ \unique_inst/selected_mask_reg[5]  ( .D(n76), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[5] ) );
  DFFRHQ \unique_inst/selected_mask_reg[4]  ( .D(n75), .CK(clk), .RN(n242), 
        .Q(\unique_inst/selected_mask[4] ) );
  DFFRHQ \unique_inst/selected_number_reg[2]  ( .D(n118), .CK(clk), .RN(n242), 
        .Q(selected_number[2]) );
  DFFHQ \state_reg[1]  ( .D(n123), .CK(clk), .Q(state[1]) );
  MX2 U135 ( .A(\unique_inst/selected_mask[6] ), .B(
        \unique_inst/selected_mask[7] ), .S0(\unique_inst/N16 ), .Y(n124) );
  MX2 U136 ( .A(\unique_inst/selected_mask[4] ), .B(
        \unique_inst/selected_mask[5] ), .S0(\unique_inst/N16 ), .Y(n125) );
  MX2 U137 ( .A(n125), .B(n124), .S0(\unique_inst/N17 ), .Y(n126) );
  MX2 U138 ( .A(\unique_inst/selected_mask[2] ), .B(
        \unique_inst/selected_mask[3] ), .S0(\unique_inst/N16 ), .Y(n127) );
  MX2 U139 ( .A(\unique_inst/selected_mask[0] ), .B(
        \unique_inst/selected_mask[1] ), .S0(\unique_inst/N16 ), .Y(n128) );
  MX2 U140 ( .A(n128), .B(n127), .S0(\unique_inst/N17 ), .Y(n129) );
  AND2 U141 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(n130) );
  AND2 U142 ( .A(sec_cnt[2]), .B(n130), .Y(n131) );
  AND2 U143 ( .A(sec_cnt[3]), .B(n131), .Y(n132) );
  AND2 U144 ( .A(sec_cnt[4]), .B(n132), .Y(n133) );
  AND2 U145 ( .A(sec_cnt[5]), .B(n133), .Y(n134) );
  AND2 U146 ( .A(sec_cnt[6]), .B(n134), .Y(n135) );
  AND2 U147 ( .A(sec_cnt[7]), .B(n135), .Y(n136) );
  AND2 U148 ( .A(sec_cnt[8]), .B(n136), .Y(n137) );
  AND2 U149 ( .A(sec_cnt[9]), .B(n137), .Y(n138) );
  AND2 U150 ( .A(sec_cnt[10]), .B(n138), .Y(n139) );
  AND2 U151 ( .A(sec_cnt[11]), .B(n139), .Y(n140) );
  AND2 U152 ( .A(sec_cnt[12]), .B(n140), .Y(n141) );
  AND2 U153 ( .A(sec_cnt[13]), .B(n141), .Y(n142) );
  AND2 U154 ( .A(sec_cnt[14]), .B(n142), .Y(n143) );
  AND2 U155 ( .A(sec_cnt[15]), .B(n143), .Y(n144) );
  AND2 U156 ( .A(sec_cnt[16]), .B(n144), .Y(n145) );
  AND2 U157 ( .A(sec_cnt[17]), .B(n145), .Y(n146) );
  AND2 U158 ( .A(sec_cnt[18]), .B(n146), .Y(n147) );
  AND2 U159 ( .A(sec_cnt[19]), .B(n147), .Y(n148) );
  AND2 U160 ( .A(sec_cnt[20]), .B(n148), .Y(n149) );
  AND2 U161 ( .A(sec_cnt[21]), .B(n149), .Y(n150) );
  AND2 U162 ( .A(sec_cnt[22]), .B(n150), .Y(n151) );
  AND2 U163 ( .A(sec_cnt[23]), .B(n151), .Y(n152) );
  AND2 U164 ( .A(sec_cnt[24]), .B(n152), .Y(n153) );
  AND2 U165 ( .A(sec_cnt[25]), .B(n153), .Y(n154) );
  AND2 U166 ( .A(sec_cnt[26]), .B(n154), .Y(n155) );
  AND2 U167 ( .A(sec_cnt[27]), .B(n155), .Y(n156) );
  AND2 U168 ( .A(sec_cnt[28]), .B(n156), .Y(n157) );
  AND2 U169 ( .A(sec_cnt[29]), .B(n157), .Y(n158) );
  AND2 U170 ( .A(sec_cnt[30]), .B(n158), .Y(n159) );
  INV U171 ( .A(n174), .Y(n160) );
  BUF U172 ( .I(n171), .O(n161) );
  XOR2 U173 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(N22) );
  XOR2 U174 ( .A(sec_cnt[2]), .B(n130), .Y(N23) );
  XOR2 U175 ( .A(sec_cnt[3]), .B(n131), .Y(N24) );
  XOR2 U176 ( .A(sec_cnt[4]), .B(n132), .Y(N25) );
  XOR2 U177 ( .A(sec_cnt[5]), .B(n133), .Y(N26) );
  XOR2 U178 ( .A(sec_cnt[6]), .B(n134), .Y(N27) );
  XOR2 U179 ( .A(sec_cnt[7]), .B(n135), .Y(N28) );
  XOR2 U180 ( .A(sec_cnt[8]), .B(n136), .Y(N29) );
  XOR2 U181 ( .A(sec_cnt[9]), .B(n137), .Y(N30) );
  XOR2 U182 ( .A(sec_cnt[10]), .B(n138), .Y(N31) );
  XOR2 U183 ( .A(sec_cnt[11]), .B(n139), .Y(N32) );
  XOR2 U184 ( .A(sec_cnt[12]), .B(n140), .Y(N33) );
  XOR2 U185 ( .A(sec_cnt[13]), .B(n141), .Y(N34) );
  XOR2 U186 ( .A(sec_cnt[14]), .B(n142), .Y(N35) );
  XOR2 U187 ( .A(sec_cnt[15]), .B(n143), .Y(N36) );
  XOR2 U188 ( .A(sec_cnt[16]), .B(n144), .Y(N37) );
  XOR2 U189 ( .A(sec_cnt[17]), .B(n145), .Y(N38) );
  XOR2 U190 ( .A(sec_cnt[18]), .B(n146), .Y(N39) );
  XOR2 U191 ( .A(sec_cnt[19]), .B(n147), .Y(N40) );
  XOR2 U192 ( .A(sec_cnt[20]), .B(n148), .Y(N41) );
  XOR2 U193 ( .A(sec_cnt[21]), .B(n149), .Y(N42) );
  XOR2 U194 ( .A(sec_cnt[22]), .B(n150), .Y(N43) );
  XOR2 U195 ( .A(sec_cnt[23]), .B(n151), .Y(N44) );
  XOR2 U196 ( .A(sec_cnt[24]), .B(n152), .Y(N45) );
  XOR2 U197 ( .A(sec_cnt[25]), .B(n153), .Y(N46) );
  XOR2 U198 ( .A(sec_cnt[26]), .B(n154), .Y(N47) );
  XOR2 U199 ( .A(sec_cnt[27]), .B(n155), .Y(N48) );
  XOR2 U200 ( .A(sec_cnt[28]), .B(n156), .Y(N49) );
  XOR2 U201 ( .A(sec_cnt[29]), .B(n157), .Y(N50) );
  XOR2 U202 ( .A(sec_cnt[30]), .B(n158), .Y(N51) );
  XOR2 U203 ( .A(sec_cnt[31]), .B(n159), .Y(N52) );
  NOR2B U204 ( .AN(\unique_inst/searching ), .B(rst), .Y(\unique_inst/N43 ) );
  MX2 U205 ( .A(n162), .B(selected_number[1]), .S0(n163), .Y(\seg_driver/N68 )
         );
  OAI2BB2 U206 ( .B0(selected_number[1]), .B1(selected_number[0]), .A0N(
        selected_number[2]), .A1N(n162), .Y(\seg_driver/N39 ) );
  NAND3B U207 ( .AN(selected_number[0]), .B(selected_number[1]), .C(n163), .Y(
        \seg_driver/N24 ) );
  OAI211 U208 ( .A0(selected_number[1]), .A1(selected_number[0]), .B0(n162), 
        .C0(selected_number[2]), .Y(\seg_driver/N21 ) );
  NAND2 U209 ( .A(selected_number[0]), .B(selected_number[1]), .Y(n162) );
  NAND2B U210 ( .AN(selected_number[1]), .B(n164), .Y(\seg_driver/N14 ) );
  XNOR2 U211 ( .A(n163), .B(selected_number[0]), .Y(n164) );
  ADDF U212 ( .A(random[4]), .B(random[3]), .CI(n165), .S(\prng_inst/feedback ) );
  XOR2 U213 ( .A(random[7]), .B(random[5]), .Y(n165) );
  MX2 U214 ( .A(n166), .B(req), .S0(n167), .Y(n241) );
  NOR3B U215 ( .AN(n168), .B(rst), .C(trigger), .Y(n166) );
  INV U216 ( .A(rst), .Y(n242) );
  OAI2BB2 U217 ( .B0(n160), .B1(n170), .A0N(N51), .A1N(n161), .Y(n243) );
  INV U218 ( .A(sec_cnt[30]), .Y(n170) );
  OAI2BB2 U219 ( .B0(n160), .B1(n172), .A0N(N50), .A1N(n161), .Y(n244) );
  INV U220 ( .A(n173), .Y(n245) );
  AOI22 U221 ( .A0(n174), .A1(sec_cnt[28]), .B0(N49), .B1(n161), .Y(n173) );
  INV U222 ( .A(n175), .Y(n246) );
  AOI22 U223 ( .A0(n174), .A1(sec_cnt[27]), .B0(N48), .B1(n161), .Y(n175) );
  OAI2BB2 U224 ( .B0(n160), .B1(n176), .A0N(N47), .A1N(n161), .Y(n247) );
  OAI2BB2 U225 ( .B0(n160), .B1(n177), .A0N(N46), .A1N(n161), .Y(n248) );
  INV U226 ( .A(n178), .Y(n249) );
  AOI22 U227 ( .A0(n174), .A1(sec_cnt[24]), .B0(N45), .B1(n161), .Y(n178) );
  OAI2BB2 U228 ( .B0(n160), .B1(n179), .A0N(N44), .A1N(n161), .Y(n250) );
  INV U229 ( .A(sec_cnt[23]), .Y(n179) );
  OAI2BB2 U230 ( .B0(n160), .B1(n180), .A0N(N43), .A1N(n161), .Y(n251) );
  OAI2BB2 U231 ( .B0(n160), .B1(n181), .A0N(N42), .A1N(n161), .Y(n252) );
  INV U232 ( .A(n182), .Y(n253) );
  AOI22 U233 ( .A0(n174), .A1(sec_cnt[20]), .B0(N41), .B1(n161), .Y(n182) );
  OAI2BB2 U234 ( .B0(n160), .B1(n183), .A0N(N40), .A1N(n161), .Y(n254) );
  INV U235 ( .A(sec_cnt[19]), .Y(n183) );
  OAI2BB2 U236 ( .B0(n160), .B1(n184), .A0N(N39), .A1N(n161), .Y(n255) );
  INV U237 ( .A(sec_cnt[18]), .Y(n184) );
  INV U238 ( .A(n185), .Y(n256) );
  AOI22 U239 ( .A0(n174), .A1(sec_cnt[17]), .B0(N38), .B1(n161), .Y(n185) );
  OAI2BB2 U240 ( .B0(n160), .B1(n186), .A0N(N37), .A1N(n161), .Y(n257) );
  OAI2BB2 U241 ( .B0(n187), .B1(n160), .A0N(N36), .A1N(n161), .Y(n258) );
  OAI2BB2 U242 ( .B0(n188), .B1(n160), .A0N(N35), .A1N(n161), .Y(n259) );
  OAI2BB2 U243 ( .B0(n160), .B1(n189), .A0N(N34), .A1N(n161), .Y(n260) );
  INV U244 ( .A(n190), .Y(n261) );
  AOI22 U245 ( .A0(n174), .A1(sec_cnt[12]), .B0(N33), .B1(n161), .Y(n190) );
  INV U246 ( .A(n191), .Y(n262) );
  AOI22 U247 ( .A0(n174), .A1(sec_cnt[11]), .B0(N32), .B1(n161), .Y(n191) );
  OAI2BB2 U248 ( .B0(n169), .B1(n192), .A0N(N31), .A1N(n161), .Y(n263) );
  OAI2BB2 U249 ( .B0(n193), .B1(n169), .A0N(N30), .A1N(n161), .Y(n264) );
  OAI2BB2 U250 ( .B0(n194), .B1(n169), .A0N(N29), .A1N(n161), .Y(n265) );
  OAI2BB2 U251 ( .B0(n169), .B1(n195), .A0N(N28), .A1N(n161), .Y(n266) );
  INV U252 ( .A(n196), .Y(n267) );
  AOI22 U253 ( .A0(sec_cnt[6]), .A1(n174), .B0(N27), .B1(n161), .Y(n196) );
  INV U254 ( .A(n197), .Y(n268) );
  AOI22 U255 ( .A0(n174), .A1(sec_cnt[5]), .B0(N26), .B1(n161), .Y(n197) );
  INV U256 ( .A(n198), .Y(n269) );
  AOI22 U257 ( .A0(n174), .A1(sec_cnt[4]), .B0(N25), .B1(n161), .Y(n198) );
  OAI2BB2 U258 ( .B0(n199), .B1(n169), .A0N(N24), .A1N(n161), .Y(n270) );
  INV U259 ( .A(n200), .Y(n271) );
  AOI22 U260 ( .A0(sec_cnt[2]), .A1(n174), .B0(N23), .B1(n161), .Y(n200) );
  OAI2BB2 U261 ( .B0(n201), .B1(n169), .A0N(N22), .A1N(n161), .Y(n272) );
  MX2 U262 ( .A(n161), .B(n174), .S0(sec_cnt[0]), .Y(n273) );
  INV U263 ( .A(n202), .Y(n274) );
  AOI22 U264 ( .A0(n174), .A1(sec_cnt[31]), .B0(N52), .B1(n161), .Y(n202) );
  NOR2B U265 ( .AN(n167), .B(n174), .Y(n171) );
  NOR2B U266 ( .AN(n203), .B(rst), .Y(n167) );
  INV U267 ( .A(n169), .Y(n174) );
  OAI2BB1 U268 ( .A0N(n203), .A1N(n204), .B0(n205), .Y(n169) );
  OR2 U269 ( .A(n206), .B(\seg_driver/N36 ), .Y(seg[3]) );
  AOI2BB1 U270 ( .A0N(selected_number[1]), .A1N(n163), .B0(selected_number[0]), 
        .Y(\seg_driver/N36 ) );
  MX2 U271 ( .A(n207), .B(n163), .S0(selected_number[1]), .Y(n206) );
  NOR2B U272 ( .AN(selected_number[0]), .B(n163), .Y(n207) );
  INV U273 ( .A(selected_number[2]), .Y(n163) );
  INV U274 ( .A(n208), .Y(n82) );
  AOI31 U275 ( .A0(\unique_inst/N17 ), .A1(n209), .A2(\unique_inst/N16 ), .B0(
        \unique_inst/selected_mask[3] ), .Y(n208) );
  INV U276 ( .A(n210), .Y(n81) );
  AOI31 U277 ( .A0(\unique_inst/N17 ), .A1(n211), .A2(n209), .B0(
        \unique_inst/selected_mask[2] ), .Y(n210) );
  OAI31 U278 ( .A0(n211), .A1(\unique_inst/N17 ), .A2(n212), .B0(n213), .Y(n80) );
  OAI31 U279 ( .A0(n212), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n214), .Y(n79) );
  INV U280 ( .A(n209), .Y(n212) );
  INV U281 ( .A(n215), .Y(n78) );
  AOI31 U282 ( .A0(n216), .A1(\unique_inst/N16 ), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[7] ), .Y(n215) );
  INV U283 ( .A(n217), .Y(n77) );
  AOI31 U284 ( .A0(n216), .A1(n211), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[6] ), .Y(n217) );
  OAI31 U285 ( .A0(n218), .A1(\unique_inst/N17 ), .A2(n211), .B0(n219), .Y(n76) );
  INV U286 ( .A(\unique_inst/N16 ), .Y(n211) );
  OAI31 U287 ( .A0(n218), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n220), .Y(n75) );
  MX2 U288 ( .A(state[1]), .B(n221), .S0(n222), .Y(n123) );
  NOR2 U289 ( .A(rst), .B(n223), .Y(n221) );
  AOI21 U290 ( .A0(n224), .A1(trigger), .B0(state[0]), .Y(n223) );
  AND2 U291 ( .A(n225), .B(n226), .Y(trigger) );
  NOR4BB U292 ( .AN(\unique_inst/selected_mask[3] ), .BN(
        \unique_inst/selected_mask[2] ), .C(n214), .D(n213), .Y(n226) );
  INV U293 ( .A(\unique_inst/selected_mask[1] ), .Y(n213) );
  INV U294 ( .A(\unique_inst/selected_mask[0] ), .Y(n214) );
  NOR4BB U295 ( .AN(\unique_inst/selected_mask[7] ), .BN(
        \unique_inst/selected_mask[6] ), .C(n220), .D(n219), .Y(n225) );
  INV U296 ( .A(\unique_inst/selected_mask[5] ), .Y(n219) );
  INV U297 ( .A(\unique_inst/selected_mask[4] ), .Y(n220) );
  AOI2BB1 U298 ( .A0N(req), .A1N(\unique_inst/searching ), .B0(
        \unique_inst/N40 ), .Y(n122) );
  OAI22 U299 ( .A0(n168), .A1(n222), .B0(rst), .B1(n227), .Y(n121) );
  OAI211 U300 ( .A0(n204), .A1(n228), .B0(n227), .C0(n205), .Y(n222) );
  AOI31 U301 ( .A0(state[0]), .A1(n224), .A2(done), .B0(rst), .Y(n205) );
  NAND2B U302 ( .AN(state[1]), .B(n168), .Y(n227) );
  INV U303 ( .A(n203), .Y(n228) );
  NOR2 U304 ( .A(state[0]), .B(n224), .Y(n203) );
  INV U305 ( .A(state[1]), .Y(n224) );
  AND2 U306 ( .A(n229), .B(n230), .Y(n204) );
  NOR4BB U307 ( .AN(n231), .BN(n232), .C(sec_cnt[28]), .D(sec_cnt[27]), .Y(
        n230) );
  NOR4BB U308 ( .AN(n176), .BN(n177), .C(sec_cnt[24]), .D(sec_cnt[23]), .Y(
        n232) );
  INV U309 ( .A(sec_cnt[25]), .Y(n177) );
  INV U310 ( .A(sec_cnt[26]), .Y(n176) );
  NOR3B U311 ( .AN(n172), .B(sec_cnt[31]), .C(sec_cnt[30]), .Y(n231) );
  INV U312 ( .A(sec_cnt[29]), .Y(n172) );
  NOR4B U313 ( .AN(n233), .B(sec_cnt[17]), .C(sec_cnt[18]), .D(n234), .Y(n229)
         );
  OAI31 U314 ( .A0(n187), .A1(n235), .A2(n188), .B0(n186), .Y(n234) );
  INV U315 ( .A(sec_cnt[16]), .Y(n186) );
  INV U316 ( .A(sec_cnt[14]), .Y(n188) );
  NOR4BB U317 ( .AN(n236), .BN(n192), .C(sec_cnt[11]), .D(n237), .Y(n235) );
  AOI211 U318 ( .A0(n238), .A1(n195), .B0(n193), .C0(n194), .Y(n237) );
  INV U319 ( .A(sec_cnt[8]), .Y(n194) );
  INV U320 ( .A(sec_cnt[9]), .Y(n193) );
  INV U321 ( .A(sec_cnt[7]), .Y(n195) );
  OAI31 U322 ( .A0(n239), .A1(sec_cnt[5]), .A2(sec_cnt[4]), .B0(sec_cnt[6]), 
        .Y(n238) );
  NOR4BB U323 ( .AN(sec_cnt[2]), .BN(sec_cnt[0]), .C(n199), .D(n201), .Y(n239)
         );
  INV U324 ( .A(sec_cnt[1]), .Y(n201) );
  INV U325 ( .A(sec_cnt[3]), .Y(n199) );
  INV U326 ( .A(sec_cnt[10]), .Y(n192) );
  NOR2B U327 ( .AN(n189), .B(sec_cnt[12]), .Y(n236) );
  INV U328 ( .A(sec_cnt[13]), .Y(n189) );
  INV U329 ( .A(sec_cnt[15]), .Y(n187) );
  NOR4BB U330 ( .AN(n180), .BN(n181), .C(sec_cnt[20]), .D(sec_cnt[19]), .Y(
        n233) );
  INV U331 ( .A(sec_cnt[21]), .Y(n181) );
  INV U332 ( .A(sec_cnt[22]), .Y(n180) );
  INV U333 ( .A(state[0]), .Y(n168) );
  MX2 U334 ( .A(selected_number[0]), .B(\unique_inst/N16 ), .S0(
        \unique_inst/N40 ), .Y(n120) );
  MX2 U335 ( .A(selected_number[1]), .B(\unique_inst/N17 ), .S0(
        \unique_inst/N40 ), .Y(n119) );
  INV U336 ( .A(n240), .Y(\unique_inst/N40 ) );
  OAI2BB1 U337 ( .A0N(n240), .A1N(selected_number[2]), .B0(n218), .Y(n118) );
  NOR2 U338 ( .A(n209), .B(n216), .Y(n240) );
  INV U339 ( .A(n218), .Y(n216) );
  NAND3B U340 ( .AN(n126), .B(\unique_inst/searching ), .C(\unique_inst/N18 ), 
        .Y(n218) );
  NOR3B U341 ( .AN(\unique_inst/searching ), .B(n129), .C(\unique_inst/N18 ), 
        .Y(n209) );
endmodule

