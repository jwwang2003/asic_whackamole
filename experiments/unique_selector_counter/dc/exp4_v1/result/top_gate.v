
module top ( clk, rst, seg );
  output [6:0] seg;
  input clk, rst;
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
         \seg_driver/N24 , \seg_driver/N21 , \seg_driver/N14 , n78, n79, n82,
         n83, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130, n131,
         n132, n133, n134, n135, n136, n137, n138, n139, n140, n141, n142,
         n143, n144, n145, n146, n147, n148, n149, n150, n151, n152, n153,
         n154, n155, n156, n157, n158, n159, n160, n161, n162, n163, n164,
         n165, n166, n167, n168, n169, n170, n171, n172, n173, n174, n175,
         n176, n177, n178, n179, n180, n181, n182, n183, n184, n185, n186,
         n187, n188, n189, n190, n191, n192, n193, n194, n195, n196, n197,
         n198, n199, n200, n201, n202, n203, n204, n205, n206, n207, n208,
         n209, n210, n211, n212, n213, n214, n215, n216, n217, n218, n219,
         n220, n221, n222, n223, n224, n225, n226, n227, n228, n229, n230,
         n231, n232, n233, n234, n235, n236, n237, n238, n239, n240, n241,
         n242, n243, n244, n245, n246, n247, n248, n249, n250, n251, n252,
         n253, n254, n255, n256, n257, n258, n259, n260, n261, n262, n263,
         n264, n265, n266, n267, n268, n269, n270, n271, n272, n273, n274,
         n275, n276, n277, n278, n279, n280, n281, n282;
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

  DFFSHQ \prng_inst/random_reg[7]  ( .D(random[6]), .CK(clk), .SN(n246), .Q(
        random[7]) );
  DFFSHQ \prng_inst/random_reg[0]  ( .D(\prng_inst/feedback ), .CK(clk), .SN(
        n246), .Q(random[0]) );
  DFFRHQ \prng_inst/random_reg[1]  ( .D(random[0]), .CK(clk), .RN(n246), .Q(
        random[1]) );
  DFFSHQ \prng_inst/random_reg[2]  ( .D(random[1]), .CK(clk), .SN(n246), .Q(
        random[2]) );
  DFFRHQ \prng_inst/random_reg[3]  ( .D(random[2]), .CK(clk), .RN(n246), .Q(
        random[3]) );
  DFFRHQ \prng_inst/random_reg[4]  ( .D(random[3]), .CK(clk), .RN(n246), .Q(
        random[4]) );
  DFFSHQ \prng_inst/random_reg[5]  ( .D(random[4]), .CK(clk), .SN(n246), .Q(
        random[5]) );
  DFFRHQ \prng_inst/random_reg[6]  ( .D(random[5]), .CK(clk), .RN(n246), .Q(
        random[6]) );
  DFFRHQ \unique_inst/done_reg  ( .D(\unique_inst/N40 ), .CK(clk), .RN(n246), 
        .Q(done) );
  DFFHQ \sec_cnt_reg[31]  ( .D(n278), .CK(clk), .Q(sec_cnt[31]) );
  DFFHQ \sec_cnt_reg[0]  ( .D(n277), .CK(clk), .Q(sec_cnt[0]) );
  DFFHQ \sec_cnt_reg[1]  ( .D(n276), .CK(clk), .Q(sec_cnt[1]) );
  DFFHQ \sec_cnt_reg[2]  ( .D(n275), .CK(clk), .Q(sec_cnt[2]) );
  DFFHQ \sec_cnt_reg[3]  ( .D(n274), .CK(clk), .Q(sec_cnt[3]) );
  DFFHQ \sec_cnt_reg[4]  ( .D(n273), .CK(clk), .Q(sec_cnt[4]) );
  DFFHQ \sec_cnt_reg[5]  ( .D(n272), .CK(clk), .Q(sec_cnt[5]) );
  DFFHQ \sec_cnt_reg[6]  ( .D(n271), .CK(clk), .Q(sec_cnt[6]) );
  DFFHQ \sec_cnt_reg[7]  ( .D(n270), .CK(clk), .Q(sec_cnt[7]) );
  DFFHQ \sec_cnt_reg[8]  ( .D(n269), .CK(clk), .Q(sec_cnt[8]) );
  DFFHQ \sec_cnt_reg[9]  ( .D(n268), .CK(clk), .Q(sec_cnt[9]) );
  DFFHQ \sec_cnt_reg[10]  ( .D(n267), .CK(clk), .Q(sec_cnt[10]) );
  DFFHQ \sec_cnt_reg[11]  ( .D(n266), .CK(clk), .Q(sec_cnt[11]) );
  DFFHQ \sec_cnt_reg[12]  ( .D(n265), .CK(clk), .Q(sec_cnt[12]) );
  DFFHQ \sec_cnt_reg[13]  ( .D(n264), .CK(clk), .Q(sec_cnt[13]) );
  DFFHQ \sec_cnt_reg[14]  ( .D(n263), .CK(clk), .Q(sec_cnt[14]) );
  DFFHQ \sec_cnt_reg[15]  ( .D(n262), .CK(clk), .Q(sec_cnt[15]) );
  DFFHQ \sec_cnt_reg[16]  ( .D(n261), .CK(clk), .Q(sec_cnt[16]) );
  DFFHQ \sec_cnt_reg[17]  ( .D(n260), .CK(clk), .Q(sec_cnt[17]) );
  DFFHQ \sec_cnt_reg[18]  ( .D(n259), .CK(clk), .Q(sec_cnt[18]) );
  DFFHQ \sec_cnt_reg[19]  ( .D(n258), .CK(clk), .Q(sec_cnt[19]) );
  DFFHQ \sec_cnt_reg[20]  ( .D(n257), .CK(clk), .Q(sec_cnt[20]) );
  DFFHQ \sec_cnt_reg[21]  ( .D(n256), .CK(clk), .Q(sec_cnt[21]) );
  DFFHQ \sec_cnt_reg[22]  ( .D(n255), .CK(clk), .Q(sec_cnt[22]) );
  DFFHQ \sec_cnt_reg[23]  ( .D(n254), .CK(clk), .Q(sec_cnt[23]) );
  DFFHQ \sec_cnt_reg[24]  ( .D(n253), .CK(clk), .Q(sec_cnt[24]) );
  DFFHQ \sec_cnt_reg[25]  ( .D(n252), .CK(clk), .Q(sec_cnt[25]) );
  DFFHQ \sec_cnt_reg[26]  ( .D(n251), .CK(clk), .Q(sec_cnt[26]) );
  DFFHQ \sec_cnt_reg[27]  ( .D(n250), .CK(clk), .Q(sec_cnt[27]) );
  DFFHQ \sec_cnt_reg[28]  ( .D(n249), .CK(clk), .Q(sec_cnt[28]) );
  DFFHQ \sec_cnt_reg[29]  ( .D(n248), .CK(clk), .Q(sec_cnt[29]) );
  DFFHQ \sec_cnt_reg[30]  ( .D(n247), .CK(clk), .Q(sec_cnt[30]) );
  DFFHQ \state_reg[0]  ( .D(n124), .CK(clk), .Q(state[0]) );
  DFFHQ req_reg ( .D(n245), .CK(clk), .Q(req) );
  DFFRHQ \unique_inst/searching_reg  ( .D(n125), .CK(clk), .RN(n246), .Q(
        \unique_inst/searching ) );
  EDFFHQ \unique_inst/potential_number_reg[0]  ( .D(random[0]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N16 ) );
  EDFFHQ \unique_inst/potential_number_reg[1]  ( .D(random[1]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N17 ) );
  EDFFHQ \unique_inst/potential_number_reg[2]  ( .D(random[2]), .E(
        \unique_inst/N43 ), .CK(clk), .Q(\unique_inst/N18 ) );
  DFFRHQ \unique_inst/selected_mask_reg[3]  ( .D(n281), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[3] ) );
  DFFRHQ \unique_inst/selected_mask_reg[2]  ( .D(n282), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[2] ) );
  DFFRHQ \unique_inst/selected_mask_reg[1]  ( .D(n83), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[1] ) );
  DFFRHQ \unique_inst/selected_mask_reg[0]  ( .D(n82), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[0] ) );
  DFFRHQ \unique_inst/selected_number_reg[0]  ( .D(n123), .CK(clk), .RN(n246), 
        .Q(selected_number[0]) );
  DFFRHQ \unique_inst/selected_number_reg[1]  ( .D(n122), .CK(clk), .RN(n246), 
        .Q(selected_number[1]) );
  DFFRHQ \unique_inst/selected_mask_reg[7]  ( .D(n279), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[7] ) );
  DFFRHQ \unique_inst/selected_mask_reg[6]  ( .D(n280), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[6] ) );
  DFFRHQ \unique_inst/selected_mask_reg[5]  ( .D(n79), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[5] ) );
  DFFRHQ \unique_inst/selected_mask_reg[4]  ( .D(n78), .CK(clk), .RN(n246), 
        .Q(\unique_inst/selected_mask[4] ) );
  DFFRHQ \unique_inst/selected_number_reg[2]  ( .D(n121), .CK(clk), .RN(n246), 
        .Q(selected_number[2]) );
  DFFHQ \state_reg[1]  ( .D(n126), .CK(clk), .Q(state[1]) );
  MX2 U137 ( .A(\unique_inst/selected_mask[6] ), .B(
        \unique_inst/selected_mask[7] ), .S0(\unique_inst/N16 ), .Y(n127) );
  MX2 U138 ( .A(\unique_inst/selected_mask[4] ), .B(
        \unique_inst/selected_mask[5] ), .S0(\unique_inst/N16 ), .Y(n128) );
  MX2 U139 ( .A(n128), .B(n127), .S0(\unique_inst/N17 ), .Y(n129) );
  MX2 U140 ( .A(\unique_inst/selected_mask[2] ), .B(
        \unique_inst/selected_mask[3] ), .S0(\unique_inst/N16 ), .Y(n130) );
  MX2 U141 ( .A(\unique_inst/selected_mask[0] ), .B(
        \unique_inst/selected_mask[1] ), .S0(\unique_inst/N16 ), .Y(n131) );
  MX2 U142 ( .A(n131), .B(n130), .S0(\unique_inst/N17 ), .Y(n132) );
  AND2 U143 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(n133) );
  AND2 U144 ( .A(sec_cnt[2]), .B(n133), .Y(n134) );
  AND2 U145 ( .A(sec_cnt[3]), .B(n134), .Y(n135) );
  AND2 U146 ( .A(sec_cnt[4]), .B(n135), .Y(n136) );
  AND2 U147 ( .A(sec_cnt[5]), .B(n136), .Y(n137) );
  AND2 U148 ( .A(sec_cnt[6]), .B(n137), .Y(n138) );
  AND2 U149 ( .A(sec_cnt[7]), .B(n138), .Y(n139) );
  AND2 U150 ( .A(sec_cnt[8]), .B(n139), .Y(n140) );
  AND2 U151 ( .A(sec_cnt[9]), .B(n140), .Y(n141) );
  AND2 U152 ( .A(sec_cnt[10]), .B(n141), .Y(n142) );
  AND2 U153 ( .A(sec_cnt[11]), .B(n142), .Y(n143) );
  AND2 U154 ( .A(sec_cnt[12]), .B(n143), .Y(n144) );
  AND2 U155 ( .A(sec_cnt[13]), .B(n144), .Y(n145) );
  AND2 U156 ( .A(sec_cnt[14]), .B(n145), .Y(n146) );
  AND2 U157 ( .A(sec_cnt[15]), .B(n146), .Y(n147) );
  AND2 U158 ( .A(sec_cnt[16]), .B(n147), .Y(n148) );
  AND2 U159 ( .A(sec_cnt[17]), .B(n148), .Y(n149) );
  AND2 U160 ( .A(sec_cnt[18]), .B(n149), .Y(n150) );
  AND2 U161 ( .A(sec_cnt[19]), .B(n150), .Y(n151) );
  AND2 U162 ( .A(sec_cnt[20]), .B(n151), .Y(n152) );
  AND2 U163 ( .A(sec_cnt[21]), .B(n152), .Y(n153) );
  AND2 U164 ( .A(sec_cnt[22]), .B(n153), .Y(n154) );
  AND2 U165 ( .A(sec_cnt[23]), .B(n154), .Y(n155) );
  AND2 U166 ( .A(sec_cnt[24]), .B(n155), .Y(n156) );
  AND2 U167 ( .A(sec_cnt[25]), .B(n156), .Y(n157) );
  AND2 U168 ( .A(sec_cnt[26]), .B(n157), .Y(n158) );
  AND2 U169 ( .A(sec_cnt[27]), .B(n158), .Y(n159) );
  AND2 U170 ( .A(sec_cnt[28]), .B(n159), .Y(n160) );
  AND2 U171 ( .A(sec_cnt[29]), .B(n160), .Y(n161) );
  AND2 U172 ( .A(sec_cnt[30]), .B(n161), .Y(n162) );
  INV U173 ( .A(n177), .Y(n163) );
  BUF U174 ( .I(n174), .O(n164) );
  XOR2 U175 ( .A(sec_cnt[1]), .B(sec_cnt[0]), .Y(N22) );
  XOR2 U176 ( .A(sec_cnt[2]), .B(n133), .Y(N23) );
  XOR2 U177 ( .A(sec_cnt[3]), .B(n134), .Y(N24) );
  XOR2 U178 ( .A(sec_cnt[4]), .B(n135), .Y(N25) );
  XOR2 U179 ( .A(sec_cnt[5]), .B(n136), .Y(N26) );
  XOR2 U180 ( .A(sec_cnt[6]), .B(n137), .Y(N27) );
  XOR2 U181 ( .A(sec_cnt[7]), .B(n138), .Y(N28) );
  XOR2 U182 ( .A(sec_cnt[8]), .B(n139), .Y(N29) );
  XOR2 U183 ( .A(sec_cnt[9]), .B(n140), .Y(N30) );
  XOR2 U184 ( .A(sec_cnt[10]), .B(n141), .Y(N31) );
  XOR2 U185 ( .A(sec_cnt[11]), .B(n142), .Y(N32) );
  XOR2 U186 ( .A(sec_cnt[12]), .B(n143), .Y(N33) );
  XOR2 U187 ( .A(sec_cnt[13]), .B(n144), .Y(N34) );
  XOR2 U188 ( .A(sec_cnt[14]), .B(n145), .Y(N35) );
  XOR2 U189 ( .A(sec_cnt[15]), .B(n146), .Y(N36) );
  XOR2 U190 ( .A(sec_cnt[16]), .B(n147), .Y(N37) );
  XOR2 U191 ( .A(sec_cnt[17]), .B(n148), .Y(N38) );
  XOR2 U192 ( .A(sec_cnt[18]), .B(n149), .Y(N39) );
  XOR2 U193 ( .A(sec_cnt[19]), .B(n150), .Y(N40) );
  XOR2 U194 ( .A(sec_cnt[20]), .B(n151), .Y(N41) );
  XOR2 U195 ( .A(sec_cnt[21]), .B(n152), .Y(N42) );
  XOR2 U196 ( .A(sec_cnt[22]), .B(n153), .Y(N43) );
  XOR2 U197 ( .A(sec_cnt[23]), .B(n154), .Y(N44) );
  XOR2 U198 ( .A(sec_cnt[24]), .B(n155), .Y(N45) );
  XOR2 U199 ( .A(sec_cnt[25]), .B(n156), .Y(N46) );
  XOR2 U200 ( .A(sec_cnt[26]), .B(n157), .Y(N47) );
  XOR2 U201 ( .A(sec_cnt[27]), .B(n158), .Y(N48) );
  XOR2 U202 ( .A(sec_cnt[28]), .B(n159), .Y(N49) );
  XOR2 U203 ( .A(sec_cnt[29]), .B(n160), .Y(N50) );
  XOR2 U204 ( .A(sec_cnt[30]), .B(n161), .Y(N51) );
  XOR2 U205 ( .A(sec_cnt[31]), .B(n162), .Y(N52) );
  NOR2B U206 ( .AN(\unique_inst/searching ), .B(rst), .Y(\unique_inst/N43 ) );
  MX2 U207 ( .A(n165), .B(selected_number[1]), .S0(n166), .Y(\seg_driver/N68 )
         );
  OAI2BB2 U208 ( .B0(selected_number[1]), .B1(selected_number[0]), .A0N(
        selected_number[2]), .A1N(n165), .Y(\seg_driver/N39 ) );
  NAND3B U209 ( .AN(selected_number[0]), .B(selected_number[1]), .C(n166), .Y(
        \seg_driver/N24 ) );
  OAI211 U210 ( .A0(selected_number[1]), .A1(selected_number[0]), .B0(n165), 
        .C0(selected_number[2]), .Y(\seg_driver/N21 ) );
  NAND2 U211 ( .A(selected_number[0]), .B(selected_number[1]), .Y(n165) );
  NAND2B U212 ( .AN(selected_number[1]), .B(n167), .Y(\seg_driver/N14 ) );
  XNOR2 U213 ( .A(n166), .B(selected_number[0]), .Y(n167) );
  ADDF U214 ( .A(random[4]), .B(random[3]), .CI(n168), .S(\prng_inst/feedback ) );
  XOR2 U215 ( .A(random[7]), .B(random[5]), .Y(n168) );
  MX2 U216 ( .A(n169), .B(req), .S0(n170), .Y(n245) );
  NOR3B U217 ( .AN(n171), .B(state[0]), .C(rst), .Y(n169) );
  INV U218 ( .A(rst), .Y(n246) );
  OAI2BB2 U219 ( .B0(n163), .B1(n173), .A0N(N51), .A1N(n164), .Y(n247) );
  INV U220 ( .A(sec_cnt[30]), .Y(n173) );
  OAI2BB2 U221 ( .B0(n163), .B1(n175), .A0N(N50), .A1N(n164), .Y(n248) );
  INV U222 ( .A(n176), .Y(n249) );
  AOI22 U223 ( .A0(n177), .A1(sec_cnt[28]), .B0(N49), .B1(n164), .Y(n176) );
  INV U224 ( .A(n178), .Y(n250) );
  AOI22 U225 ( .A0(n177), .A1(sec_cnt[27]), .B0(N48), .B1(n164), .Y(n178) );
  OAI2BB2 U226 ( .B0(n163), .B1(n179), .A0N(N47), .A1N(n164), .Y(n251) );
  OAI2BB2 U227 ( .B0(n163), .B1(n180), .A0N(N46), .A1N(n164), .Y(n252) );
  INV U228 ( .A(n181), .Y(n253) );
  AOI22 U229 ( .A0(n177), .A1(sec_cnt[24]), .B0(N45), .B1(n164), .Y(n181) );
  OAI2BB2 U230 ( .B0(n163), .B1(n182), .A0N(N44), .A1N(n164), .Y(n254) );
  INV U231 ( .A(sec_cnt[23]), .Y(n182) );
  OAI2BB2 U232 ( .B0(n163), .B1(n183), .A0N(N43), .A1N(n164), .Y(n255) );
  OAI2BB2 U233 ( .B0(n163), .B1(n184), .A0N(N42), .A1N(n164), .Y(n256) );
  INV U234 ( .A(n185), .Y(n257) );
  AOI22 U235 ( .A0(n177), .A1(sec_cnt[20]), .B0(N41), .B1(n164), .Y(n185) );
  OAI2BB2 U236 ( .B0(n163), .B1(n186), .A0N(N40), .A1N(n164), .Y(n258) );
  INV U237 ( .A(sec_cnt[19]), .Y(n186) );
  OAI2BB2 U238 ( .B0(n163), .B1(n187), .A0N(N39), .A1N(n164), .Y(n259) );
  INV U239 ( .A(sec_cnt[18]), .Y(n187) );
  INV U240 ( .A(n188), .Y(n260) );
  AOI22 U241 ( .A0(n177), .A1(sec_cnt[17]), .B0(N38), .B1(n164), .Y(n188) );
  OAI2BB2 U242 ( .B0(n163), .B1(n189), .A0N(N37), .A1N(n164), .Y(n261) );
  OAI2BB2 U243 ( .B0(n190), .B1(n163), .A0N(N36), .A1N(n164), .Y(n262) );
  OAI2BB2 U244 ( .B0(n191), .B1(n163), .A0N(N35), .A1N(n164), .Y(n263) );
  OAI2BB2 U245 ( .B0(n163), .B1(n192), .A0N(N34), .A1N(n164), .Y(n264) );
  INV U246 ( .A(n193), .Y(n265) );
  AOI22 U247 ( .A0(n177), .A1(sec_cnt[12]), .B0(N33), .B1(n164), .Y(n193) );
  INV U248 ( .A(n194), .Y(n266) );
  AOI22 U249 ( .A0(n177), .A1(sec_cnt[11]), .B0(N32), .B1(n164), .Y(n194) );
  OAI2BB2 U250 ( .B0(n172), .B1(n195), .A0N(N31), .A1N(n164), .Y(n267) );
  OAI2BB2 U251 ( .B0(n196), .B1(n172), .A0N(N30), .A1N(n164), .Y(n268) );
  OAI2BB2 U252 ( .B0(n197), .B1(n172), .A0N(N29), .A1N(n164), .Y(n269) );
  OAI2BB2 U253 ( .B0(n172), .B1(n198), .A0N(N28), .A1N(n164), .Y(n270) );
  INV U254 ( .A(n199), .Y(n271) );
  AOI22 U255 ( .A0(sec_cnt[6]), .A1(n177), .B0(N27), .B1(n164), .Y(n199) );
  INV U256 ( .A(n200), .Y(n272) );
  AOI22 U257 ( .A0(n177), .A1(sec_cnt[5]), .B0(N26), .B1(n164), .Y(n200) );
  INV U258 ( .A(n201), .Y(n273) );
  AOI22 U259 ( .A0(n177), .A1(sec_cnt[4]), .B0(N25), .B1(n164), .Y(n201) );
  OAI2BB2 U260 ( .B0(n202), .B1(n172), .A0N(N24), .A1N(n164), .Y(n274) );
  INV U261 ( .A(n203), .Y(n275) );
  AOI22 U262 ( .A0(sec_cnt[2]), .A1(n177), .B0(N23), .B1(n164), .Y(n203) );
  OAI2BB2 U263 ( .B0(n204), .B1(n172), .A0N(N22), .A1N(n164), .Y(n276) );
  MX2 U264 ( .A(n164), .B(n177), .S0(sec_cnt[0]), .Y(n277) );
  INV U265 ( .A(n205), .Y(n278) );
  AOI22 U266 ( .A0(n177), .A1(sec_cnt[31]), .B0(N52), .B1(n164), .Y(n205) );
  NOR2B U267 ( .AN(n170), .B(n177), .Y(n174) );
  NOR2B U268 ( .AN(n206), .B(rst), .Y(n170) );
  INV U269 ( .A(n172), .Y(n177) );
  OAI2BB1 U270 ( .A0N(n206), .A1N(n207), .B0(n208), .Y(n172) );
  INV U271 ( .A(n209), .Y(n279) );
  AOI31 U272 ( .A0(\unique_inst/N17 ), .A1(n210), .A2(\unique_inst/N16 ), .B0(
        \unique_inst/selected_mask[7] ), .Y(n209) );
  INV U273 ( .A(n211), .Y(n280) );
  AOI31 U274 ( .A0(\unique_inst/N17 ), .A1(n212), .A2(n210), .B0(
        \unique_inst/selected_mask[6] ), .Y(n211) );
  INV U275 ( .A(n213), .Y(n281) );
  AOI31 U276 ( .A0(n214), .A1(\unique_inst/N16 ), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[3] ), .Y(n213) );
  INV U277 ( .A(n215), .Y(n282) );
  AOI31 U278 ( .A0(n214), .A1(n212), .A2(\unique_inst/N17 ), .B0(
        \unique_inst/selected_mask[2] ), .Y(n215) );
  OR2 U279 ( .A(n216), .B(\seg_driver/N36 ), .Y(seg[3]) );
  AOI2BB1 U280 ( .A0N(selected_number[1]), .A1N(n166), .B0(selected_number[0]), 
        .Y(\seg_driver/N36 ) );
  MX2 U281 ( .A(n217), .B(n166), .S0(selected_number[1]), .Y(n216) );
  NOR2B U282 ( .AN(selected_number[0]), .B(n166), .Y(n217) );
  INV U283 ( .A(selected_number[2]), .Y(n166) );
  OAI31 U284 ( .A0(n218), .A1(\unique_inst/N17 ), .A2(n212), .B0(n219), .Y(n83) );
  OAI31 U285 ( .A0(n218), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n220), .Y(n82) );
  INV U286 ( .A(n214), .Y(n218) );
  OAI31 U287 ( .A0(n212), .A1(\unique_inst/N17 ), .A2(n221), .B0(n222), .Y(n79) );
  INV U288 ( .A(\unique_inst/N16 ), .Y(n212) );
  OAI31 U289 ( .A0(n221), .A1(\unique_inst/N17 ), .A2(\unique_inst/N16 ), .B0(
        n223), .Y(n78) );
  MX2 U290 ( .A(state[1]), .B(n224), .S0(n225), .Y(n126) );
  NOR2 U291 ( .A(rst), .B(n226), .Y(n224) );
  AOI2BB1 U292 ( .A0N(state[1]), .A1N(n171), .B0(state[0]), .Y(n226) );
  NAND2 U293 ( .A(n227), .B(n228), .Y(n171) );
  NOR4BB U294 ( .AN(\unique_inst/selected_mask[3] ), .BN(
        \unique_inst/selected_mask[2] ), .C(n220), .D(n219), .Y(n228) );
  INV U295 ( .A(\unique_inst/selected_mask[1] ), .Y(n219) );
  INV U296 ( .A(\unique_inst/selected_mask[0] ), .Y(n220) );
  NOR4BB U297 ( .AN(\unique_inst/selected_mask[7] ), .BN(
        \unique_inst/selected_mask[6] ), .C(n223), .D(n222), .Y(n227) );
  INV U298 ( .A(\unique_inst/selected_mask[5] ), .Y(n222) );
  INV U299 ( .A(\unique_inst/selected_mask[4] ), .Y(n223) );
  AOI2BB1 U300 ( .A0N(req), .A1N(\unique_inst/searching ), .B0(
        \unique_inst/N40 ), .Y(n125) );
  OAI22 U301 ( .A0(rst), .A1(n229), .B0(n230), .B1(n225), .Y(n124) );
  OAI211 U302 ( .A0(n207), .A1(n231), .B0(n229), .C0(n208), .Y(n225) );
  AOI31 U303 ( .A0(state[0]), .A1(n232), .A2(done), .B0(rst), .Y(n208) );
  INV U304 ( .A(n206), .Y(n231) );
  NOR2 U305 ( .A(n232), .B(state[0]), .Y(n206) );
  INV U306 ( .A(state[1]), .Y(n232) );
  AND2 U307 ( .A(n233), .B(n234), .Y(n207) );
  NOR4BB U308 ( .AN(n235), .BN(n236), .C(sec_cnt[28]), .D(sec_cnt[27]), .Y(
        n234) );
  NOR4BB U309 ( .AN(n179), .BN(n180), .C(sec_cnt[24]), .D(sec_cnt[23]), .Y(
        n236) );
  INV U310 ( .A(sec_cnt[25]), .Y(n180) );
  INV U311 ( .A(sec_cnt[26]), .Y(n179) );
  NOR3B U312 ( .AN(n175), .B(sec_cnt[31]), .C(sec_cnt[30]), .Y(n235) );
  INV U313 ( .A(sec_cnt[29]), .Y(n175) );
  NOR4B U314 ( .AN(n237), .B(sec_cnt[17]), .C(sec_cnt[18]), .D(n238), .Y(n233)
         );
  OAI31 U315 ( .A0(n190), .A1(n239), .A2(n191), .B0(n189), .Y(n238) );
  INV U316 ( .A(sec_cnt[16]), .Y(n189) );
  INV U317 ( .A(sec_cnt[14]), .Y(n191) );
  NOR4BB U318 ( .AN(n240), .BN(n195), .C(sec_cnt[11]), .D(n241), .Y(n239) );
  AOI211 U319 ( .A0(n242), .A1(n198), .B0(n196), .C0(n197), .Y(n241) );
  INV U320 ( .A(sec_cnt[8]), .Y(n197) );
  INV U321 ( .A(sec_cnt[9]), .Y(n196) );
  INV U322 ( .A(sec_cnt[7]), .Y(n198) );
  OAI31 U323 ( .A0(n243), .A1(sec_cnt[5]), .A2(sec_cnt[4]), .B0(sec_cnt[6]), 
        .Y(n242) );
  NOR4BB U324 ( .AN(sec_cnt[2]), .BN(sec_cnt[0]), .C(n202), .D(n204), .Y(n243)
         );
  INV U325 ( .A(sec_cnt[1]), .Y(n204) );
  INV U326 ( .A(sec_cnt[3]), .Y(n202) );
  INV U327 ( .A(sec_cnt[10]), .Y(n195) );
  NOR2B U328 ( .AN(n192), .B(sec_cnt[12]), .Y(n240) );
  INV U329 ( .A(sec_cnt[13]), .Y(n192) );
  INV U330 ( .A(sec_cnt[15]), .Y(n190) );
  NOR4BB U331 ( .AN(n183), .BN(n184), .C(sec_cnt[20]), .D(sec_cnt[19]), .Y(
        n237) );
  INV U332 ( .A(sec_cnt[21]), .Y(n184) );
  INV U333 ( .A(sec_cnt[22]), .Y(n183) );
  INV U334 ( .A(state[0]), .Y(n230) );
  OR2 U335 ( .A(state[0]), .B(state[1]), .Y(n229) );
  MX2 U336 ( .A(selected_number[0]), .B(\unique_inst/N16 ), .S0(
        \unique_inst/N40 ), .Y(n123) );
  MX2 U337 ( .A(selected_number[1]), .B(\unique_inst/N17 ), .S0(
        \unique_inst/N40 ), .Y(n122) );
  INV U338 ( .A(n244), .Y(\unique_inst/N40 ) );
  OAI2BB1 U339 ( .A0N(n244), .A1N(selected_number[2]), .B0(n221), .Y(n121) );
  NOR2 U340 ( .A(n214), .B(n210), .Y(n244) );
  INV U341 ( .A(n221), .Y(n210) );
  NAND3B U342 ( .AN(n129), .B(\unique_inst/searching ), .C(\unique_inst/N18 ), 
        .Y(n221) );
  NOR3B U343 ( .AN(\unique_inst/searching ), .B(n132), .C(\unique_inst/N18 ), 
        .Y(n214) );
endmodule

