
module timer_display ( clk, rst_n, seg );
  output [6:0] seg;
  input clk, rst_n;
  wire   \u_counter/N34 , \u_counter/N33 , \u_counter/N32 , \u_counter/N31 ,
         \u_counter/N30 , \u_counter/N29 , \u_counter/N28 , \u_counter/N27 ,
         \u_counter/N26 , \u_counter/N25 , \u_counter/N24 , \u_counter/N23 ,
         \u_counter/N22 , \u_counter/N21 , \u_counter/clk_div[0] ,
         \u_counter/clk_div[1] , \u_counter/clk_div[2] ,
         \u_counter/clk_div[3] , \u_counter/clk_div[4] ,
         \u_counter/clk_div[5] , \u_counter/clk_div[6] ,
         \u_counter/clk_div[7] , \u_counter/clk_div[8] ,
         \u_counter/clk_div[9] , \u_counter/clk_div[10] ,
         \u_counter/clk_div[11] , \u_counter/clk_div[12] ,
         \u_counter/clk_div[13] , \u_decoder/N27 , \u_decoder/N26 ,
         \u_decoder/N25 , \u_decoder/N22 , \u_decoder/N18 , \u_decoder/N14 ,
         \u_decoder/N11 , n42, n43, n44, n45, n47, n48, n49, n50, n51, n52,
         n53, n54, n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n65, n66,
         n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79, n80,
         n81, n82, n83, n84, n85, n86, n87, n88, n89, n90, n91, n92, n93, n94,
         n95, n96, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106,
         n107, n108, n109, n110, n111, n112;
  wire   [3:0] sec_digit;
  assign seg[0] = \u_decoder/N27 ;
  assign seg[1] = \u_decoder/N26 ;
  assign seg[2] = \u_decoder/N25 ;
  assign seg[3] = \u_decoder/N22 ;
  assign seg[4] = \u_decoder/N18 ;
  assign seg[5] = \u_decoder/N14 ;
  assign seg[6] = \u_decoder/N11 ;

  DFFHQ \u_counter/clk_div_reg[13]  ( .D(\u_counter/N34 ), .CK(clk), .Q(
        \u_counter/clk_div[13] ) );
  DFFHQ \u_counter/clk_div_reg[0]  ( .D(\u_counter/N21 ), .CK(clk), .Q(
        \u_counter/clk_div[0] ) );
  DFFHQ \u_counter/clk_div_reg[1]  ( .D(\u_counter/N22 ), .CK(clk), .Q(
        \u_counter/clk_div[1] ) );
  DFFHQ \u_counter/clk_div_reg[2]  ( .D(\u_counter/N23 ), .CK(clk), .Q(
        \u_counter/clk_div[2] ) );
  DFFHQ \u_counter/clk_div_reg[3]  ( .D(\u_counter/N24 ), .CK(clk), .Q(
        \u_counter/clk_div[3] ) );
  DFFHQ \u_counter/clk_div_reg[4]  ( .D(\u_counter/N25 ), .CK(clk), .Q(
        \u_counter/clk_div[4] ) );
  DFFHQ \u_counter/clk_div_reg[5]  ( .D(\u_counter/N26 ), .CK(clk), .Q(
        \u_counter/clk_div[5] ) );
  DFFHQ \u_counter/clk_div_reg[6]  ( .D(\u_counter/N27 ), .CK(clk), .Q(
        \u_counter/clk_div[6] ) );
  DFFHQ \u_counter/clk_div_reg[7]  ( .D(\u_counter/N28 ), .CK(clk), .Q(
        \u_counter/clk_div[7] ) );
  DFFHQ \u_counter/clk_div_reg[8]  ( .D(\u_counter/N29 ), .CK(clk), .Q(
        \u_counter/clk_div[8] ) );
  DFFHQ \u_counter/clk_div_reg[9]  ( .D(\u_counter/N30 ), .CK(clk), .Q(
        \u_counter/clk_div[9] ) );
  DFFHQ \u_counter/clk_div_reg[10]  ( .D(\u_counter/N31 ), .CK(clk), .Q(
        \u_counter/clk_div[10] ) );
  DFFHQ \u_counter/clk_div_reg[11]  ( .D(\u_counter/N32 ), .CK(clk), .Q(
        \u_counter/clk_div[11] ) );
  DFFHQ \u_counter/clk_div_reg[12]  ( .D(\u_counter/N33 ), .CK(clk), .Q(
        \u_counter/clk_div[12] ) );
  DFFHQ \u_counter/sec_digit_reg[0]  ( .D(n45), .CK(clk), .Q(sec_digit[0]) );
  DFFHQ \u_counter/sec_digit_reg[2]  ( .D(n43), .CK(clk), .Q(sec_digit[2]) );
  DFFHQ \u_counter/sec_digit_reg[1]  ( .D(n44), .CK(clk), .Q(sec_digit[1]) );
  DFFHQ \u_counter/sec_digit_reg[3]  ( .D(n42), .CK(clk), .Q(sec_digit[3]) );
  INV U68 ( .A(n64), .Y(n47) );
  INV U69 ( .A(n47), .Y(n48) );
  NAND2 U70 ( .A(n49), .B(n50), .Y(\u_decoder/N27 ) );
  NAND2 U71 ( .A(n49), .B(n51), .Y(\u_decoder/N26 ) );
  AOI2BB1 U72 ( .A0N(n52), .A1N(n53), .B0(n54), .Y(n49) );
  OAI211 U73 ( .A0(sec_digit[1]), .A1(n55), .B0(n56), .C0(n50), .Y(
        \u_decoder/N22 ) );
  NAND2B U74 ( .AN(sec_digit[2]), .B(n57), .Y(n50) );
  NOR2 U75 ( .A(n54), .B(\u_decoder/N25 ), .Y(n56) );
  AOI2BB1 U76 ( .A0N(n57), .A1N(n58), .B0(sec_digit[0]), .Y(\u_decoder/N25 )
         );
  OAI211 U77 ( .A0(sec_digit[3]), .A1(n59), .B0(n60), .C0(n53), .Y(
        \u_decoder/N18 ) );
  INV U78 ( .A(n61), .Y(n53) );
  OAI211 U79 ( .A0(sec_digit[3]), .A1(n62), .B0(n51), .C0(n60), .Y(
        \u_decoder/N14 ) );
  OR3 U80 ( .A(sec_digit[3]), .B(sec_digit[1]), .C(sec_digit[0]), .Y(n51) );
  NOR2B U81 ( .AN(sec_digit[2]), .B(n52), .Y(n62) );
  OAI211 U82 ( .A0(sec_digit[0]), .A1(n60), .B0(n63), .C0(n55), .Y(
        \u_decoder/N11 ) );
  NOR2 U83 ( .A(n57), .B(n54), .Y(n63) );
  NOR2B U84 ( .AN(sec_digit[1]), .B(sec_digit[3]), .Y(n57) );
  NOR2B U85 ( .AN(n48), .B(n65), .Y(\u_counter/N34 ) );
  XNOR2 U86 ( .A(\u_counter/clk_div[13] ), .B(n66), .Y(n65) );
  NOR2B U87 ( .AN(\u_counter/clk_div[12] ), .B(n67), .Y(n66) );
  NOR2B U88 ( .AN(n48), .B(n68), .Y(\u_counter/N33 ) );
  XOR2 U89 ( .A(\u_counter/clk_div[12] ), .B(n67), .Y(n68) );
  NAND2 U90 ( .A(n69), .B(\u_counter/clk_div[11] ), .Y(n67) );
  NOR2B U91 ( .AN(n48), .B(n70), .Y(\u_counter/N32 ) );
  XNOR2 U92 ( .A(n69), .B(\u_counter/clk_div[11] ), .Y(n70) );
  NOR2B U93 ( .AN(n71), .B(n72), .Y(n69) );
  NOR2B U94 ( .AN(n48), .B(n73), .Y(\u_counter/N31 ) );
  XNOR2 U95 ( .A(\u_counter/clk_div[10] ), .B(n71), .Y(n73) );
  NOR2B U96 ( .AN(\u_counter/clk_div[9] ), .B(n74), .Y(n71) );
  NOR2B U97 ( .AN(n48), .B(n75), .Y(\u_counter/N30 ) );
  XOR2 U98 ( .A(\u_counter/clk_div[9] ), .B(n74), .Y(n75) );
  NAND2 U99 ( .A(\u_counter/clk_div[8] ), .B(n76), .Y(n74) );
  NOR2B U100 ( .AN(n48), .B(n77), .Y(\u_counter/N29 ) );
  XNOR2 U101 ( .A(\u_counter/clk_div[8] ), .B(n76), .Y(n77) );
  NOR2B U102 ( .AN(\u_counter/clk_div[7] ), .B(n78), .Y(n76) );
  NOR2B U103 ( .AN(n48), .B(n79), .Y(\u_counter/N28 ) );
  XOR2 U104 ( .A(\u_counter/clk_div[7] ), .B(n78), .Y(n79) );
  NAND2 U105 ( .A(n80), .B(\u_counter/clk_div[6] ), .Y(n78) );
  NOR2B U106 ( .AN(n48), .B(n81), .Y(\u_counter/N27 ) );
  XNOR2 U107 ( .A(n80), .B(\u_counter/clk_div[6] ), .Y(n81) );
  NOR2B U108 ( .AN(n82), .B(n83), .Y(n80) );
  INV U109 ( .A(\u_counter/clk_div[5] ), .Y(n83) );
  NOR2B U110 ( .AN(n48), .B(n84), .Y(\u_counter/N26 ) );
  XNOR2 U111 ( .A(n82), .B(\u_counter/clk_div[5] ), .Y(n84) );
  NOR2B U112 ( .AN(\u_counter/clk_div[4] ), .B(n85), .Y(n82) );
  NOR2B U113 ( .AN(n48), .B(n86), .Y(\u_counter/N25 ) );
  XOR2 U114 ( .A(\u_counter/clk_div[4] ), .B(n85), .Y(n86) );
  NOR2B U115 ( .AN(n48), .B(n87), .Y(\u_counter/N24 ) );
  XNOR2 U116 ( .A(n88), .B(\u_counter/clk_div[3] ), .Y(n87) );
  OAI2BB2 U117 ( .B0(n89), .B1(n90), .A0N(n48), .A1N(n91), .Y(\u_counter/N23 )
         );
  MX2 U118 ( .A(\u_counter/clk_div[2] ), .B(n92), .S0(\u_counter/clk_div[1] ), 
        .Y(n91) );
  NOR2B U119 ( .AN(\u_counter/clk_div[0] ), .B(\u_counter/clk_div[2] ), .Y(n92) );
  INV U120 ( .A(\u_counter/N21 ), .Y(n90) );
  INV U121 ( .A(\u_counter/clk_div[2] ), .Y(n89) );
  MX2 U122 ( .A(n93), .B(\u_counter/N21 ), .S0(\u_counter/clk_div[1] ), .Y(
        \u_counter/N22 ) );
  NOR2B U123 ( .AN(n48), .B(n94), .Y(n93) );
  NOR2B U124 ( .AN(n48), .B(\u_counter/clk_div[0] ), .Y(\u_counter/N21 ) );
  MX2 U125 ( .A(n95), .B(n48), .S0(sec_digit[0]), .Y(n45) );
  NOR2B U126 ( .AN(n96), .B(n97), .Y(n95) );
  INV U127 ( .A(rst_n), .Y(n97) );
  MX2 U128 ( .A(n98), .B(n99), .S0(sec_digit[1]), .Y(n44) );
  INV U129 ( .A(n100), .Y(n99) );
  NOR2 U130 ( .A(n59), .B(n101), .Y(n98) );
  MX2 U131 ( .A(n102), .B(n103), .S0(sec_digit[2]), .Y(n43) );
  NOR2B U132 ( .AN(n52), .B(n101), .Y(n102) );
  NOR2B U133 ( .AN(sec_digit[1]), .B(n59), .Y(n52) );
  OAI2BB2 U134 ( .B0(n104), .B1(n101), .A0N(sec_digit[3]), .A1N(n103), .Y(n42)
         );
  OAI21 U135 ( .A0(sec_digit[1]), .A1(n101), .B0(n100), .Y(n103) );
  AOI2BB1 U136 ( .A0N(sec_digit[0]), .A1N(n101), .B0(n48), .Y(n100) );
  NOR2B U137 ( .AN(rst_n), .B(n96), .Y(n64) );
  OAI211 U138 ( .A0(n59), .A1(n105), .B0(n96), .C0(rst_n), .Y(n101) );
  NOR2B U139 ( .AN(n106), .B(n85), .Y(n96) );
  NAND2 U140 ( .A(n88), .B(\u_counter/clk_div[3] ), .Y(n85) );
  NOR3B U141 ( .AN(\u_counter/clk_div[2] ), .B(n94), .C(n107), .Y(n88) );
  INV U142 ( .A(\u_counter/clk_div[1] ), .Y(n107) );
  INV U143 ( .A(\u_counter/clk_div[0] ), .Y(n94) );
  NOR4BB U144 ( .AN(\u_counter/clk_div[13] ), .BN(n108), .C(n72), .D(n109), 
        .Y(n106) );
  NAND2 U145 ( .A(\u_counter/clk_div[9] ), .B(\u_counter/clk_div[8] ), .Y(n109) );
  INV U146 ( .A(\u_counter/clk_div[10] ), .Y(n72) );
  NOR4B U147 ( .AN(n110), .B(\u_counter/clk_div[4] ), .C(
        \u_counter/clk_div[11] ), .D(\u_counter/clk_div[12] ), .Y(n108) );
  NOR3 U148 ( .A(\u_counter/clk_div[5] ), .B(\u_counter/clk_div[6] ), .C(
        \u_counter/clk_div[7] ), .Y(n110) );
  INV U149 ( .A(n54), .Y(n105) );
  NOR2B U150 ( .AN(sec_digit[3]), .B(n60), .Y(n54) );
  INV U151 ( .A(n58), .Y(n60) );
  NOR2 U152 ( .A(sec_digit[2]), .B(sec_digit[1]), .Y(n58) );
  INV U153 ( .A(sec_digit[0]), .Y(n59) );
  AOI22 U154 ( .A0(n111), .A1(sec_digit[1]), .B0(sec_digit[3]), .B1(n112), .Y(
        n104) );
  INV U155 ( .A(sec_digit[2]), .Y(n112) );
  INV U156 ( .A(n55), .Y(n111) );
  NAND2 U157 ( .A(sec_digit[0]), .B(n61), .Y(n55) );
  NOR2B U158 ( .AN(sec_digit[2]), .B(sec_digit[3]), .Y(n61) );
endmodule

