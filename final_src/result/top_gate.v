
module top ( clk, rstn, start_btn, mole1_btn, mole2_btn, mole3_btn, mole4_btn, 
        mole5_btn, mole6_btn, mole7_btn, mole8_btn, mole1_led, mole2_led, 
        mole3_led, mole4_led, mole5_led, mole6_led, mole7_led, mole8_led, 
        score_sel0, score_sel1, score_sel2, score_sel3, score_A, score_B, 
        score_C, score_D, score_E, score_F, score_G, timer_A, timer_B, timer_C, 
        timer_D, timer_E, timer_F, timer_G, lvl_A, lvl_B, lvl_C, lvl_D, lvl_E, 
        lvl_F, lvl_G, mul_A, mul_B, mul_C, mul_D, mul_E, mul_F, mul_G, 
        game_over_led, hit_led );
  input clk, rstn, start_btn, mole1_btn, mole2_btn, mole3_btn, mole4_btn,
         mole5_btn, mole6_btn, mole7_btn, mole8_btn;
  output mole1_led, mole2_led, mole3_led, mole4_led, mole5_led, mole6_led,
         mole7_led, mole8_led, score_sel0, score_sel1, score_sel2, score_sel3,
         score_A, score_B, score_C, score_D, score_E, score_F, score_G,
         timer_A, timer_B, timer_C, timer_D, timer_E, timer_F, timer_G, lvl_A,
         lvl_B, lvl_C, lvl_D, lvl_E, lvl_F, lvl_G, mul_A, mul_B, mul_C, mul_D,
         mul_E, mul_F, mul_G, game_over_led, hit_led;
  wire   start_btn_db, start_btn_db_d, us_done, ic_timeout, N112, N113, N114,
         N115, N116, N117, N118, N119, N120, N121, N122, N123, N124, N125,
         N126, N127, \db_start/shift_reg[0] , \db_start/shift_reg[1] ,
         \db_start/shift_reg[2] , \db_start/shift_reg[3] ,
         \db_start/shift_reg[4] , \db_start/shift_reg[5] ,
         \db_start/shift_reg[6] , \db_start/shift_reg[7] ,
         \db_start/shift_reg[8] , \db_start/shift_reg[9] ,
         \db_start/shift_reg[10] , \db_start/shift_reg[11] ,
         \db_start/shift_reg[12] , \db_start/shift_reg[13] ,
         \db_start/shift_reg[14] , \db_start/shift_reg[15] ,
         \db_start/sync_ff1 , \db_start/sync_ff2 , \db_mole1/shift_reg[0] ,
         \db_mole1/shift_reg[1] , \db_mole1/shift_reg[2] ,
         \db_mole1/shift_reg[3] , \db_mole1/shift_reg[4] ,
         \db_mole1/shift_reg[5] , \db_mole1/shift_reg[6] ,
         \db_mole1/shift_reg[7] , \db_mole1/shift_reg[8] ,
         \db_mole1/shift_reg[9] , \db_mole1/shift_reg[10] ,
         \db_mole1/shift_reg[11] , \db_mole1/shift_reg[12] ,
         \db_mole1/shift_reg[13] , \db_mole1/shift_reg[14] ,
         \db_mole1/shift_reg[15] , \db_mole1/sync_ff1 , \db_mole1/sync_ff2 ,
         \db_mole2/shift_reg[0] , \db_mole2/shift_reg[1] ,
         \db_mole2/shift_reg[2] , \db_mole2/shift_reg[3] ,
         \db_mole2/shift_reg[4] , \db_mole2/shift_reg[5] ,
         \db_mole2/shift_reg[6] , \db_mole2/shift_reg[7] ,
         \db_mole2/shift_reg[8] , \db_mole2/shift_reg[9] ,
         \db_mole2/shift_reg[10] , \db_mole2/shift_reg[11] ,
         \db_mole2/shift_reg[12] , \db_mole2/shift_reg[13] ,
         \db_mole2/shift_reg[14] , \db_mole2/shift_reg[15] ,
         \db_mole2/sync_ff1 , \db_mole2/sync_ff2 , \db_mole3/shift_reg[0] ,
         \db_mole3/shift_reg[1] , \db_mole3/shift_reg[2] ,
         \db_mole3/shift_reg[3] , \db_mole3/shift_reg[4] ,
         \db_mole3/shift_reg[5] , \db_mole3/shift_reg[6] ,
         \db_mole3/shift_reg[7] , \db_mole3/shift_reg[8] ,
         \db_mole3/shift_reg[9] , \db_mole3/shift_reg[10] ,
         \db_mole3/shift_reg[11] , \db_mole3/shift_reg[12] ,
         \db_mole3/shift_reg[13] , \db_mole3/shift_reg[14] ,
         \db_mole3/shift_reg[15] , \db_mole3/sync_ff1 , \db_mole3/sync_ff2 ,
         \db_mole4/shift_reg[0] , \db_mole4/shift_reg[1] ,
         \db_mole4/shift_reg[2] , \db_mole4/shift_reg[3] ,
         \db_mole4/shift_reg[4] , \db_mole4/shift_reg[5] ,
         \db_mole4/shift_reg[6] , \db_mole4/shift_reg[7] ,
         \db_mole4/shift_reg[8] , \db_mole4/shift_reg[9] ,
         \db_mole4/shift_reg[10] , \db_mole4/shift_reg[11] ,
         \db_mole4/shift_reg[12] , \db_mole4/shift_reg[13] ,
         \db_mole4/shift_reg[14] , \db_mole4/shift_reg[15] ,
         \db_mole4/sync_ff1 , \db_mole4/sync_ff2 , \db_mole5/shift_reg[0] ,
         \db_mole5/shift_reg[1] , \db_mole5/shift_reg[2] ,
         \db_mole5/shift_reg[3] , \db_mole5/shift_reg[4] ,
         \db_mole5/shift_reg[5] , \db_mole5/shift_reg[6] ,
         \db_mole5/shift_reg[7] , \db_mole5/shift_reg[8] ,
         \db_mole5/shift_reg[9] , \db_mole5/shift_reg[10] ,
         \db_mole5/shift_reg[11] , \db_mole5/shift_reg[12] ,
         \db_mole5/shift_reg[13] , \db_mole5/shift_reg[14] ,
         \db_mole5/shift_reg[15] , \db_mole5/sync_ff1 , \db_mole5/sync_ff2 ,
         \db_mole6/shift_reg[0] , \db_mole6/shift_reg[1] ,
         \db_mole6/shift_reg[2] , \db_mole6/shift_reg[3] ,
         \db_mole6/shift_reg[4] , \db_mole6/shift_reg[5] ,
         \db_mole6/shift_reg[6] , \db_mole6/shift_reg[7] ,
         \db_mole6/shift_reg[8] , \db_mole6/shift_reg[9] ,
         \db_mole6/shift_reg[10] , \db_mole6/shift_reg[11] ,
         \db_mole6/shift_reg[12] , \db_mole6/shift_reg[13] ,
         \db_mole6/shift_reg[14] , \db_mole6/shift_reg[15] ,
         \db_mole6/sync_ff1 , \db_mole6/sync_ff2 , \db_mole7/shift_reg[0] ,
         \db_mole7/shift_reg[1] , \db_mole7/shift_reg[2] ,
         \db_mole7/shift_reg[3] , \db_mole7/shift_reg[4] ,
         \db_mole7/shift_reg[5] , \db_mole7/shift_reg[6] ,
         \db_mole7/shift_reg[7] , \db_mole7/shift_reg[8] ,
         \db_mole7/shift_reg[9] , \db_mole7/shift_reg[10] ,
         \db_mole7/shift_reg[11] , \db_mole7/shift_reg[12] ,
         \db_mole7/shift_reg[13] , \db_mole7/shift_reg[14] ,
         \db_mole7/shift_reg[15] , \db_mole7/sync_ff1 , \db_mole7/sync_ff2 ,
         \db_mole8/shift_reg[0] , \db_mole8/shift_reg[1] ,
         \db_mole8/shift_reg[2] , \db_mole8/shift_reg[3] ,
         \db_mole8/shift_reg[4] , \db_mole8/shift_reg[5] ,
         \db_mole8/shift_reg[6] , \db_mole8/shift_reg[7] ,
         \db_mole8/shift_reg[8] , \db_mole8/shift_reg[9] ,
         \db_mole8/shift_reg[10] , \db_mole8/shift_reg[11] ,
         \db_mole8/shift_reg[12] , \db_mole8/shift_reg[13] ,
         \db_mole8/shift_reg[14] , \db_mole8/shift_reg[15] ,
         \db_mole8/sync_ff1 , \db_mole8/sync_ff2 , \u_prng/feedback ,
         \u_us/N40 , \u_us/searching , \u_us/selected_mask[0] ,
         \u_us/selected_mask[1] , \u_us/selected_mask[2] ,
         \u_us/selected_mask[3] , \u_us/selected_mask[4] ,
         \u_us/selected_mask[5] , \u_us/selected_mask[6] ,
         \u_us/selected_mask[7] , \u_us/N18 , \u_us/N17 , \u_us/N16 ,
         \u_interval_cnt/N85 , \u_interval_cnt/N79 , \u_interval_cnt/N78 ,
         \u_interval_cnt/N77 , \u_interval_cnt/N76 , \u_interval_cnt/N75 ,
         \u_interval_cnt/N74 , \u_interval_cnt/N73 , \u_interval_cnt/N72 ,
         \u_interval_cnt/N71 , \u_interval_cnt/N70 , \u_interval_cnt/N69 ,
         \u_interval_cnt/N68 , \u_interval_cnt/N67 , \u_interval_cnt/N66 ,
         \u_interval_cnt/N65 , \u_interval_cnt/N27 , \u_interval_cnt/N26 ,
         \u_interval_cnt/N25 , \u_interval_cnt/N24 , \u_interval_cnt/N23 ,
         \u_interval_cnt/N22 , \u_interval_cnt/N21 , \u_interval_cnt/N20 ,
         \u_interval_cnt/N19 , \u_interval_cnt/N18 , \u_interval_cnt/N17 ,
         \u_interval_cnt/N16 , \u_interval_cnt/N15 , \u_interval_cnt/N14 ,
         \u_interval_cnt/done , \u_interval_cnt/div_cnt[0] ,
         \u_interval_cnt/div_cnt[1] , \u_interval_cnt/div_cnt[2] ,
         \u_interval_cnt/div_cnt[3] , \u_interval_cnt/div_cnt[4] ,
         \u_interval_cnt/div_cnt[5] , \u_interval_cnt/div_cnt[6] ,
         \u_interval_cnt/div_cnt[7] , \u_interval_cnt/div_cnt[8] ,
         \u_interval_cnt/div_cnt[9] , \u_interval_cnt/div_cnt[10] ,
         \u_interval_cnt/div_cnt[11] , \u_interval_cnt/div_cnt[12] ,
         \u_interval_cnt/div_cnt[13] , \u_interval_cnt/div_cnt[14] ,
         \u_timer_disp/N68 , \u_timer_disp/N39 , \u_timer_disp/N36 ,
         \u_timer_disp/N24 , \u_timer_disp/N14 , \u_level_disp/N43 ,
         \u_level_disp/N39 , \u_level_disp/N36 , \u_level_disp/N33 ,
         \u_level_disp/N24 , \u_level_disp/N21 , \u_level_disp/N14 ,
         \u_mult_disp/N43 , \u_mult_disp/N39 , \u_mult_disp/N36 ,
         \u_mult_disp/N33 , \u_mult_disp/N24 , \u_mult_disp/N21 ,
         \u_mult_disp/N14 , \u_score_disp/N635 , \u_score_disp/N630 ,
         \u_score_disp/N629 , \u_score_disp/N628 , \u_score_disp/N627 ,
         \u_score_disp/N626 , \u_score_disp/N625 , \u_score_disp/N624 ,
         \u_score_disp/N623 , \u_score_disp/N622 , \u_score_disp/N621 ,
         \u_score_disp/N620 , \u_score_disp/N619 , \u_score_disp/N618 ,
         \u_score_disp/N617 , \u_score_disp/N616 , \u_score_disp/N615 ,
         \u_score_disp/N614 , \u_score_disp/N613 , \u_score_disp/N612 ,
         \u_score_disp/N611 , \u_score_disp/N610 , \u_score_disp/N609 ,
         \u_score_disp/N608 , \u_score_disp/N607 , \u_score_disp/N606 ,
         \u_score_disp/N605 , \u_score_disp/N604 , \u_score_disp/N603 ,
         \u_score_disp/N602 , \u_score_disp/N601 , \u_score_disp/N600 ,
         \u_score_disp/N599 , \u_score_disp/scan_cnt[0] ,
         \u_score_disp/scan_cnt[1] , \u_score_disp/scan_cnt[2] ,
         \u_score_disp/scan_cnt[3] , \u_score_disp/scan_cnt[4] ,
         \u_score_disp/scan_cnt[5] , \u_score_disp/scan_cnt[6] ,
         \u_score_disp/scan_cnt[7] , \u_score_disp/scan_cnt[8] ,
         \u_score_disp/scan_cnt[9] , \u_score_disp/scan_cnt[10] ,
         \u_score_disp/scan_cnt[11] , \u_score_disp/scan_cnt[12] ,
         \u_score_disp/scan_cnt[13] , \u_score_disp/scan_cnt[14] ,
         \u_score_disp/scan_cnt[15] , \u_score_disp/digit_idx[0] ,
         \u_score_disp/digit_idx[1] , \u_score_disp/N384 , \u_score_disp/N383 ,
         \u_score_disp/N382 , \u_score_disp/N381 , \u_score_disp/N380 ,
         \u_score_disp/N379 , \u_score_disp/N378 , \u_score_disp/N377 ,
         \u_score_disp/N376 , \u_score_disp/N375 , \u_score_disp/N374 ,
         \u_score_disp/N373 , \u_score_disp/N372 , \u_score_disp/N371 ,
         \u_score_disp/rem2[1] , \u_score_disp/rem2[2] ,
         \u_score_disp/rem2[3] , \u_score_disp/N121 , \u_score_disp/N120 ,
         \u_score_disp/N119 , \u_score_disp/N118 , \u_score_disp/N117 ,
         \u_score_disp/N116 , \u_score_disp/N115 , \u_score_disp/N114 ,
         \u_score_disp/N113 , \u_score_disp/N112 , \u_score_disp/N111 ,
         \u_score_disp/N110 , \u_score_disp/N109 , \u_score_disp/N106 ,
         \u_score_disp/u_seg/N43 , \u_score_disp/u_seg/N39 ,
         \u_score_disp/u_seg/N36 , \u_score_disp/u_seg/N33 ,
         \u_score_disp/u_seg/N24 , \u_score_disp/u_seg/N21 ,
         \u_score_disp/u_seg/N14 , n272, n415, n418, n423, n424, n434, n438,
         n440, n613, n616, n618, n642, n654, n655, n656, n657, n658, n659,
         n660, n661, n662, n663, n665, n666, n667, n695, n697, n698, n715,
         n716, n717, n718, n719, n720, n721, n722, n723, n724, n725, n726,
         n727, n728, n729, n730, n731, n732, n733, n734, n736, n737, n738,
         n739, n740, n741, n742, n743, n744, n745, n1379, n749, n750, n751,
         n752, n753, n754, \r817/carry[3] , \r817/carry[2] , \r817/DIFF[1] ,
         \r817/DIFF[2] , \r817/DIFF[3] , \add_430/carry[4] ,
         \add_430/carry[3] , \add_430/carry[2] , \r812/carry[15] ,
         \r812/carry[14] , \r812/carry[13] , \r812/carry[12] ,
         \r812/carry[11] , \r812/carry[10] , \r812/carry[9] , \r812/carry[8] ,
         \r812/carry[7] , \r812/carry[6] , \r812/carry[5] , \r812/carry[4] ,
         \r812/carry[3] , \r811/carry[15] , \r811/carry[14] , \r811/carry[13] ,
         \r811/carry[12] , \r811/carry[11] , \r811/carry[8] , \r811/carry[7] ,
         \r811/carry[6] , \r811/carry[5] , \r811/carry[4] ,
         \sll_307/ML_int[2][0] , \sll_307/ML_int[2][1] , n755, n756, n757,
         n758, n759, n760, n761, n762, n763, n764, n765, n766, n767, n768,
         n769, n770, n771, n772, n773, n774, n775, n776, n777, n778, n779,
         n780, n781, n782, n783, n784, n785, n786, n787, n788, n789, n790,
         n791, n792, n793, n794, n795, n796, n797, n798, n799, n800, n801,
         n802, n803, n804, n805, n806, n807, n808, n809, n810, n811, n812,
         n814, n815, n816, n817, n818, n819, n820, n821, n822, n823, n824,
         n825, n826, n827, n828, n829, n830, n831, n832, n833, n834, n835,
         n836, n837, n838, n839, n840, n841, n842, n843, n844, n845, n846,
         n847, n848, n849, n850, n851, n852, n853, n854, n855, n856, n857,
         n858, n859, n860, n861, n862, n863, n864, n865, n866, n867, n868,
         n869, n870, n871, n872, n873, n874, n875, n876, n877, n878, n879,
         n880, n881, n882, n883, n884, n885, n886, n887, n888, n889, n890,
         n891, n892, n893, n894, n895, n896, n897, n898, n899, n900, n901,
         n902, n903, n904, n905, n906, n907, n908, n909, n910, n911, n912,
         n913, n914, n915, n916, n917, n918, n919, n920, n921, n922, n923,
         n924, n925, n926, n927, n928, n929, n930, n931, n932, n933, n934,
         n935, n936, n937, n938, n939, n940, n941, n942, n943, n944, n945,
         n946, n947, n948, n949, n950, n951, n952, n953, n954, n955, n956,
         n957, n958, n959, n960, n961, n962, n963, n964, n965, n966, n967,
         n968, n969, n970, n971, n972, n973, n974, n975, n976, n977, n978,
         n979, n980, n981, n982, n983, n984, n985, n986, n987, n988, n989,
         n990, n991, n992, n993, n994, n995, n996, n997, n998, n999, n1000,
         n1001, n1002, n1003, n1004, n1005, n1006, n1007, n1008, n1009, n1010,
         n1011, n1012, n1013, n1014, n1015, n1016, n1017, n1018, n1019, n1020,
         n1021, n1022, n1023, n1024, n1025, n1026, n1027, n1028, n1029, n1030,
         n1031, n1032, n1033, n1034, n1035, n1036, n1037, n1038, n1039, n1040,
         n1041, n1042, n1043, n1044, n1045, n1046, n1047, n1048, n1049, n1050,
         n1051, n1052, n1053, n1054, n1055, n1056, n1057, n1058, n1059, n1060,
         n1061, n1062, n1063, n1064, n1065, n1066, n1067, n1068, n1069, n1070,
         n1071, n1072, n1073, n1074, n1075, n1076, n1077, n1078, n1079, n1080,
         n1081, n1082, n1083, n1084, n1085, n1086, n1087, n1088, n1089, n1090,
         n1091, n1092, n1093, n1094, n1095, n1096, n1097, n1098, n1099, n1100,
         n1101, n1102, n1103, n1104, n1105, n1106, n1107, n1108, n1109, n1110,
         n1111, n1112, n1113, n1114, n1115, n1116, n1117, n1118, n1119, n1120,
         n1121, n1122, n1123, n1124, n1125, n1126, n1127, n1128, n1129, n1130,
         n1131, n1132, n1133, n1134, n1135, n1136, n1137, n1138, n1139, n1140,
         n1141, n1142, n1143, n1144, n1145, n1146, n1147, n1148, n1149, n1150,
         n1151, n1152, n1153, n1154, n1155, n1156, n1157, n1158, n1159, n1160,
         n1161, n1162, n1163, n1164, n1165, n1166, n1167, n1168, n1169, n1170,
         n1171, n1172, n1173, n1174, n1175, n1176, n1177, n1178, n1179, n1180,
         n1181, n1182, n1183, n1184, n1185, n1186, n1187, n1188, n1189, n1190,
         n1191, n1192, n1193, n1194, n1195, n1196, n1197, n1198, n1199, n1200,
         n1201, n1202, n1203, n1204, n1205, n1206, n1207, n1208, n1209, n1210,
         n1211, n1212, n1213, n1214, n1215, n1216, n1217, n1218, n1219, n1220,
         n1221, n1222, n1223, n1224, n1225, n1226, n1227, n1228, n1229, n1230,
         n1231, n1232, n1233, n1234, n1235, n1236, n1237, n1238, n1239, n1240,
         n1241, n1242, n1243, n1244, n1245, n1246, n1247, n1248, n1249, n1250,
         n1251, n1252, n1253, n1254, n1255, n1256, n1257, n1258, n1259, n1260,
         n1261, n1262, n1263, n1264, n1265, n1266, n1267, n1268, n1269, n1270,
         n1271, n1272, n1273, n1274, n1275, n1276, n1277, n1278, n1279, n1280,
         n1281, n1282, n1283, n1284, n1285, n1286, n1287, n1288, n1289, n1290,
         n1291, n1292, n1293, n1294, n1295, n1296, n1297, n1298, n1299, n1300,
         n1301, n1302, n1303, n1304, n1305, n1306, n1307, n1308, n1309, n1310,
         n1311, n1312, n1313, n1314, n1315, n1316, n1317, n1318, n1319, n1320,
         n1321, n1322, n1323, n1324, n1325, n1326, n1327, n1328, n1329, n1330,
         n1331, n1332, n1333, n1334, n1335, n1336, n1337, n1338, n1339, n1340,
         n1341, n1342, n1343, n1344, n1345, n1346, n1347, n1348, n1349, n1350,
         n1351, n1352, n1353, n1354, n1357, n1358, n1359, n1360, n1361, n1362,
         n1363, n1364, n1365, n1366, n1367, n1368, n1369, n1370, n1371, n1372,
         n1373, n1374, n1375, n1376, n1377, n1378;
  wire   [7:0] mole_btns_db;
  wire   [7:0] mole_btns_db_d;
  wire   [7:0] rnd_out;
  wire   [2:0] state;
  wire   [2:0] us_selected_number;
  wire   [3:0] time_interval;
  wire   [2:0] ic_count;
  wire   [3:0] level;
  wire   [3:0] multiplier;
  wire   [15:0] score_reg;
  wire   [2:0] next_state;
  assign timer_G = \u_timer_disp/N68 ;
  assign timer_F = \u_timer_disp/N39 ;
  assign timer_E = \u_timer_disp/N36 ;
  assign timer_C = \u_timer_disp/N24 ;
  assign timer_A = \u_timer_disp/N14 ;
  assign lvl_G = \u_level_disp/N43 ;
  assign lvl_F = \u_level_disp/N39 ;
  assign lvl_E = \u_level_disp/N36 ;
  assign lvl_D = \u_level_disp/N33 ;
  assign lvl_C = \u_level_disp/N24 ;
  assign lvl_B = \u_level_disp/N21 ;
  assign lvl_A = \u_level_disp/N14 ;
  assign mul_G = \u_mult_disp/N43 ;
  assign mul_F = \u_mult_disp/N39 ;
  assign mul_E = \u_mult_disp/N36 ;
  assign mul_D = \u_mult_disp/N33 ;
  assign mul_C = \u_mult_disp/N24 ;
  assign mul_B = \u_mult_disp/N21 ;
  assign mul_A = \u_mult_disp/N14 ;
  assign score_sel3 = \u_score_disp/N635 ;
  assign score_sel0 = \u_score_disp/N630 ;
  assign score_G = \u_score_disp/u_seg/N43 ;
  assign score_F = \u_score_disp/u_seg/N39 ;
  assign score_E = \u_score_disp/u_seg/N36 ;
  assign score_D = \u_score_disp/u_seg/N33 ;
  assign score_C = \u_score_disp/u_seg/N24 ;
  assign score_B = \u_score_disp/u_seg/N21 ;
  assign score_A = \u_score_disp/u_seg/N14 ;

  DFFRHQ \db_start/sync_ff1_reg  ( .D(start_btn), .CK(clk), .RN(rstn), .Q(
        \db_start/sync_ff1 ) );
  DFFRHQ \db_start/sync_ff2_reg  ( .D(\db_start/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_start/sync_ff2 ) );
  DFFRHQ \db_start/shift_reg_reg[0]  ( .D(\db_start/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_start/shift_reg[0] ) );
  DFFRHQ \db_start/shift_reg_reg[1]  ( .D(\db_start/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[1] ) );
  DFFRHQ \db_start/shift_reg_reg[2]  ( .D(\db_start/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[2] ) );
  DFFRHQ \db_start/shift_reg_reg[3]  ( .D(\db_start/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[3] ) );
  DFFRHQ \db_start/shift_reg_reg[4]  ( .D(\db_start/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[4] ) );
  DFFRHQ \db_start/shift_reg_reg[5]  ( .D(\db_start/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[5] ) );
  DFFRHQ \db_start/shift_reg_reg[6]  ( .D(\db_start/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[6] ) );
  DFFRHQ \db_start/shift_reg_reg[7]  ( .D(\db_start/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[7] ) );
  DFFRHQ \db_start/shift_reg_reg[8]  ( .D(\db_start/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[8] ) );
  DFFRHQ \db_start/shift_reg_reg[9]  ( .D(\db_start/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[9] ) );
  DFFRHQ \db_start/shift_reg_reg[10]  ( .D(\db_start/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[10] ) );
  DFFRHQ \db_start/shift_reg_reg[11]  ( .D(\db_start/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[11] ) );
  DFFRHQ \db_start/shift_reg_reg[12]  ( .D(\db_start/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[12] ) );
  DFFRHQ \db_start/shift_reg_reg[13]  ( .D(\db_start/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[13] ) );
  DFFRHQ \db_start/shift_reg_reg[14]  ( .D(\db_start/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[14] ) );
  DFFRHQ \db_start/shift_reg_reg[15]  ( .D(\db_start/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_start/shift_reg[15] ) );
  DFFRHQ \db_start/button_out_reg  ( .D(n745), .CK(clk), .RN(rstn), .Q(
        start_btn_db) );
  DFFRHQ start_btn_db_d_reg ( .D(start_btn_db), .CK(clk), .RN(rstn), .Q(
        start_btn_db_d) );
  DFFRHQ \db_mole1/sync_ff1_reg  ( .D(mole1_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole1/sync_ff1 ) );
  DFFRHQ \db_mole1/sync_ff2_reg  ( .D(\db_mole1/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole1/sync_ff2 ) );
  DFFRHQ \db_mole1/shift_reg_reg[0]  ( .D(\db_mole1/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole1/shift_reg[0] ) );
  DFFRHQ \db_mole1/shift_reg_reg[1]  ( .D(\db_mole1/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[1] ) );
  DFFRHQ \db_mole1/shift_reg_reg[2]  ( .D(\db_mole1/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[2] ) );
  DFFRHQ \db_mole1/shift_reg_reg[3]  ( .D(\db_mole1/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[3] ) );
  DFFRHQ \db_mole1/shift_reg_reg[4]  ( .D(\db_mole1/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[4] ) );
  DFFRHQ \db_mole1/shift_reg_reg[5]  ( .D(\db_mole1/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[5] ) );
  DFFRHQ \db_mole1/shift_reg_reg[6]  ( .D(\db_mole1/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[6] ) );
  DFFRHQ \db_mole1/shift_reg_reg[7]  ( .D(\db_mole1/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[7] ) );
  DFFRHQ \db_mole1/shift_reg_reg[8]  ( .D(\db_mole1/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[8] ) );
  DFFRHQ \db_mole1/shift_reg_reg[9]  ( .D(\db_mole1/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[9] ) );
  DFFRHQ \db_mole1/shift_reg_reg[10]  ( .D(\db_mole1/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[10] ) );
  DFFRHQ \db_mole1/shift_reg_reg[11]  ( .D(\db_mole1/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[11] ) );
  DFFRHQ \db_mole1/shift_reg_reg[12]  ( .D(\db_mole1/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[12] ) );
  DFFRHQ \db_mole1/shift_reg_reg[13]  ( .D(\db_mole1/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[13] ) );
  DFFRHQ \db_mole1/shift_reg_reg[14]  ( .D(\db_mole1/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[14] ) );
  DFFRHQ \db_mole1/shift_reg_reg[15]  ( .D(\db_mole1/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole1/shift_reg[15] ) );
  DFFRHQ \db_mole1/button_out_reg  ( .D(n744), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[0]) );
  DFFRHQ \mole_btns_db_d_reg[0]  ( .D(mole_btns_db[0]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[0]) );
  DFFRHQ \db_mole2/sync_ff1_reg  ( .D(mole2_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole2/sync_ff1 ) );
  DFFRHQ \db_mole2/sync_ff2_reg  ( .D(\db_mole2/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole2/sync_ff2 ) );
  DFFRHQ \db_mole2/shift_reg_reg[0]  ( .D(\db_mole2/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole2/shift_reg[0] ) );
  DFFRHQ \db_mole2/shift_reg_reg[1]  ( .D(\db_mole2/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[1] ) );
  DFFRHQ \db_mole2/shift_reg_reg[2]  ( .D(\db_mole2/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[2] ) );
  DFFRHQ \db_mole2/shift_reg_reg[3]  ( .D(\db_mole2/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[3] ) );
  DFFRHQ \db_mole2/shift_reg_reg[4]  ( .D(\db_mole2/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[4] ) );
  DFFRHQ \db_mole2/shift_reg_reg[5]  ( .D(\db_mole2/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[5] ) );
  DFFRHQ \db_mole2/shift_reg_reg[6]  ( .D(\db_mole2/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[6] ) );
  DFFRHQ \db_mole2/shift_reg_reg[7]  ( .D(\db_mole2/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[7] ) );
  DFFRHQ \db_mole2/shift_reg_reg[8]  ( .D(\db_mole2/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[8] ) );
  DFFRHQ \db_mole2/shift_reg_reg[9]  ( .D(\db_mole2/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[9] ) );
  DFFRHQ \db_mole2/shift_reg_reg[10]  ( .D(\db_mole2/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[10] ) );
  DFFRHQ \db_mole2/shift_reg_reg[11]  ( .D(\db_mole2/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[11] ) );
  DFFRHQ \db_mole2/shift_reg_reg[12]  ( .D(\db_mole2/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[12] ) );
  DFFRHQ \db_mole2/shift_reg_reg[13]  ( .D(\db_mole2/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[13] ) );
  DFFRHQ \db_mole2/shift_reg_reg[14]  ( .D(\db_mole2/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[14] ) );
  DFFRHQ \db_mole2/shift_reg_reg[15]  ( .D(\db_mole2/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole2/shift_reg[15] ) );
  DFFRHQ \db_mole2/button_out_reg  ( .D(n743), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[1]) );
  DFFRHQ \mole_btns_db_d_reg[1]  ( .D(mole_btns_db[1]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[1]) );
  DFFRHQ \db_mole3/sync_ff1_reg  ( .D(mole3_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole3/sync_ff1 ) );
  DFFRHQ \db_mole3/sync_ff2_reg  ( .D(\db_mole3/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole3/sync_ff2 ) );
  DFFRHQ \db_mole3/shift_reg_reg[0]  ( .D(\db_mole3/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole3/shift_reg[0] ) );
  DFFRHQ \db_mole3/shift_reg_reg[1]  ( .D(\db_mole3/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[1] ) );
  DFFRHQ \db_mole3/shift_reg_reg[2]  ( .D(\db_mole3/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[2] ) );
  DFFRHQ \db_mole3/shift_reg_reg[3]  ( .D(\db_mole3/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[3] ) );
  DFFRHQ \db_mole3/shift_reg_reg[4]  ( .D(\db_mole3/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[4] ) );
  DFFRHQ \db_mole3/shift_reg_reg[5]  ( .D(\db_mole3/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[5] ) );
  DFFRHQ \db_mole3/shift_reg_reg[6]  ( .D(\db_mole3/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[6] ) );
  DFFRHQ \db_mole3/shift_reg_reg[7]  ( .D(\db_mole3/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[7] ) );
  DFFRHQ \db_mole3/shift_reg_reg[8]  ( .D(\db_mole3/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[8] ) );
  DFFRHQ \db_mole3/shift_reg_reg[9]  ( .D(\db_mole3/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[9] ) );
  DFFRHQ \db_mole3/shift_reg_reg[10]  ( .D(\db_mole3/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[10] ) );
  DFFRHQ \db_mole3/shift_reg_reg[11]  ( .D(\db_mole3/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[11] ) );
  DFFRHQ \db_mole3/shift_reg_reg[12]  ( .D(\db_mole3/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[12] ) );
  DFFRHQ \db_mole3/shift_reg_reg[13]  ( .D(\db_mole3/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[13] ) );
  DFFRHQ \db_mole3/shift_reg_reg[14]  ( .D(\db_mole3/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[14] ) );
  DFFRHQ \db_mole3/shift_reg_reg[15]  ( .D(\db_mole3/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole3/shift_reg[15] ) );
  DFFRHQ \db_mole3/button_out_reg  ( .D(n742), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[2]) );
  DFFRHQ \mole_btns_db_d_reg[2]  ( .D(mole_btns_db[2]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[2]) );
  DFFRHQ \db_mole4/sync_ff1_reg  ( .D(mole4_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole4/sync_ff1 ) );
  DFFRHQ \db_mole4/sync_ff2_reg  ( .D(\db_mole4/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole4/sync_ff2 ) );
  DFFRHQ \db_mole4/shift_reg_reg[0]  ( .D(\db_mole4/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole4/shift_reg[0] ) );
  DFFRHQ \db_mole4/shift_reg_reg[1]  ( .D(\db_mole4/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[1] ) );
  DFFRHQ \db_mole4/shift_reg_reg[2]  ( .D(\db_mole4/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[2] ) );
  DFFRHQ \db_mole4/shift_reg_reg[3]  ( .D(\db_mole4/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[3] ) );
  DFFRHQ \db_mole4/shift_reg_reg[4]  ( .D(\db_mole4/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[4] ) );
  DFFRHQ \db_mole4/shift_reg_reg[5]  ( .D(\db_mole4/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[5] ) );
  DFFRHQ \db_mole4/shift_reg_reg[6]  ( .D(\db_mole4/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[6] ) );
  DFFRHQ \db_mole4/shift_reg_reg[7]  ( .D(\db_mole4/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[7] ) );
  DFFRHQ \db_mole4/shift_reg_reg[8]  ( .D(\db_mole4/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[8] ) );
  DFFRHQ \db_mole4/shift_reg_reg[9]  ( .D(\db_mole4/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[9] ) );
  DFFRHQ \db_mole4/shift_reg_reg[10]  ( .D(\db_mole4/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[10] ) );
  DFFRHQ \db_mole4/shift_reg_reg[11]  ( .D(\db_mole4/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[11] ) );
  DFFRHQ \db_mole4/shift_reg_reg[12]  ( .D(\db_mole4/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[12] ) );
  DFFRHQ \db_mole4/shift_reg_reg[13]  ( .D(\db_mole4/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[13] ) );
  DFFRHQ \db_mole4/shift_reg_reg[14]  ( .D(\db_mole4/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[14] ) );
  DFFRHQ \db_mole4/shift_reg_reg[15]  ( .D(\db_mole4/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole4/shift_reg[15] ) );
  DFFRHQ \db_mole4/button_out_reg  ( .D(n741), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[3]) );
  DFFRHQ \mole_btns_db_d_reg[3]  ( .D(mole_btns_db[3]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[3]) );
  DFFRHQ \db_mole5/sync_ff1_reg  ( .D(mole5_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole5/sync_ff1 ) );
  DFFRHQ \db_mole5/sync_ff2_reg  ( .D(\db_mole5/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole5/sync_ff2 ) );
  DFFRHQ \db_mole5/shift_reg_reg[0]  ( .D(\db_mole5/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole5/shift_reg[0] ) );
  DFFRHQ \db_mole5/shift_reg_reg[1]  ( .D(\db_mole5/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[1] ) );
  DFFRHQ \db_mole5/shift_reg_reg[2]  ( .D(\db_mole5/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[2] ) );
  DFFRHQ \db_mole5/shift_reg_reg[3]  ( .D(\db_mole5/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[3] ) );
  DFFRHQ \db_mole5/shift_reg_reg[4]  ( .D(\db_mole5/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[4] ) );
  DFFRHQ \db_mole5/shift_reg_reg[5]  ( .D(\db_mole5/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[5] ) );
  DFFRHQ \db_mole5/shift_reg_reg[6]  ( .D(\db_mole5/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[6] ) );
  DFFRHQ \db_mole5/shift_reg_reg[7]  ( .D(\db_mole5/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[7] ) );
  DFFRHQ \db_mole5/shift_reg_reg[8]  ( .D(\db_mole5/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[8] ) );
  DFFRHQ \db_mole5/shift_reg_reg[9]  ( .D(\db_mole5/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[9] ) );
  DFFRHQ \db_mole5/shift_reg_reg[10]  ( .D(\db_mole5/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[10] ) );
  DFFRHQ \db_mole5/shift_reg_reg[11]  ( .D(\db_mole5/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[11] ) );
  DFFRHQ \db_mole5/shift_reg_reg[12]  ( .D(\db_mole5/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[12] ) );
  DFFRHQ \db_mole5/shift_reg_reg[13]  ( .D(\db_mole5/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[13] ) );
  DFFRHQ \db_mole5/shift_reg_reg[14]  ( .D(\db_mole5/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[14] ) );
  DFFRHQ \db_mole5/shift_reg_reg[15]  ( .D(\db_mole5/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole5/shift_reg[15] ) );
  DFFRHQ \db_mole5/button_out_reg  ( .D(n740), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[4]) );
  DFFRHQ \mole_btns_db_d_reg[4]  ( .D(mole_btns_db[4]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[4]) );
  DFFRHQ \db_mole6/sync_ff1_reg  ( .D(mole6_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole6/sync_ff1 ) );
  DFFRHQ \db_mole6/sync_ff2_reg  ( .D(\db_mole6/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole6/sync_ff2 ) );
  DFFRHQ \db_mole6/shift_reg_reg[0]  ( .D(\db_mole6/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole6/shift_reg[0] ) );
  DFFRHQ \db_mole6/shift_reg_reg[1]  ( .D(\db_mole6/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[1] ) );
  DFFRHQ \db_mole6/shift_reg_reg[2]  ( .D(\db_mole6/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[2] ) );
  DFFRHQ \db_mole6/shift_reg_reg[3]  ( .D(\db_mole6/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[3] ) );
  DFFRHQ \db_mole6/shift_reg_reg[4]  ( .D(\db_mole6/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[4] ) );
  DFFRHQ \db_mole6/shift_reg_reg[5]  ( .D(\db_mole6/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[5] ) );
  DFFRHQ \db_mole6/shift_reg_reg[6]  ( .D(\db_mole6/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[6] ) );
  DFFRHQ \db_mole6/shift_reg_reg[7]  ( .D(\db_mole6/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[7] ) );
  DFFRHQ \db_mole6/shift_reg_reg[8]  ( .D(\db_mole6/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[8] ) );
  DFFRHQ \db_mole6/shift_reg_reg[9]  ( .D(\db_mole6/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[9] ) );
  DFFRHQ \db_mole6/shift_reg_reg[10]  ( .D(\db_mole6/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[10] ) );
  DFFRHQ \db_mole6/shift_reg_reg[11]  ( .D(\db_mole6/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[11] ) );
  DFFRHQ \db_mole6/shift_reg_reg[12]  ( .D(\db_mole6/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[12] ) );
  DFFRHQ \db_mole6/shift_reg_reg[13]  ( .D(\db_mole6/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[13] ) );
  DFFRHQ \db_mole6/shift_reg_reg[14]  ( .D(\db_mole6/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[14] ) );
  DFFRHQ \db_mole6/shift_reg_reg[15]  ( .D(\db_mole6/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole6/shift_reg[15] ) );
  DFFRHQ \db_mole6/button_out_reg  ( .D(n739), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[5]) );
  DFFRHQ \mole_btns_db_d_reg[5]  ( .D(mole_btns_db[5]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[5]) );
  DFFRHQ \db_mole7/sync_ff1_reg  ( .D(mole7_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole7/sync_ff1 ) );
  DFFRHQ \db_mole7/sync_ff2_reg  ( .D(\db_mole7/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole7/sync_ff2 ) );
  DFFRHQ \db_mole7/shift_reg_reg[0]  ( .D(\db_mole7/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole7/shift_reg[0] ) );
  DFFRHQ \db_mole7/shift_reg_reg[1]  ( .D(\db_mole7/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[1] ) );
  DFFRHQ \db_mole7/shift_reg_reg[2]  ( .D(\db_mole7/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[2] ) );
  DFFRHQ \db_mole7/shift_reg_reg[3]  ( .D(\db_mole7/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[3] ) );
  DFFRHQ \db_mole7/shift_reg_reg[4]  ( .D(\db_mole7/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[4] ) );
  DFFRHQ \db_mole7/shift_reg_reg[5]  ( .D(\db_mole7/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[5] ) );
  DFFRHQ \db_mole7/shift_reg_reg[6]  ( .D(\db_mole7/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[6] ) );
  DFFRHQ \db_mole7/shift_reg_reg[7]  ( .D(\db_mole7/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[7] ) );
  DFFRHQ \db_mole7/shift_reg_reg[8]  ( .D(\db_mole7/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[8] ) );
  DFFRHQ \db_mole7/shift_reg_reg[9]  ( .D(\db_mole7/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[9] ) );
  DFFRHQ \db_mole7/shift_reg_reg[10]  ( .D(\db_mole7/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[10] ) );
  DFFRHQ \db_mole7/shift_reg_reg[11]  ( .D(\db_mole7/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[11] ) );
  DFFRHQ \db_mole7/shift_reg_reg[12]  ( .D(\db_mole7/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[12] ) );
  DFFRHQ \db_mole7/shift_reg_reg[13]  ( .D(\db_mole7/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[13] ) );
  DFFRHQ \db_mole7/shift_reg_reg[14]  ( .D(\db_mole7/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[14] ) );
  DFFRHQ \db_mole7/shift_reg_reg[15]  ( .D(\db_mole7/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole7/shift_reg[15] ) );
  DFFRHQ \db_mole7/button_out_reg  ( .D(n738), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[6]) );
  DFFRHQ \mole_btns_db_d_reg[6]  ( .D(mole_btns_db[6]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[6]) );
  DFFRHQ \db_mole8/sync_ff1_reg  ( .D(mole8_btn), .CK(clk), .RN(rstn), .Q(
        \db_mole8/sync_ff1 ) );
  DFFRHQ \db_mole8/sync_ff2_reg  ( .D(\db_mole8/sync_ff1 ), .CK(clk), .RN(rstn), .Q(\db_mole8/sync_ff2 ) );
  DFFRHQ \db_mole8/shift_reg_reg[0]  ( .D(\db_mole8/sync_ff2 ), .CK(clk), .RN(
        rstn), .Q(\db_mole8/shift_reg[0] ) );
  DFFRHQ \db_mole8/shift_reg_reg[1]  ( .D(\db_mole8/shift_reg[0] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[1] ) );
  DFFRHQ \db_mole8/shift_reg_reg[2]  ( .D(\db_mole8/shift_reg[1] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[2] ) );
  DFFRHQ \db_mole8/shift_reg_reg[3]  ( .D(\db_mole8/shift_reg[2] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[3] ) );
  DFFRHQ \db_mole8/shift_reg_reg[4]  ( .D(\db_mole8/shift_reg[3] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[4] ) );
  DFFRHQ \db_mole8/shift_reg_reg[5]  ( .D(\db_mole8/shift_reg[4] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[5] ) );
  DFFRHQ \db_mole8/shift_reg_reg[6]  ( .D(\db_mole8/shift_reg[5] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[6] ) );
  DFFRHQ \db_mole8/shift_reg_reg[7]  ( .D(\db_mole8/shift_reg[6] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[7] ) );
  DFFRHQ \db_mole8/shift_reg_reg[8]  ( .D(\db_mole8/shift_reg[7] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[8] ) );
  DFFRHQ \db_mole8/shift_reg_reg[9]  ( .D(\db_mole8/shift_reg[8] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[9] ) );
  DFFRHQ \db_mole8/shift_reg_reg[10]  ( .D(\db_mole8/shift_reg[9] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[10] ) );
  DFFRHQ \db_mole8/shift_reg_reg[11]  ( .D(\db_mole8/shift_reg[10] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[11] ) );
  DFFRHQ \db_mole8/shift_reg_reg[12]  ( .D(\db_mole8/shift_reg[11] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[12] ) );
  DFFRHQ \db_mole8/shift_reg_reg[13]  ( .D(\db_mole8/shift_reg[12] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[13] ) );
  DFFRHQ \db_mole8/shift_reg_reg[14]  ( .D(\db_mole8/shift_reg[13] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[14] ) );
  DFFRHQ \db_mole8/shift_reg_reg[15]  ( .D(\db_mole8/shift_reg[14] ), .CK(clk), 
        .RN(rstn), .Q(\db_mole8/shift_reg[15] ) );
  DFFRHQ \db_mole8/button_out_reg  ( .D(n737), .CK(clk), .RN(rstn), .Q(
        mole_btns_db[7]) );
  DFFRHQ \mole_btns_db_d_reg[7]  ( .D(mole_btns_db[7]), .CK(clk), .RN(rstn), 
        .Q(mole_btns_db_d[7]) );
  DFFSHQ \u_prng/random_reg[7]  ( .D(rnd_out[6]), .CK(clk), .SN(rstn), .Q(
        rnd_out[7]) );
  DFFSHQ \u_prng/random_reg[0]  ( .D(\u_prng/feedback ), .CK(clk), .SN(rstn), 
        .Q(rnd_out[0]) );
  DFFSHQ \u_prng/random_reg[1]  ( .D(rnd_out[0]), .CK(clk), .SN(rstn), .Q(
        rnd_out[1]) );
  DFFRHQ \u_prng/random_reg[2]  ( .D(rnd_out[1]), .CK(clk), .RN(rstn), .Q(
        rnd_out[2]) );
  DFFSHQ \u_prng/random_reg[3]  ( .D(rnd_out[2]), .CK(clk), .SN(rstn), .Q(
        rnd_out[3]) );
  DFFRHQ \u_prng/random_reg[4]  ( .D(rnd_out[3]), .CK(clk), .RN(rstn), .Q(
        rnd_out[4]) );
  DFFSHQ \u_prng/random_reg[5]  ( .D(rnd_out[4]), .CK(clk), .SN(rstn), .Q(
        rnd_out[5]) );
  DFFRHQ \u_prng/random_reg[6]  ( .D(rnd_out[5]), .CK(clk), .RN(rstn), .Q(
        rnd_out[6]) );
  DFFHQ \u_interval_cnt/div_cnt_reg[14]  ( .D(\u_interval_cnt/N79 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[14] ) );
  DFFHQ \u_interval_cnt/timeout_reg  ( .D(\u_interval_cnt/N85 ), .CK(clk), .Q(
        ic_timeout) );
  DFFRHQ \state_reg[0]  ( .D(next_state[0]), .CK(clk), .RN(rstn), .Q(state[0])
         );
  DFFRHQ \u_us/searching_reg  ( .D(n736), .CK(clk), .RN(n1336), .Q(
        \u_us/searching ) );
  DFFHQ \u_us/potential_number_reg[2]  ( .D(n723), .CK(clk), .Q(\u_us/N18 ) );
  DFFHQ \u_us/potential_number_reg[1]  ( .D(n725), .CK(clk), .Q(\u_us/N17 ) );
  DFFHQ \u_us/potential_number_reg[0]  ( .D(n727), .CK(clk), .Q(\u_us/N16 ) );
  DFFRHQ \u_us/selected_mask_reg[7]  ( .D(n663), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[7] ) );
  DFFRHQ \state_reg[2]  ( .D(next_state[2]), .CK(clk), .RN(rstn), .Q(state[2])
         );
  DFFRHQ \state_reg[1]  ( .D(next_state[1]), .CK(clk), .RN(rstn), .Q(state[1])
         );
  DFFRHQ \u_us/selected_mask_reg[0]  ( .D(n662), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[0] ) );
  DFFRHQ \u_us/selected_mask_reg[6]  ( .D(n661), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[6] ) );
  DFFRHQ \u_us/selected_mask_reg[5]  ( .D(n660), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[5] ) );
  DFFRHQ \u_us/selected_mask_reg[4]  ( .D(n659), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[4] ) );
  DFFRHQ \u_us/selected_mask_reg[3]  ( .D(n658), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[3] ) );
  DFFRHQ \u_us/selected_mask_reg[2]  ( .D(n657), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[2] ) );
  DFFRHQ \u_us/selected_mask_reg[1]  ( .D(n656), .CK(clk), .RN(n1336), .Q(
        \u_us/selected_mask[1] ) );
  DFFRHQ \u_us/selected_number_reg[0]  ( .D(n726), .CK(clk), .RN(n1336), .Q(
        us_selected_number[0]) );
  DFFRHQ \u_us/selected_number_reg[1]  ( .D(n724), .CK(clk), .RN(n1336), .Q(
        us_selected_number[1]) );
  DFFRHQ \u_us/selected_number_reg[2]  ( .D(n722), .CK(clk), .RN(n1336), .Q(
        us_selected_number[2]) );
  DFFRHQ \u_us/done_reg  ( .D(\u_us/N40 ), .CK(clk), .RN(n1336), .Q(us_done)
         );
  DFFRHQ \mole_pattern_reg[5]  ( .D(n665), .CK(clk), .RN(rstn), .Q(mole6_led)
         );
  DFFRHQ \mole_pattern_reg[0]  ( .D(n721), .CK(clk), .RN(rstn), .Q(mole1_led)
         );
  DFFRHQ \mole_pattern_reg[1]  ( .D(n720), .CK(clk), .RN(rstn), .Q(mole2_led)
         );
  DFFRHQ \mole_pattern_reg[2]  ( .D(n719), .CK(clk), .RN(rstn), .Q(mole3_led)
         );
  DFFRHQ \mole_pattern_reg[3]  ( .D(n718), .CK(clk), .RN(rstn), .Q(mole4_led)
         );
  DFFRHQ \mole_pattern_reg[4]  ( .D(n717), .CK(clk), .RN(rstn), .Q(mole5_led)
         );
  DFFRHQ \mole_pattern_reg[6]  ( .D(n716), .CK(clk), .RN(rstn), .Q(mole7_led)
         );
  DFFRHQ \mole_pattern_reg[7]  ( .D(n715), .CK(clk), .RN(rstn), .Q(mole8_led)
         );
  DFFSHQ \time_interval_reg[2]  ( .D(n734), .CK(clk), .SN(rstn), .Q(
        time_interval[2]) );
  DFFSHQ \time_interval_reg[1]  ( .D(n1353), .CK(clk), .SN(rstn), .Q(
        time_interval[1]) );
  DFFSHQ \level_reg[0]  ( .D(n733), .CK(clk), .SN(rstn), .Q(level[0]) );
  DFFRHQ \level_reg[1]  ( .D(n732), .CK(clk), .RN(rstn), .Q(level[1]) );
  DFFRHQ \level_reg[2]  ( .D(n731), .CK(clk), .RN(rstn), .Q(level[2]) );
  DFFRHQ \level_reg[3]  ( .D(n666), .CK(clk), .RN(rstn), .Q(level[3]) );
  DFFSHQ \multiplier_reg[0]  ( .D(n730), .CK(clk), .SN(rstn), .Q(multiplier[0]) );
  DFFRHQ \multiplier_reg[1]  ( .D(n729), .CK(clk), .RN(rstn), .Q(multiplier[1]) );
  DFFRHQ \multiplier_reg[2]  ( .D(n728), .CK(clk), .RN(rstn), .Q(multiplier[2]) );
  DFFRHQ \multiplier_reg[3]  ( .D(n667), .CK(clk), .RN(rstn), .Q(multiplier[3]) );
  DFFHQ \u_interval_cnt/div_cnt_reg[0]  ( .D(\u_interval_cnt/N65 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[0] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[1]  ( .D(\u_interval_cnt/N66 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[1] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[2]  ( .D(\u_interval_cnt/N67 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[2] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[3]  ( .D(\u_interval_cnt/N68 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[3] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[4]  ( .D(\u_interval_cnt/N69 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[4] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[5]  ( .D(\u_interval_cnt/N70 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[5] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[6]  ( .D(\u_interval_cnt/N71 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[6] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[7]  ( .D(\u_interval_cnt/N72 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[7] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[8]  ( .D(\u_interval_cnt/N73 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[8] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[9]  ( .D(\u_interval_cnt/N74 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[9] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[10]  ( .D(\u_interval_cnt/N75 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[10] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[11]  ( .D(\u_interval_cnt/N76 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[11] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[12]  ( .D(\u_interval_cnt/N77 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[12] ) );
  DFFHQ \u_interval_cnt/div_cnt_reg[13]  ( .D(\u_interval_cnt/N78 ), .CK(clk), 
        .Q(\u_interval_cnt/div_cnt[13] ) );
  DFFHQ \u_interval_cnt/count_reg[2]  ( .D(n698), .CK(clk), .Q(ic_count[2]) );
  DFFHQ \u_interval_cnt/count_reg[0]  ( .D(n697), .CK(clk), .Q(ic_count[0]) );
  DFFHQ \u_interval_cnt/count_reg[1]  ( .D(n1335), .CK(clk), .Q(ic_count[1])
         );
  DFFHQ \u_interval_cnt/done_reg  ( .D(n695), .CK(clk), .Q(
        \u_interval_cnt/done ) );
  DFFRHQ \score_reg_reg[15]  ( .D(n1337), .CK(clk), .RN(rstn), .Q(
        score_reg[15]) );
  DFFRHQ \score_reg_reg[0]  ( .D(n1338), .CK(clk), .RN(rstn), .Q(
        \u_score_disp/N106 ) );
  DFFRHQ \score_reg_reg[1]  ( .D(n1339), .CK(clk), .RN(rstn), .Q(score_reg[1])
         );
  DFFRHQ \score_reg_reg[2]  ( .D(n1340), .CK(clk), .RN(rstn), .Q(score_reg[2])
         );
  DFFRHQ \score_reg_reg[3]  ( .D(n1341), .CK(clk), .RN(rstn), .Q(score_reg[3])
         );
  DFFRHQ \score_reg_reg[4]  ( .D(n1342), .CK(clk), .RN(rstn), .Q(score_reg[4])
         );
  DFFRHQ \score_reg_reg[5]  ( .D(n1343), .CK(clk), .RN(rstn), .Q(score_reg[5])
         );
  DFFRHQ \score_reg_reg[6]  ( .D(n1344), .CK(clk), .RN(rstn), .Q(score_reg[6])
         );
  DFFRHQ \score_reg_reg[7]  ( .D(n1345), .CK(clk), .RN(rstn), .Q(score_reg[7])
         );
  DFFRHQ \score_reg_reg[8]  ( .D(n1346), .CK(clk), .RN(rstn), .Q(score_reg[8])
         );
  DFFRHQ \score_reg_reg[9]  ( .D(n1347), .CK(clk), .RN(rstn), .Q(score_reg[9])
         );
  DFFRHQ \score_reg_reg[10]  ( .D(n1348), .CK(clk), .RN(rstn), .Q(
        score_reg[10]) );
  DFFRHQ \score_reg_reg[11]  ( .D(n1349), .CK(clk), .RN(rstn), .Q(
        score_reg[11]) );
  DFFRHQ \score_reg_reg[12]  ( .D(n1350), .CK(clk), .RN(rstn), .Q(
        score_reg[12]) );
  DFFRHQ \score_reg_reg[13]  ( .D(n1351), .CK(clk), .RN(rstn), .Q(
        score_reg[13]) );
  DFFRHQ \score_reg_reg[14]  ( .D(n1352), .CK(clk), .RN(rstn), .Q(
        score_reg[14]) );
  DFFHQ \u_score_disp/scan_cnt_reg[15]  ( .D(\u_score_disp/N629 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[15] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[14]  ( .D(\u_score_disp/N628 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[14] ) );
  DFFHQ \u_score_disp/digit_idx_reg[0]  ( .D(n655), .CK(clk), .Q(
        \u_score_disp/digit_idx[0] ) );
  DFFHQ \u_score_disp/digit_idx_reg[1]  ( .D(n654), .CK(clk), .Q(
        \u_score_disp/digit_idx[1] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[0]  ( .D(\u_score_disp/N614 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[0] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[1]  ( .D(\u_score_disp/N615 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[1] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[2]  ( .D(\u_score_disp/N616 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[2] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[3]  ( .D(\u_score_disp/N617 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[3] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[4]  ( .D(\u_score_disp/N618 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[4] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[5]  ( .D(\u_score_disp/N619 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[5] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[6]  ( .D(\u_score_disp/N620 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[6] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[7]  ( .D(\u_score_disp/N621 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[7] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[8]  ( .D(\u_score_disp/N622 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[8] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[9]  ( .D(\u_score_disp/N623 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[9] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[10]  ( .D(\u_score_disp/N624 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[10] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[11]  ( .D(\u_score_disp/N625 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[11] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[12]  ( .D(\u_score_disp/N626 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[12] ) );
  DFFHQ \u_score_disp/scan_cnt_reg[13]  ( .D(\u_score_disp/N627 ), .CK(clk), 
        .Q(\u_score_disp/scan_cnt[13] ) );
  MX2 U687 ( .A(\u_us/selected_mask[6] ), .B(\u_us/selected_mask[7] ), .S0(
        \u_us/N16 ), .Y(n749) );
  MX2 U688 ( .A(\u_us/selected_mask[4] ), .B(\u_us/selected_mask[5] ), .S0(
        \u_us/N16 ), .Y(n750) );
  MX2 U689 ( .A(n750), .B(n749), .S0(n812), .Y(n751) );
  MX2 U690 ( .A(\u_us/selected_mask[2] ), .B(\u_us/selected_mask[3] ), .S0(
        \u_us/N16 ), .Y(n752) );
  MX2 U691 ( .A(\u_us/selected_mask[0] ), .B(\u_us/selected_mask[1] ), .S0(
        \u_us/N16 ), .Y(n753) );
  MX2 U692 ( .A(n753), .B(n752), .S0(n812), .Y(n754) );
  ADDF \r817/U2_2  ( .A(n817), .B(n272), .CI(\r817/carry[2] ), .CO(
        \r817/carry[3] ), .S(\r817/DIFF[2] ) );
  ADDF \r817/U2_3  ( .A(\u_score_disp/rem2[3] ), .B(n642), .CI(\r817/carry[3] ), .S(\r817/DIFF[3] ) );
  ADDF \add_430/U1_1  ( .A(multiplier[1]), .B(score_reg[1]), .CI(n801), .CO(
        \add_430/carry[2] ), .S(N113) );
  ADDF \add_430/U1_2  ( .A(multiplier[2]), .B(score_reg[2]), .CI(
        \add_430/carry[2] ), .CO(\add_430/carry[3] ), .S(N114) );
  ADDF \add_430/U1_3  ( .A(multiplier[3]), .B(score_reg[3]), .CI(
        \add_430/carry[3] ), .CO(\add_430/carry[4] ), .S(N115) );
  ADDF \r812/U2_3  ( .A(n1374), .B(n424), .CI(\r812/carry[3] ), .CO(
        \r812/carry[4] ), .S(\u_score_disp/N372 ) );
  ADDF \r812/U2_4  ( .A(n1373), .B(n1360), .CI(\r812/carry[4] ), .CO(
        \r812/carry[5] ), .S(\u_score_disp/N373 ) );
  ADDF \r812/U2_5  ( .A(n1372), .B(n1359), .CI(\r812/carry[5] ), .CO(
        \r812/carry[6] ), .S(\u_score_disp/N374 ) );
  ADDF \r812/U2_6  ( .A(n1371), .B(n1361), .CI(\r812/carry[6] ), .CO(
        \r812/carry[7] ), .S(\u_score_disp/N375 ) );
  ADDF \r812/U2_7  ( .A(n1370), .B(n415), .CI(\r812/carry[7] ), .CO(
        \r812/carry[8] ), .S(\u_score_disp/N376 ) );
  ADDF \r812/U2_8  ( .A(n1369), .B(n418), .CI(\r812/carry[8] ), .CO(
        \r812/carry[9] ), .S(\u_score_disp/N377 ) );
  ADDF \r812/U2_9  ( .A(n1368), .B(n423), .CI(\r812/carry[9] ), .CO(
        \r812/carry[10] ), .S(\u_score_disp/N378 ) );
  ADDF \r811/U2_4  ( .A(score_reg[4]), .B(n613), .CI(\r811/carry[4] ), .CO(
        \r811/carry[5] ), .S(\u_score_disp/N110 ) );
  ADDF \r811/U2_5  ( .A(score_reg[5]), .B(n440), .CI(\r811/carry[5] ), .CO(
        \r811/carry[6] ), .S(\u_score_disp/N111 ) );
  ADDF \r811/U2_6  ( .A(score_reg[6]), .B(n1376), .CI(\r811/carry[6] ), .CO(
        \r811/carry[7] ), .S(\u_score_disp/N112 ) );
  ADDF \r811/U2_7  ( .A(score_reg[7]), .B(n438), .CI(\r811/carry[7] ), .CO(
        \r811/carry[8] ), .S(\u_score_disp/N113 ) );
  ADDF \r811/U2_10  ( .A(score_reg[10]), .B(n618), .CI(n800), .CO(
        \r811/carry[11] ), .S(\u_score_disp/N116 ) );
  ADDF \r811/U2_11  ( .A(score_reg[11]), .B(n1377), .CI(\r811/carry[11] ), 
        .CO(\r811/carry[12] ), .S(\u_score_disp/N117 ) );
  ADDF \r811/U2_12  ( .A(score_reg[12]), .B(n616), .CI(\r811/carry[12] ), .CO(
        \r811/carry[13] ), .S(\u_score_disp/N118 ) );
  ADDF \r811/U2_13  ( .A(score_reg[13]), .B(n1378), .CI(\r811/carry[13] ), 
        .CO(\r811/carry[14] ), .S(\u_score_disp/N119 ) );
  AND2 U693 ( .A(score_reg[4]), .B(\add_430/carry[4] ), .Y(n755) );
  AND2 U694 ( .A(score_reg[5]), .B(n755), .Y(n756) );
  AND2 U695 ( .A(score_reg[6]), .B(n756), .Y(n757) );
  AND2 U696 ( .A(score_reg[7]), .B(n757), .Y(n758) );
  AND2 U697 ( .A(score_reg[8]), .B(n758), .Y(n759) );
  AND2 U698 ( .A(score_reg[9]), .B(n759), .Y(n760) );
  AND2 U699 ( .A(score_reg[10]), .B(n760), .Y(n761) );
  AND2 U700 ( .A(score_reg[11]), .B(n761), .Y(n762) );
  AND2 U701 ( .A(score_reg[12]), .B(n762), .Y(n763) );
  AND2 U702 ( .A(score_reg[13]), .B(n763), .Y(n764) );
  AND2 U703 ( .A(\u_score_disp/scan_cnt[1] ), .B(\u_score_disp/scan_cnt[0] ), 
        .Y(n765) );
  AND2 U704 ( .A(\u_score_disp/scan_cnt[2] ), .B(n765), .Y(n766) );
  AND2 U705 ( .A(\u_score_disp/scan_cnt[3] ), .B(n766), .Y(n767) );
  AND2 U706 ( .A(\u_score_disp/scan_cnt[4] ), .B(n767), .Y(n768) );
  AND2 U707 ( .A(\u_score_disp/scan_cnt[5] ), .B(n768), .Y(n769) );
  AND2 U708 ( .A(\u_score_disp/scan_cnt[6] ), .B(n769), .Y(n770) );
  AND2 U709 ( .A(\u_score_disp/scan_cnt[7] ), .B(n770), .Y(n771) );
  AND2 U710 ( .A(\u_score_disp/scan_cnt[8] ), .B(n771), .Y(n772) );
  AND2 U711 ( .A(\u_score_disp/scan_cnt[9] ), .B(n772), .Y(n773) );
  AND2 U712 ( .A(\u_score_disp/scan_cnt[10] ), .B(n773), .Y(n774) );
  AND2 U713 ( .A(\u_score_disp/scan_cnt[11] ), .B(n774), .Y(n775) );
  AND2 U714 ( .A(\u_score_disp/scan_cnt[12] ), .B(n775), .Y(n776) );
  AND2 U715 ( .A(\u_score_disp/scan_cnt[13] ), .B(n776), .Y(n777) );
  AND2 U716 ( .A(\r811/carry[8] ), .B(score_reg[8]), .Y(n778) );
  AND2 U717 ( .A(\u_interval_cnt/div_cnt[1] ), .B(\u_interval_cnt/div_cnt[0] ), 
        .Y(n779) );
  AND2 U718 ( .A(\u_interval_cnt/div_cnt[2] ), .B(n779), .Y(n780) );
  AND2 U719 ( .A(\u_interval_cnt/div_cnt[3] ), .B(n780), .Y(n781) );
  AND2 U720 ( .A(\u_interval_cnt/div_cnt[4] ), .B(n781), .Y(n782) );
  AND2 U721 ( .A(\u_interval_cnt/div_cnt[5] ), .B(n782), .Y(n783) );
  AND2 U722 ( .A(\u_interval_cnt/div_cnt[6] ), .B(n783), .Y(n784) );
  AND2 U723 ( .A(\u_interval_cnt/div_cnt[7] ), .B(n784), .Y(n785) );
  AND2 U724 ( .A(\u_interval_cnt/div_cnt[8] ), .B(n785), .Y(n786) );
  AND2 U725 ( .A(\u_interval_cnt/div_cnt[9] ), .B(n786), .Y(n787) );
  AND2 U726 ( .A(\u_interval_cnt/div_cnt[10] ), .B(n787), .Y(n788) );
  AND2 U727 ( .A(\u_interval_cnt/div_cnt[11] ), .B(n788), .Y(n789) );
  AND2 U728 ( .A(\u_interval_cnt/div_cnt[12] ), .B(n789), .Y(n790) );
  AND2 U729 ( .A(us_selected_number[1]), .B(n1354), .Y(n791) );
  AND2 U730 ( .A(us_selected_number[1]), .B(us_selected_number[0]), .Y(n792)
         );
  AND2 U731 ( .A(score_reg[14]), .B(n764), .Y(n793) );
  AND2 U732 ( .A(\u_score_disp/scan_cnt[14] ), .B(n777), .Y(n794) );
  AND2 U733 ( .A(\u_interval_cnt/div_cnt[13] ), .B(n790), .Y(n795) );
  AND2 U734 ( .A(us_selected_number[2]), .B(\sll_307/ML_int[2][0] ), .Y(n796)
         );
  AND2 U735 ( .A(us_selected_number[2]), .B(n791), .Y(n797) );
  AND2 U736 ( .A(us_selected_number[2]), .B(n792), .Y(n798) );
  AND2 U737 ( .A(us_selected_number[2]), .B(\sll_307/ML_int[2][1] ), .Y(n799)
         );
  AND2 U738 ( .A(n778), .B(score_reg[9]), .Y(n800) );
  AND2 U739 ( .A(\u_score_disp/N106 ), .B(n810), .Y(n801) );
  INV U740 ( .A(n1231), .Y(n802) );
  INV U741 ( .A(n802), .Y(n803) );
  INV U742 ( .A(n851), .Y(n804) );
  INV U743 ( .A(n869), .Y(n805) );
  BUF U744 ( .I(n882), .O(n806) );
  BUF U745 ( .I(n1287), .O(n807) );
  INV U746 ( .A(n955), .Y(n808) );
  INV U747 ( .A(n1295), .Y(n809) );
  INV U748 ( .A(n911), .Y(n810) );
  INV U749 ( .A(n824), .Y(n811) );
  BUF U750 ( .I(\u_us/N17 ), .O(n812) );
  BUF U751 ( .I(n1379), .O(game_over_led) );
  INV U752 ( .A(n853), .Y(n814) );
  BUF U753 ( .I(n1007), .O(n815) );
  INV U754 ( .A(n934), .Y(n816) );
  BUF U755 ( .I(\u_score_disp/rem2[2] ), .O(n817) );
  INV U756 ( .A(n884), .Y(n818) );
  INV U757 ( .A(n1198), .Y(n819) );
  BUF U758 ( .I(n883), .O(n820) );
  INV U759 ( .A(n1288), .Y(n821) );
  BUF U760 ( .I(n966), .O(n822) );
  BUF U761 ( .I(n1005), .O(n823) );
  NAND2 U762 ( .A(n898), .B(n824), .Y(\r817/carry[2] ) );
  XNOR2 U763 ( .A(n1357), .B(\u_score_disp/rem2[1] ), .Y(\r817/DIFF[1] ) );
  INV U764 ( .A(\u_score_disp/rem2[1] ), .Y(n824) );
  NAND2 U765 ( .A(n825), .B(n826), .Y(\r812/carry[11] ) );
  XNOR2 U766 ( .A(n1367), .B(\r812/carry[10] ), .Y(\u_score_disp/N379 ) );
  INV U767 ( .A(n1367), .Y(n825) );
  INV U768 ( .A(\r812/carry[10] ), .Y(n826) );
  NAND2 U769 ( .A(n827), .B(n828), .Y(\r812/carry[12] ) );
  XNOR2 U770 ( .A(n1366), .B(\r812/carry[11] ), .Y(\u_score_disp/N380 ) );
  INV U771 ( .A(n1366), .Y(n827) );
  INV U772 ( .A(\r812/carry[11] ), .Y(n828) );
  NAND2 U773 ( .A(n829), .B(n830), .Y(\r812/carry[13] ) );
  XNOR2 U774 ( .A(n1365), .B(\r812/carry[12] ), .Y(\u_score_disp/N381 ) );
  INV U775 ( .A(n1365), .Y(n829) );
  INV U776 ( .A(\r812/carry[12] ), .Y(n830) );
  NAND2 U777 ( .A(n831), .B(n832), .Y(\r812/carry[14] ) );
  XNOR2 U778 ( .A(n1364), .B(\r812/carry[13] ), .Y(\u_score_disp/N382 ) );
  INV U779 ( .A(n1364), .Y(n831) );
  INV U780 ( .A(\r812/carry[13] ), .Y(n832) );
  NAND2 U781 ( .A(n833), .B(n834), .Y(\r812/carry[15] ) );
  XNOR2 U782 ( .A(n1363), .B(\r812/carry[14] ), .Y(\u_score_disp/N383 ) );
  INV U783 ( .A(n1363), .Y(n833) );
  INV U784 ( .A(\r812/carry[14] ), .Y(n834) );
  XNOR2 U785 ( .A(n1362), .B(\r812/carry[15] ), .Y(\u_score_disp/N384 ) );
  NAND2 U786 ( .A(n1022), .B(n835), .Y(\r811/carry[15] ) );
  XNOR2 U787 ( .A(score_reg[14]), .B(\r811/carry[14] ), .Y(\u_score_disp/N120 ) );
  INV U788 ( .A(\r811/carry[14] ), .Y(n835) );
  XNOR2 U789 ( .A(score_reg[15]), .B(\r811/carry[15] ), .Y(\u_score_disp/N121 ) );
  NAND2 U790 ( .A(n836), .B(n1011), .Y(\r811/carry[4] ) );
  XNOR2 U791 ( .A(n434), .B(score_reg[3]), .Y(\u_score_disp/N109 ) );
  INV U792 ( .A(n434), .Y(n836) );
  NAND2 U793 ( .A(n837), .B(n1255), .Y(\r812/carry[3] ) );
  XNOR2 U794 ( .A(n1358), .B(n1375), .Y(\u_score_disp/N371 ) );
  INV U795 ( .A(n1358), .Y(n837) );
  XOR2 U796 ( .A(\u_score_disp/N106 ), .B(multiplier[0]), .Y(N112) );
  XOR2 U797 ( .A(score_reg[4]), .B(\add_430/carry[4] ), .Y(N116) );
  XOR2 U798 ( .A(score_reg[5]), .B(n755), .Y(N117) );
  XOR2 U799 ( .A(score_reg[6]), .B(n756), .Y(N118) );
  XOR2 U800 ( .A(score_reg[7]), .B(n757), .Y(N119) );
  XOR2 U801 ( .A(score_reg[8]), .B(n758), .Y(N120) );
  XOR2 U802 ( .A(score_reg[9]), .B(n759), .Y(N121) );
  XOR2 U803 ( .A(score_reg[10]), .B(n760), .Y(N122) );
  XOR2 U804 ( .A(score_reg[11]), .B(n761), .Y(N123) );
  XOR2 U805 ( .A(score_reg[12]), .B(n762), .Y(N124) );
  XOR2 U806 ( .A(score_reg[13]), .B(n763), .Y(N125) );
  XOR2 U807 ( .A(score_reg[14]), .B(n764), .Y(N126) );
  XOR2 U808 ( .A(score_reg[15]), .B(n793), .Y(N127) );
  XOR2 U809 ( .A(\u_score_disp/scan_cnt[1] ), .B(\u_score_disp/scan_cnt[0] ), 
        .Y(\u_score_disp/N599 ) );
  XOR2 U810 ( .A(\u_score_disp/scan_cnt[2] ), .B(n765), .Y(\u_score_disp/N600 ) );
  XOR2 U811 ( .A(\u_score_disp/scan_cnt[3] ), .B(n766), .Y(\u_score_disp/N601 ) );
  XOR2 U812 ( .A(\u_score_disp/scan_cnt[4] ), .B(n767), .Y(\u_score_disp/N602 ) );
  XOR2 U813 ( .A(\u_score_disp/scan_cnt[5] ), .B(n768), .Y(\u_score_disp/N603 ) );
  XOR2 U814 ( .A(\u_score_disp/scan_cnt[6] ), .B(n769), .Y(\u_score_disp/N604 ) );
  XOR2 U815 ( .A(\u_score_disp/scan_cnt[7] ), .B(n770), .Y(\u_score_disp/N605 ) );
  XOR2 U816 ( .A(\u_score_disp/scan_cnt[8] ), .B(n771), .Y(\u_score_disp/N606 ) );
  XOR2 U817 ( .A(\u_score_disp/scan_cnt[9] ), .B(n772), .Y(\u_score_disp/N607 ) );
  XOR2 U818 ( .A(\u_score_disp/scan_cnt[10] ), .B(n773), .Y(
        \u_score_disp/N608 ) );
  XOR2 U819 ( .A(\u_score_disp/scan_cnt[11] ), .B(n774), .Y(
        \u_score_disp/N609 ) );
  XOR2 U820 ( .A(\u_score_disp/scan_cnt[12] ), .B(n775), .Y(
        \u_score_disp/N610 ) );
  XOR2 U821 ( .A(\u_score_disp/scan_cnt[13] ), .B(n776), .Y(
        \u_score_disp/N611 ) );
  XOR2 U822 ( .A(\u_score_disp/scan_cnt[14] ), .B(n777), .Y(
        \u_score_disp/N612 ) );
  XOR2 U823 ( .A(\u_score_disp/scan_cnt[15] ), .B(n794), .Y(
        \u_score_disp/N613 ) );
  XOR2 U824 ( .A(score_reg[8]), .B(\r811/carry[8] ), .Y(\u_score_disp/N114 )
         );
  XOR2 U825 ( .A(score_reg[9]), .B(n778), .Y(\u_score_disp/N115 ) );
  XOR2 U826 ( .A(\u_interval_cnt/div_cnt[1] ), .B(\u_interval_cnt/div_cnt[0] ), 
        .Y(\u_interval_cnt/N14 ) );
  XOR2 U827 ( .A(\u_interval_cnt/div_cnt[2] ), .B(n779), .Y(
        \u_interval_cnt/N15 ) );
  XOR2 U828 ( .A(\u_interval_cnt/div_cnt[3] ), .B(n780), .Y(
        \u_interval_cnt/N16 ) );
  XOR2 U829 ( .A(\u_interval_cnt/div_cnt[4] ), .B(n781), .Y(
        \u_interval_cnt/N17 ) );
  XOR2 U830 ( .A(\u_interval_cnt/div_cnt[5] ), .B(n782), .Y(
        \u_interval_cnt/N18 ) );
  XOR2 U831 ( .A(\u_interval_cnt/div_cnt[6] ), .B(n783), .Y(
        \u_interval_cnt/N19 ) );
  XOR2 U832 ( .A(\u_interval_cnt/div_cnt[7] ), .B(n784), .Y(
        \u_interval_cnt/N20 ) );
  XOR2 U833 ( .A(\u_interval_cnt/div_cnt[8] ), .B(n785), .Y(
        \u_interval_cnt/N21 ) );
  XOR2 U834 ( .A(\u_interval_cnt/div_cnt[9] ), .B(n786), .Y(
        \u_interval_cnt/N22 ) );
  XOR2 U835 ( .A(\u_interval_cnt/div_cnt[10] ), .B(n787), .Y(
        \u_interval_cnt/N23 ) );
  XOR2 U836 ( .A(\u_interval_cnt/div_cnt[11] ), .B(n788), .Y(
        \u_interval_cnt/N24 ) );
  XOR2 U837 ( .A(\u_interval_cnt/div_cnt[12] ), .B(n789), .Y(
        \u_interval_cnt/N25 ) );
  XOR2 U838 ( .A(\u_interval_cnt/div_cnt[13] ), .B(n790), .Y(
        \u_interval_cnt/N26 ) );
  XOR2 U839 ( .A(\u_interval_cnt/div_cnt[14] ), .B(n795), .Y(
        \u_interval_cnt/N27 ) );
  MX2 U840 ( .A(ic_count[1]), .B(n838), .S0(ic_count[2]), .Y(
        \u_timer_disp/N68 ) );
  OAI2BB2 U841 ( .B0(ic_count[1]), .B1(ic_count[0]), .A0N(ic_count[2]), .A1N(
        n838), .Y(\u_timer_disp/N39 ) );
  NAND2B U842 ( .AN(n839), .B(ic_count[1]), .Y(\u_timer_disp/N24 ) );
  OAI211 U843 ( .A0(n840), .A1(n841), .B0(n839), .C0(n842), .Y(
        \u_timer_disp/N14 ) );
  OAI211 U844 ( .A0(n843), .A1(n844), .B0(n845), .C0(n846), .Y(
        \u_score_disp/u_seg/N43 ) );
  INV U845 ( .A(n847), .Y(n846) );
  MX2 U846 ( .A(n843), .B(n848), .S0(n849), .Y(n847) );
  NOR2B U847 ( .AN(n850), .B(n851), .Y(n848) );
  OAI21 U848 ( .A0(n852), .A1(n853), .B0(n854), .Y(\u_score_disp/u_seg/N39 )
         );
  XOR2 U849 ( .A(n851), .B(n855), .Y(n854) );
  INV U850 ( .A(n849), .Y(n853) );
  OAI2BB2 U851 ( .B0(n844), .B1(n856), .A0N(n814), .A1N(n855), .Y(
        \u_score_disp/u_seg/N36 ) );
  INV U852 ( .A(n843), .Y(n855) );
  NOR2B U853 ( .AN(n857), .B(n858), .Y(n856) );
  OAI211 U854 ( .A0(n851), .A1(n859), .B0(n860), .C0(n861), .Y(
        \u_score_disp/u_seg/N33 ) );
  MX2 U855 ( .A(n862), .B(n863), .S0(n849), .Y(n861) );
  NAND2 U856 ( .A(n858), .B(n850), .Y(n863) );
  NOR2B U857 ( .AN(n845), .B(n843), .Y(n862) );
  NOR2B U858 ( .AN(n850), .B(n858), .Y(n843) );
  OAI21 U859 ( .A0(n814), .A1(n858), .B0(n864), .Y(\u_score_disp/u_seg/N24 )
         );
  MX2 U860 ( .A(n850), .B(n865), .S0(n804), .Y(n864) );
  NOR2B U861 ( .AN(n814), .B(n845), .Y(n865) );
  INV U862 ( .A(n852), .Y(n845) );
  NOR2B U863 ( .AN(n858), .B(n850), .Y(n852) );
  OAI221 U864 ( .A0(n866), .A1(n851), .B0(n814), .B1(n860), .C0(n859), .Y(
        \u_score_disp/u_seg/N21 ) );
  INV U865 ( .A(n867), .Y(n860) );
  NOR2B U866 ( .AN(n868), .B(n857), .Y(n866) );
  XOR2 U867 ( .A(n814), .B(n869), .Y(n868) );
  OAI211 U868 ( .A0(n869), .A1(n870), .B0(n859), .C0(n871), .Y(
        \u_score_disp/u_seg/N14 ) );
  AOI21 U869 ( .A0(n814), .A1(n851), .B0(n872), .Y(n871) );
  MX2 U870 ( .A(n873), .B(n867), .S0(n857), .Y(n872) );
  NOR2B U871 ( .AN(n851), .B(n805), .Y(n867) );
  NOR2B U872 ( .AN(n844), .B(n814), .Y(n873) );
  INV U873 ( .A(n844), .Y(n851) );
  NAND2 U874 ( .A(n857), .B(n849), .Y(n859) );
  AOI221 U875 ( .A0(n874), .A1(score_sel2), .B0(n809), .B1(\u_score_disp/N635 ), .C0(n876), .Y(n849) );
  OAI32 U876 ( .A0(n877), .A1(n878), .A2(n879), .B0(n880), .B1(n1357), .Y(n876) );
  OAI21 U877 ( .A0(n881), .A1(n806), .B0(\u_score_disp/N106 ), .Y(n879) );
  NOR2B U878 ( .AN(n857), .B(n844), .Y(n870) );
  AOI221 U879 ( .A0(n820), .A1(score_sel2), .B0(n884), .B1(\u_score_disp/N635 ), .C0(n885), .Y(n844) );
  INV U880 ( .A(n886), .Y(n885) );
  AOI222 U881 ( .A0(score_sel1), .A1(n887), .B0(\r817/DIFF[3] ), .B1(n881), 
        .C0(n806), .C1(\u_score_disp/rem2[3] ), .Y(n886) );
  INV U882 ( .A(n850), .Y(n857) );
  OAI221 U883 ( .A0(n888), .A1(n889), .B0(n890), .B1(n891), .C0(n892), .Y(n850) );
  AOI222 U884 ( .A0(score_sel1), .A1(n893), .B0(\r817/DIFF[2] ), .B1(n881), 
        .C0(n806), .C1(n817), .Y(n892) );
  INV U885 ( .A(n858), .Y(n869) );
  OAI221 U886 ( .A0(n894), .A1(n891), .B0(n272), .B1(n880), .C0(n895), .Y(n858) );
  AOI222 U887 ( .A0(score_sel2), .A1(n896), .B0(\r817/DIFF[1] ), .B1(n881), 
        .C0(n806), .C1(\u_score_disp/rem2[1] ), .Y(n895) );
  NOR4BB U888 ( .AN(n272), .BN(n897), .C(n893), .D(n898), .Y(n882) );
  NOR2B U889 ( .AN(\u_score_disp/N630 ), .B(n887), .Y(n897) );
  INV U890 ( .A(n899), .Y(n881) );
  OAI31 U891 ( .A0(n900), .A1(n893), .A2(n898), .B0(\u_score_disp/N630 ), .Y(
        n899) );
  NAND2 U892 ( .A(n901), .B(n272), .Y(n900) );
  INV U893 ( .A(\u_score_disp/N635 ), .Y(n891) );
  NOR2B U894 ( .AN(\u_score_disp/digit_idx[0] ), .B(n902), .Y(
        \u_score_disp/N635 ) );
  NOR2 U895 ( .A(\u_score_disp/digit_idx[1] ), .B(\u_score_disp/digit_idx[0] ), 
        .Y(\u_score_disp/N630 ) );
  NOR2B U896 ( .AN(\u_score_disp/N613 ), .B(n903), .Y(\u_score_disp/N629 ) );
  NOR2B U897 ( .AN(\u_score_disp/N612 ), .B(n903), .Y(\u_score_disp/N628 ) );
  NOR2B U898 ( .AN(\u_score_disp/N611 ), .B(n903), .Y(\u_score_disp/N627 ) );
  NOR2B U899 ( .AN(\u_score_disp/N610 ), .B(n903), .Y(\u_score_disp/N626 ) );
  NOR2B U900 ( .AN(\u_score_disp/N609 ), .B(n903), .Y(\u_score_disp/N625 ) );
  NOR2B U901 ( .AN(\u_score_disp/N608 ), .B(n903), .Y(\u_score_disp/N624 ) );
  NOR2B U902 ( .AN(\u_score_disp/N607 ), .B(n903), .Y(\u_score_disp/N623 ) );
  NOR2B U903 ( .AN(\u_score_disp/N606 ), .B(n903), .Y(\u_score_disp/N622 ) );
  NOR2B U904 ( .AN(\u_score_disp/N605 ), .B(n903), .Y(\u_score_disp/N621 ) );
  NOR2B U905 ( .AN(\u_score_disp/N604 ), .B(n903), .Y(\u_score_disp/N620 ) );
  NOR2B U906 ( .AN(\u_score_disp/N603 ), .B(n903), .Y(\u_score_disp/N619 ) );
  NOR2B U907 ( .AN(\u_score_disp/N602 ), .B(n903), .Y(\u_score_disp/N618 ) );
  NOR2B U908 ( .AN(\u_score_disp/N601 ), .B(n903), .Y(\u_score_disp/N617 ) );
  NOR2B U909 ( .AN(\u_score_disp/N600 ), .B(n903), .Y(\u_score_disp/N616 ) );
  NOR2B U910 ( .AN(\u_score_disp/N599 ), .B(n903), .Y(\u_score_disp/N615 ) );
  NOR2 U911 ( .A(n903), .B(\u_score_disp/scan_cnt[0] ), .Y(\u_score_disp/N614 ) );
  ADDF U912 ( .A(rnd_out[4]), .B(rnd_out[3]), .CI(n904), .S(\u_prng/feedback )
         );
  XOR2 U913 ( .A(rnd_out[7]), .B(rnd_out[5]), .Y(n904) );
  OAI211 U914 ( .A0(n905), .A1(n906), .B0(n907), .C0(n908), .Y(
        \u_mult_disp/N43 ) );
  MX2 U915 ( .A(n909), .B(n910), .S0(multiplier[0]), .Y(n908) );
  OAI2BB1 U916 ( .A0N(n911), .A1N(n907), .B0(n912), .Y(\u_mult_disp/N39 ) );
  XOR2 U917 ( .A(multiplier[3]), .B(n910), .Y(n912) );
  INV U918 ( .A(n905), .Y(n910) );
  OAI22 U919 ( .A0(n913), .A1(n906), .B0(n810), .B1(n905), .Y(
        \u_mult_disp/N36 ) );
  NOR2B U920 ( .AN(n914), .B(multiplier[1]), .Y(n913) );
  OAI211 U921 ( .A0(multiplier[3]), .A1(n915), .B0(n916), .C0(n917), .Y(
        \u_mult_disp/N33 ) );
  MX2 U922 ( .A(n918), .B(n919), .S0(multiplier[0]), .Y(n917) );
  NOR2B U923 ( .AN(n907), .B(n905), .Y(n919) );
  NOR2B U924 ( .AN(n920), .B(n914), .Y(n905) );
  NAND2 U925 ( .A(multiplier[1]), .B(multiplier[2]), .Y(n918) );
  OAI21 U926 ( .A0(multiplier[1]), .A1(n911), .B0(n921), .Y(\u_mult_disp/N24 )
         );
  MX2 U927 ( .A(n922), .B(multiplier[2]), .S0(multiplier[3]), .Y(n921) );
  NOR2 U928 ( .A(n810), .B(n907), .Y(n922) );
  OAI221 U929 ( .A0(multiplier[3]), .A1(n923), .B0(n911), .B1(n916), .C0(n915), 
        .Y(\u_mult_disp/N21 ) );
  NOR2B U930 ( .AN(n924), .B(n914), .Y(n923) );
  XOR2 U931 ( .A(multiplier[1]), .B(multiplier[0]), .Y(n924) );
  OAI211 U932 ( .A0(multiplier[2]), .A1(n916), .B0(n925), .C0(n926), .Y(
        \u_mult_disp/N14 ) );
  NOR2B U933 ( .AN(n915), .B(n927), .Y(n926) );
  AOI21 U934 ( .A0(multiplier[3]), .A1(n914), .B0(n920), .Y(n927) );
  NAND2B U935 ( .AN(multiplier[2]), .B(n911), .Y(n915) );
  MX2 U936 ( .A(n906), .B(n909), .S0(multiplier[0]), .Y(n925) );
  NAND2 U937 ( .A(multiplier[3]), .B(n920), .Y(n916) );
  OAI211 U938 ( .A0(n928), .A1(n929), .B0(n930), .C0(n931), .Y(
        \u_level_disp/N43 ) );
  MX2 U939 ( .A(n932), .B(n933), .S0(n816), .Y(n931) );
  OAI2BB1 U940 ( .A0N(n934), .A1N(n930), .B0(n935), .Y(\u_level_disp/N39 ) );
  XOR2 U941 ( .A(level[3]), .B(n933), .Y(n935) );
  INV U942 ( .A(n928), .Y(n933) );
  OAI22 U943 ( .A0(n936), .A1(n929), .B0(level[0]), .B1(n928), .Y(
        \u_level_disp/N36 ) );
  NOR2B U944 ( .AN(n937), .B(level[1]), .Y(n936) );
  OAI211 U945 ( .A0(level[3]), .A1(n938), .B0(n939), .C0(n940), .Y(
        \u_level_disp/N33 ) );
  MX2 U946 ( .A(n941), .B(n942), .S0(level[0]), .Y(n940) );
  NOR2B U947 ( .AN(n930), .B(n928), .Y(n942) );
  NOR2B U948 ( .AN(n943), .B(n937), .Y(n928) );
  NAND2 U949 ( .A(level[1]), .B(level[2]), .Y(n941) );
  OAI21 U950 ( .A0(level[1]), .A1(n934), .B0(n944), .Y(\u_level_disp/N24 ) );
  MX2 U951 ( .A(n945), .B(level[2]), .S0(level[3]), .Y(n944) );
  NOR2 U952 ( .A(level[0]), .B(n930), .Y(n945) );
  OAI221 U953 ( .A0(level[3]), .A1(n946), .B0(n934), .B1(n939), .C0(n938), .Y(
        \u_level_disp/N21 ) );
  NOR2B U954 ( .AN(n947), .B(n937), .Y(n946) );
  XOR2 U955 ( .A(level[1]), .B(level[0]), .Y(n947) );
  OAI211 U956 ( .A0(level[2]), .A1(n939), .B0(n948), .C0(n949), .Y(
        \u_level_disp/N14 ) );
  NOR2B U957 ( .AN(n938), .B(n950), .Y(n949) );
  AOI21 U958 ( .A0(level[3]), .A1(n937), .B0(n943), .Y(n950) );
  NAND2B U959 ( .AN(level[2]), .B(n934), .Y(n938) );
  MX2 U960 ( .A(n929), .B(n932), .S0(level[0]), .Y(n948) );
  NAND2 U961 ( .A(level[3]), .B(n943), .Y(n939) );
  NOR4BB U962 ( .AN(n951), .BN(n808), .C(n953), .D(\u_interval_cnt/done ), .Y(
        \u_interval_cnt/N85 ) );
  NOR2B U963 ( .AN(\u_interval_cnt/N27 ), .B(n954), .Y(\u_interval_cnt/N79 )
         );
  NOR2B U964 ( .AN(\u_interval_cnt/N26 ), .B(n954), .Y(\u_interval_cnt/N78 )
         );
  NOR2B U965 ( .AN(\u_interval_cnt/N25 ), .B(n954), .Y(\u_interval_cnt/N77 )
         );
  NOR2B U966 ( .AN(\u_interval_cnt/N24 ), .B(n954), .Y(\u_interval_cnt/N76 )
         );
  NOR2B U967 ( .AN(\u_interval_cnt/N23 ), .B(n954), .Y(\u_interval_cnt/N75 )
         );
  NOR2B U968 ( .AN(\u_interval_cnt/N22 ), .B(n954), .Y(\u_interval_cnt/N74 )
         );
  NOR2B U969 ( .AN(\u_interval_cnt/N21 ), .B(n954), .Y(\u_interval_cnt/N73 )
         );
  NOR2B U970 ( .AN(\u_interval_cnt/N20 ), .B(n954), .Y(\u_interval_cnt/N72 )
         );
  NOR2B U971 ( .AN(\u_interval_cnt/N19 ), .B(n954), .Y(\u_interval_cnt/N71 )
         );
  NOR2B U972 ( .AN(\u_interval_cnt/N18 ), .B(n954), .Y(\u_interval_cnt/N70 )
         );
  NOR2B U973 ( .AN(\u_interval_cnt/N17 ), .B(n954), .Y(\u_interval_cnt/N69 )
         );
  NOR2B U974 ( .AN(\u_interval_cnt/N16 ), .B(n954), .Y(\u_interval_cnt/N68 )
         );
  NOR2B U975 ( .AN(\u_interval_cnt/N15 ), .B(n954), .Y(\u_interval_cnt/N67 )
         );
  NOR2B U976 ( .AN(\u_interval_cnt/N14 ), .B(n954), .Y(\u_interval_cnt/N66 )
         );
  NOR2 U977 ( .A(n954), .B(\u_interval_cnt/div_cnt[0] ), .Y(
        \u_interval_cnt/N65 ) );
  NAND2B U978 ( .AN(n955), .B(n953), .Y(n954) );
  INV U979 ( .A(n956), .Y(next_state[2]) );
  AOI2BB1 U980 ( .A0N(n957), .A1N(n958), .B0(n959), .Y(n956) );
  OAI32 U981 ( .A0(n960), .A1(n961), .A2(n962), .B0(n963), .B1(n964), .Y(n959)
         );
  AOI21 U982 ( .A0(n965), .A1(n822), .B0(game_over_led), .Y(n963) );
  INV U983 ( .A(n967), .Y(n960) );
  OAI21 U984 ( .A0(n964), .A1(n968), .B0(n957), .Y(next_state[1]) );
  NOR2B U985 ( .AN(n969), .B(n970), .Y(n968) );
  OAI221 U986 ( .A0(n957), .A1(n971), .B0(n967), .B1(n962), .C0(n972), .Y(
        next_state[0]) );
  MX2 U987 ( .A(n973), .B(n974), .S0(n964), .Y(n972) );
  AOI211 U988 ( .A0(us_done), .A1(n970), .B0(game_over_led), .C0(n822), .Y(
        n973) );
  INV U989 ( .A(n975), .Y(n962) );
  AND2 U990 ( .A(n976), .B(n977), .Y(n967) );
  NOR4BB U991 ( .AN(\u_us/selected_mask[3] ), .BN(\u_us/selected_mask[2] ), 
        .C(n978), .D(n979), .Y(n977) );
  NOR4BB U992 ( .AN(\u_us/selected_mask[7] ), .BN(\u_us/selected_mask[6] ), 
        .C(n980), .D(n981), .Y(n976) );
  AOI32 U993 ( .A0(n982), .A1(n969), .A2(n983), .B0(n975), .B1(n961), .Y(n957)
         );
  NOR4BB U994 ( .AN(n984), .BN(n985), .C(n986), .D(n987), .Y(n961) );
  OAI2BB1 U995 ( .A0N(n988), .A1N(mole_btns_db_d[5]), .B0(n989), .Y(n987) );
  AOI221 U996 ( .A0(n990), .A1(mole_btns_db_d[1]), .B0(n991), .B1(
        mole_btns_db_d[4]), .C0(n992), .Y(n984) );
  INV U997 ( .A(n993), .Y(n992) );
  AOI211 U998 ( .A0(mole_btns_db_d[0]), .A1(n994), .B0(ic_timeout), .C0(n995), 
        .Y(n993) );
  NOR2B U999 ( .AN(n996), .B(n964), .Y(n975) );
  NOR3B U1000 ( .AN(n997), .B(game_over_led), .C(n970), .Y(n982) );
  NOR3B U1001 ( .AN(n971), .B(n998), .C(state[2]), .Y(n970) );
  OAI2BB1 U1002 ( .A0N(n955), .A1N(time_interval[1]), .B0(n999), .Y(n1335) );
  INV U1003 ( .A(n1000), .Y(n999) );
  MX2 U1004 ( .A(n1001), .B(ic_count[1]), .S0(n1002), .Y(n1000) );
  NOR2B U1005 ( .AN(n1003), .B(n955), .Y(n1001) );
  INV U1006 ( .A(n1004), .Y(n1336) );
  OAI2BB2 U1007 ( .B0(n823), .B1(n1006), .A0N(N127), .A1N(n815), .Y(n1337) );
  INV U1008 ( .A(score_reg[15]), .Y(n1006) );
  OAI2BB2 U1009 ( .B0(n1008), .B1(n823), .A0N(N112), .A1N(n815), .Y(n1338) );
  INV U1010 ( .A(\u_score_disp/N106 ), .Y(n1008) );
  OAI2BB2 U1011 ( .B0(n1009), .B1(n823), .A0N(N113), .A1N(n815), .Y(n1339) );
  INV U1012 ( .A(score_reg[1]), .Y(n1009) );
  OAI2BB2 U1013 ( .B0(n1010), .B1(n823), .A0N(N114), .A1N(n815), .Y(n1340) );
  INV U1014 ( .A(score_reg[2]), .Y(n1010) );
  OAI2BB2 U1015 ( .B0(n1011), .B1(n823), .A0N(N115), .A1N(n815), .Y(n1341) );
  OAI2BB2 U1016 ( .B0(n1012), .B1(n823), .A0N(N116), .A1N(n815), .Y(n1342) );
  OAI2BB2 U1017 ( .B0(n1013), .B1(n823), .A0N(N117), .A1N(n815), .Y(n1343) );
  OAI2BB2 U1018 ( .B0(n1014), .B1(n823), .A0N(N118), .A1N(n815), .Y(n1344) );
  OAI2BB2 U1019 ( .B0(n1015), .B1(n823), .A0N(N119), .A1N(n815), .Y(n1345) );
  OAI2BB2 U1020 ( .B0(n1016), .B1(n823), .A0N(N120), .A1N(n815), .Y(n1346) );
  OAI2BB2 U1021 ( .B0(n1017), .B1(n823), .A0N(N121), .A1N(n815), .Y(n1347) );
  INV U1022 ( .A(score_reg[9]), .Y(n1017) );
  OAI2BB2 U1023 ( .B0(n1018), .B1(n823), .A0N(N122), .A1N(n815), .Y(n1348) );
  OAI2BB2 U1024 ( .B0(n1019), .B1(n823), .A0N(N123), .A1N(n815), .Y(n1349) );
  OAI2BB2 U1025 ( .B0(n1020), .B1(n823), .A0N(N124), .A1N(n815), .Y(n1350) );
  OAI2BB2 U1026 ( .B0(n1021), .B1(n823), .A0N(N125), .A1N(n815), .Y(n1351) );
  OAI2BB2 U1027 ( .B0(n823), .B1(n1022), .A0N(N126), .A1N(n815), .Y(n1352) );
  NOR2B U1028 ( .AN(n823), .B(n997), .Y(n1007) );
  OAI21 U1029 ( .A0(n1023), .A1(n997), .B0(n974), .Y(n1005) );
  INV U1030 ( .A(n996), .Y(n997) );
  NOR3B U1031 ( .AN(n958), .B(n971), .C(n998), .Y(n996) );
  NOR2B U1032 ( .AN(n1024), .B(n1025), .Y(n1023) );
  OAI221 U1033 ( .A0(n985), .A1(n1026), .B0(n989), .B1(n1027), .C0(n1028), .Y(
        n1025) );
  AOI33 U1034 ( .A0(mole_btns_db_d[0]), .A1(n994), .A2(mole1_led), .B0(
        mole_btns_db_d[1]), .B1(n990), .B2(mole2_led), .Y(n1028) );
  NAND2 U1035 ( .A(n1029), .B(mole_btns_db_d[3]), .Y(n989) );
  NAND2B U1036 ( .AN(mole_btns_db[2]), .B(mole_btns_db_d[2]), .Y(n985) );
  AOI221 U1037 ( .A0(n986), .A1(mole8_led), .B0(n995), .B1(mole7_led), .C0(
        n1030), .Y(n1024) );
  INV U1038 ( .A(n1031), .Y(n1030) );
  AOI33 U1039 ( .A0(mole_btns_db_d[4]), .A1(n991), .A2(mole5_led), .B0(
        mole_btns_db_d[5]), .B1(n988), .B2(mole6_led), .Y(n1031) );
  NOR2B U1040 ( .AN(mole_btns_db_d[6]), .B(mole_btns_db[6]), .Y(n995) );
  NOR2B U1041 ( .AN(mole_btns_db_d[7]), .B(mole_btns_db[7]), .Y(n986) );
  NAND2B U1042 ( .AN(n1032), .B(n974), .Y(n1353) );
  MX2 U1043 ( .A(n1033), .B(n983), .S0(time_interval[1]), .Y(n1032) );
  NOR2B U1044 ( .AN(n822), .B(n965), .Y(n1033) );
  OR2 U1045 ( .A(n1034), .B(\u_timer_disp/N36 ), .Y(timer_D) );
  OAI21 U1046 ( .A0(ic_count[0]), .A1(n842), .B0(n839), .Y(\u_timer_disp/N36 )
         );
  MX2 U1047 ( .A(ic_count[1]), .B(n1035), .S0(ic_count[2]), .Y(n1034) );
  NOR2B U1048 ( .AN(ic_count[0]), .B(ic_count[1]), .Y(n1035) );
  NAND2B U1049 ( .AN(n1003), .B(ic_count[2]), .Y(timer_B) );
  OAI21 U1050 ( .A0(ic_count[1]), .A1(ic_count[0]), .B0(n838), .Y(n1003) );
  NAND2B U1051 ( .AN(n842), .B(ic_count[0]), .Y(n838) );
  INV U1052 ( .A(ic_count[1]), .Y(n842) );
  NOR2B U1053 ( .AN(n1036), .B(n1037), .Y(n1358) );
  NOR2B U1054 ( .AN(n1036), .B(n1038), .Y(n1359) );
  NOR3 U1055 ( .A(n1039), .B(n1040), .C(n1041), .Y(n1036) );
  NOR2B U1056 ( .AN(n1042), .B(n1043), .Y(n1360) );
  NOR3 U1057 ( .A(n1041), .B(n1044), .C(n1045), .Y(n1361) );
  NOR3B U1058 ( .AN(n1046), .B(n1047), .C(n1048), .Y(n1376) );
  NOR2B U1059 ( .AN(n1049), .B(n1048), .Y(n1377) );
  OAI2BB2 U1060 ( .B0(n1050), .B1(n1051), .A0N(n1052), .A1N(n1053), .Y(n745)
         );
  AND4 U1061 ( .A(n1054), .B(n1055), .C(\db_start/shift_reg[15] ), .D(
        \db_start/shift_reg[1] ), .Y(n1053) );
  AND4 U1062 ( .A(\db_start/shift_reg[0] ), .B(\db_start/shift_reg[11] ), .C(
        \db_start/shift_reg[12] ), .D(\db_start/shift_reg[10] ), .Y(n1055) );
  AND2 U1063 ( .A(\db_start/shift_reg[13] ), .B(\db_start/shift_reg[14] ), .Y(
        n1054) );
  AND4 U1064 ( .A(n1056), .B(n1057), .C(\db_start/shift_reg[8] ), .D(
        \db_start/shift_reg[9] ), .Y(n1052) );
  AND4 U1065 ( .A(\db_start/shift_reg[2] ), .B(\db_start/shift_reg[4] ), .C(
        \db_start/shift_reg[5] ), .D(\db_start/shift_reg[3] ), .Y(n1057) );
  AND2 U1066 ( .A(\db_start/shift_reg[6] ), .B(\db_start/shift_reg[7] ), .Y(
        n1056) );
  INV U1067 ( .A(start_btn_db), .Y(n1051) );
  AND4 U1068 ( .A(n1058), .B(n1059), .C(n1060), .D(n1061), .Y(n1050) );
  NOR4 U1069 ( .A(\db_start/shift_reg[7] ), .B(\db_start/shift_reg[9] ), .C(
        \db_start/shift_reg[8] ), .D(\db_start/shift_reg[6] ), .Y(n1061) );
  NOR4 U1070 ( .A(\db_start/shift_reg[3] ), .B(\db_start/shift_reg[5] ), .C(
        \db_start/shift_reg[2] ), .D(\db_start/shift_reg[4] ), .Y(n1060) );
  NOR4 U1071 ( .A(\db_start/shift_reg[14] ), .B(\db_start/shift_reg[1] ), .C(
        \db_start/shift_reg[15] ), .D(\db_start/shift_reg[13] ), .Y(n1059) );
  NOR4 U1072 ( .A(\db_start/shift_reg[10] ), .B(\db_start/shift_reg[12] ), .C(
        \db_start/shift_reg[0] ), .D(\db_start/shift_reg[11] ), .Y(n1058) );
  OAI2BB2 U1073 ( .B0(n1062), .B1(n994), .A0N(n1063), .A1N(n1064), .Y(n744) );
  AND4 U1074 ( .A(n1065), .B(n1066), .C(\db_mole1/shift_reg[15] ), .D(
        \db_mole1/shift_reg[1] ), .Y(n1064) );
  AND4 U1075 ( .A(\db_mole1/shift_reg[0] ), .B(\db_mole1/shift_reg[11] ), .C(
        \db_mole1/shift_reg[12] ), .D(\db_mole1/shift_reg[10] ), .Y(n1066) );
  AND2 U1076 ( .A(\db_mole1/shift_reg[13] ), .B(\db_mole1/shift_reg[14] ), .Y(
        n1065) );
  AND4 U1077 ( .A(n1067), .B(n1068), .C(\db_mole1/shift_reg[8] ), .D(
        \db_mole1/shift_reg[9] ), .Y(n1063) );
  AND4 U1078 ( .A(\db_mole1/shift_reg[2] ), .B(\db_mole1/shift_reg[4] ), .C(
        \db_mole1/shift_reg[5] ), .D(\db_mole1/shift_reg[3] ), .Y(n1068) );
  AND2 U1079 ( .A(\db_mole1/shift_reg[6] ), .B(\db_mole1/shift_reg[7] ), .Y(
        n1067) );
  AND4 U1080 ( .A(n1069), .B(n1070), .C(n1071), .D(n1072), .Y(n1062) );
  NOR4 U1081 ( .A(\db_mole1/shift_reg[7] ), .B(\db_mole1/shift_reg[9] ), .C(
        \db_mole1/shift_reg[8] ), .D(\db_mole1/shift_reg[6] ), .Y(n1072) );
  NOR4 U1082 ( .A(\db_mole1/shift_reg[3] ), .B(\db_mole1/shift_reg[5] ), .C(
        \db_mole1/shift_reg[2] ), .D(\db_mole1/shift_reg[4] ), .Y(n1071) );
  NOR4 U1083 ( .A(\db_mole1/shift_reg[14] ), .B(\db_mole1/shift_reg[1] ), .C(
        \db_mole1/shift_reg[15] ), .D(\db_mole1/shift_reg[13] ), .Y(n1070) );
  NOR4 U1084 ( .A(\db_mole1/shift_reg[10] ), .B(\db_mole1/shift_reg[12] ), .C(
        \db_mole1/shift_reg[0] ), .D(\db_mole1/shift_reg[11] ), .Y(n1069) );
  OAI2BB2 U1085 ( .B0(n1073), .B1(n990), .A0N(n1074), .A1N(n1075), .Y(n743) );
  AND4 U1086 ( .A(n1076), .B(n1077), .C(\db_mole2/shift_reg[15] ), .D(
        \db_mole2/shift_reg[1] ), .Y(n1075) );
  AND4 U1087 ( .A(\db_mole2/shift_reg[0] ), .B(\db_mole2/shift_reg[11] ), .C(
        \db_mole2/shift_reg[12] ), .D(\db_mole2/shift_reg[10] ), .Y(n1077) );
  AND2 U1088 ( .A(\db_mole2/shift_reg[13] ), .B(\db_mole2/shift_reg[14] ), .Y(
        n1076) );
  AND4 U1089 ( .A(n1078), .B(n1079), .C(\db_mole2/shift_reg[8] ), .D(
        \db_mole2/shift_reg[9] ), .Y(n1074) );
  AND4 U1090 ( .A(\db_mole2/shift_reg[2] ), .B(\db_mole2/shift_reg[4] ), .C(
        \db_mole2/shift_reg[5] ), .D(\db_mole2/shift_reg[3] ), .Y(n1079) );
  AND2 U1091 ( .A(\db_mole2/shift_reg[6] ), .B(\db_mole2/shift_reg[7] ), .Y(
        n1078) );
  INV U1092 ( .A(mole_btns_db[1]), .Y(n990) );
  AND4 U1093 ( .A(n1080), .B(n1081), .C(n1082), .D(n1083), .Y(n1073) );
  NOR4 U1094 ( .A(\db_mole2/shift_reg[7] ), .B(\db_mole2/shift_reg[9] ), .C(
        \db_mole2/shift_reg[8] ), .D(\db_mole2/shift_reg[6] ), .Y(n1083) );
  NOR4 U1095 ( .A(\db_mole2/shift_reg[3] ), .B(\db_mole2/shift_reg[5] ), .C(
        \db_mole2/shift_reg[2] ), .D(\db_mole2/shift_reg[4] ), .Y(n1082) );
  NOR4 U1096 ( .A(\db_mole2/shift_reg[14] ), .B(\db_mole2/shift_reg[1] ), .C(
        \db_mole2/shift_reg[15] ), .D(\db_mole2/shift_reg[13] ), .Y(n1081) );
  NOR4 U1097 ( .A(\db_mole2/shift_reg[10] ), .B(\db_mole2/shift_reg[12] ), .C(
        \db_mole2/shift_reg[0] ), .D(\db_mole2/shift_reg[11] ), .Y(n1080) );
  OAI2BB2 U1098 ( .B0(n1084), .B1(n1085), .A0N(n1086), .A1N(n1087), .Y(n742)
         );
  AND4 U1099 ( .A(n1088), .B(n1089), .C(\db_mole3/shift_reg[15] ), .D(
        \db_mole3/shift_reg[1] ), .Y(n1087) );
  AND4 U1100 ( .A(\db_mole3/shift_reg[0] ), .B(\db_mole3/shift_reg[11] ), .C(
        \db_mole3/shift_reg[12] ), .D(\db_mole3/shift_reg[10] ), .Y(n1089) );
  AND2 U1101 ( .A(\db_mole3/shift_reg[13] ), .B(\db_mole3/shift_reg[14] ), .Y(
        n1088) );
  AND4 U1102 ( .A(n1090), .B(n1091), .C(\db_mole3/shift_reg[8] ), .D(
        \db_mole3/shift_reg[9] ), .Y(n1086) );
  AND4 U1103 ( .A(\db_mole3/shift_reg[2] ), .B(\db_mole3/shift_reg[4] ), .C(
        \db_mole3/shift_reg[5] ), .D(\db_mole3/shift_reg[3] ), .Y(n1091) );
  AND2 U1104 ( .A(\db_mole3/shift_reg[6] ), .B(\db_mole3/shift_reg[7] ), .Y(
        n1090) );
  AND4 U1105 ( .A(n1092), .B(n1093), .C(n1094), .D(n1095), .Y(n1084) );
  NOR4 U1106 ( .A(\db_mole3/shift_reg[7] ), .B(\db_mole3/shift_reg[9] ), .C(
        \db_mole3/shift_reg[8] ), .D(\db_mole3/shift_reg[6] ), .Y(n1095) );
  NOR4 U1107 ( .A(\db_mole3/shift_reg[3] ), .B(\db_mole3/shift_reg[5] ), .C(
        \db_mole3/shift_reg[2] ), .D(\db_mole3/shift_reg[4] ), .Y(n1094) );
  NOR4 U1108 ( .A(\db_mole3/shift_reg[14] ), .B(\db_mole3/shift_reg[1] ), .C(
        \db_mole3/shift_reg[15] ), .D(\db_mole3/shift_reg[13] ), .Y(n1093) );
  NOR4 U1109 ( .A(\db_mole3/shift_reg[10] ), .B(\db_mole3/shift_reg[12] ), .C(
        \db_mole3/shift_reg[0] ), .D(\db_mole3/shift_reg[11] ), .Y(n1092) );
  OAI2BB2 U1110 ( .B0(n1096), .B1(n1029), .A0N(n1097), .A1N(n1098), .Y(n741)
         );
  AND4 U1111 ( .A(n1099), .B(n1100), .C(\db_mole4/shift_reg[15] ), .D(
        \db_mole4/shift_reg[1] ), .Y(n1098) );
  AND4 U1112 ( .A(\db_mole4/shift_reg[0] ), .B(\db_mole4/shift_reg[11] ), .C(
        \db_mole4/shift_reg[12] ), .D(\db_mole4/shift_reg[10] ), .Y(n1100) );
  AND2 U1113 ( .A(\db_mole4/shift_reg[13] ), .B(\db_mole4/shift_reg[14] ), .Y(
        n1099) );
  AND4 U1114 ( .A(n1101), .B(n1102), .C(\db_mole4/shift_reg[8] ), .D(
        \db_mole4/shift_reg[9] ), .Y(n1097) );
  AND4 U1115 ( .A(\db_mole4/shift_reg[2] ), .B(\db_mole4/shift_reg[4] ), .C(
        \db_mole4/shift_reg[5] ), .D(\db_mole4/shift_reg[3] ), .Y(n1102) );
  AND2 U1116 ( .A(\db_mole4/shift_reg[6] ), .B(\db_mole4/shift_reg[7] ), .Y(
        n1101) );
  AND4 U1117 ( .A(n1103), .B(n1104), .C(n1105), .D(n1106), .Y(n1096) );
  NOR4 U1118 ( .A(\db_mole4/shift_reg[7] ), .B(\db_mole4/shift_reg[9] ), .C(
        \db_mole4/shift_reg[8] ), .D(\db_mole4/shift_reg[6] ), .Y(n1106) );
  NOR4 U1119 ( .A(\db_mole4/shift_reg[3] ), .B(\db_mole4/shift_reg[5] ), .C(
        \db_mole4/shift_reg[2] ), .D(\db_mole4/shift_reg[4] ), .Y(n1105) );
  NOR4 U1120 ( .A(\db_mole4/shift_reg[14] ), .B(\db_mole4/shift_reg[1] ), .C(
        \db_mole4/shift_reg[15] ), .D(\db_mole4/shift_reg[13] ), .Y(n1104) );
  NOR4 U1121 ( .A(\db_mole4/shift_reg[10] ), .B(\db_mole4/shift_reg[12] ), .C(
        \db_mole4/shift_reg[0] ), .D(\db_mole4/shift_reg[11] ), .Y(n1103) );
  OAI2BB2 U1122 ( .B0(n1107), .B1(n991), .A0N(n1108), .A1N(n1109), .Y(n740) );
  AND4 U1123 ( .A(n1110), .B(n1111), .C(\db_mole5/shift_reg[15] ), .D(
        \db_mole5/shift_reg[1] ), .Y(n1109) );
  AND4 U1124 ( .A(\db_mole5/shift_reg[0] ), .B(\db_mole5/shift_reg[11] ), .C(
        \db_mole5/shift_reg[12] ), .D(\db_mole5/shift_reg[10] ), .Y(n1111) );
  AND2 U1125 ( .A(\db_mole5/shift_reg[13] ), .B(\db_mole5/shift_reg[14] ), .Y(
        n1110) );
  AND4 U1126 ( .A(n1112), .B(n1113), .C(\db_mole5/shift_reg[8] ), .D(
        \db_mole5/shift_reg[9] ), .Y(n1108) );
  AND4 U1127 ( .A(\db_mole5/shift_reg[2] ), .B(\db_mole5/shift_reg[4] ), .C(
        \db_mole5/shift_reg[5] ), .D(\db_mole5/shift_reg[3] ), .Y(n1113) );
  AND2 U1128 ( .A(\db_mole5/shift_reg[6] ), .B(\db_mole5/shift_reg[7] ), .Y(
        n1112) );
  AND4 U1129 ( .A(n1114), .B(n1115), .C(n1116), .D(n1117), .Y(n1107) );
  NOR4 U1130 ( .A(\db_mole5/shift_reg[7] ), .B(\db_mole5/shift_reg[9] ), .C(
        \db_mole5/shift_reg[8] ), .D(\db_mole5/shift_reg[6] ), .Y(n1117) );
  NOR4 U1131 ( .A(\db_mole5/shift_reg[3] ), .B(\db_mole5/shift_reg[5] ), .C(
        \db_mole5/shift_reg[2] ), .D(\db_mole5/shift_reg[4] ), .Y(n1116) );
  NOR4 U1132 ( .A(\db_mole5/shift_reg[14] ), .B(\db_mole5/shift_reg[1] ), .C(
        \db_mole5/shift_reg[15] ), .D(\db_mole5/shift_reg[13] ), .Y(n1115) );
  NOR4 U1133 ( .A(\db_mole5/shift_reg[10] ), .B(\db_mole5/shift_reg[12] ), .C(
        \db_mole5/shift_reg[0] ), .D(\db_mole5/shift_reg[11] ), .Y(n1114) );
  OAI2BB2 U1134 ( .B0(n1118), .B1(n988), .A0N(n1119), .A1N(n1120), .Y(n739) );
  AND4 U1135 ( .A(n1121), .B(n1122), .C(\db_mole6/shift_reg[15] ), .D(
        \db_mole6/shift_reg[1] ), .Y(n1120) );
  AND4 U1136 ( .A(\db_mole6/shift_reg[0] ), .B(\db_mole6/shift_reg[11] ), .C(
        \db_mole6/shift_reg[12] ), .D(\db_mole6/shift_reg[10] ), .Y(n1122) );
  AND2 U1137 ( .A(\db_mole6/shift_reg[13] ), .B(\db_mole6/shift_reg[14] ), .Y(
        n1121) );
  AND4 U1138 ( .A(n1123), .B(n1124), .C(\db_mole6/shift_reg[8] ), .D(
        \db_mole6/shift_reg[9] ), .Y(n1119) );
  AND4 U1139 ( .A(\db_mole6/shift_reg[2] ), .B(\db_mole6/shift_reg[4] ), .C(
        \db_mole6/shift_reg[5] ), .D(\db_mole6/shift_reg[3] ), .Y(n1124) );
  AND2 U1140 ( .A(\db_mole6/shift_reg[6] ), .B(\db_mole6/shift_reg[7] ), .Y(
        n1123) );
  INV U1141 ( .A(mole_btns_db[5]), .Y(n988) );
  AND4 U1142 ( .A(n1125), .B(n1126), .C(n1127), .D(n1128), .Y(n1118) );
  NOR4 U1143 ( .A(\db_mole6/shift_reg[7] ), .B(\db_mole6/shift_reg[9] ), .C(
        \db_mole6/shift_reg[8] ), .D(\db_mole6/shift_reg[6] ), .Y(n1128) );
  NOR4 U1144 ( .A(\db_mole6/shift_reg[3] ), .B(\db_mole6/shift_reg[5] ), .C(
        \db_mole6/shift_reg[2] ), .D(\db_mole6/shift_reg[4] ), .Y(n1127) );
  NOR4 U1145 ( .A(\db_mole6/shift_reg[14] ), .B(\db_mole6/shift_reg[1] ), .C(
        \db_mole6/shift_reg[15] ), .D(\db_mole6/shift_reg[13] ), .Y(n1126) );
  NOR4 U1146 ( .A(\db_mole6/shift_reg[10] ), .B(\db_mole6/shift_reg[12] ), .C(
        \db_mole6/shift_reg[0] ), .D(\db_mole6/shift_reg[11] ), .Y(n1125) );
  OAI2BB2 U1147 ( .B0(n1129), .B1(n1130), .A0N(n1131), .A1N(n1132), .Y(n738)
         );
  AND4 U1148 ( .A(n1133), .B(n1134), .C(\db_mole7/shift_reg[15] ), .D(
        \db_mole7/shift_reg[1] ), .Y(n1132) );
  AND4 U1149 ( .A(\db_mole7/shift_reg[0] ), .B(\db_mole7/shift_reg[11] ), .C(
        \db_mole7/shift_reg[12] ), .D(\db_mole7/shift_reg[10] ), .Y(n1134) );
  AND2 U1150 ( .A(\db_mole7/shift_reg[13] ), .B(\db_mole7/shift_reg[14] ), .Y(
        n1133) );
  AND4 U1151 ( .A(n1135), .B(n1136), .C(\db_mole7/shift_reg[8] ), .D(
        \db_mole7/shift_reg[9] ), .Y(n1131) );
  AND4 U1152 ( .A(\db_mole7/shift_reg[2] ), .B(\db_mole7/shift_reg[4] ), .C(
        \db_mole7/shift_reg[5] ), .D(\db_mole7/shift_reg[3] ), .Y(n1136) );
  AND2 U1153 ( .A(\db_mole7/shift_reg[6] ), .B(\db_mole7/shift_reg[7] ), .Y(
        n1135) );
  AND4 U1154 ( .A(n1137), .B(n1138), .C(n1139), .D(n1140), .Y(n1129) );
  NOR4 U1155 ( .A(\db_mole7/shift_reg[7] ), .B(\db_mole7/shift_reg[9] ), .C(
        \db_mole7/shift_reg[8] ), .D(\db_mole7/shift_reg[6] ), .Y(n1140) );
  NOR4 U1156 ( .A(\db_mole7/shift_reg[3] ), .B(\db_mole7/shift_reg[5] ), .C(
        \db_mole7/shift_reg[2] ), .D(\db_mole7/shift_reg[4] ), .Y(n1139) );
  NOR4 U1157 ( .A(\db_mole7/shift_reg[14] ), .B(\db_mole7/shift_reg[1] ), .C(
        \db_mole7/shift_reg[15] ), .D(\db_mole7/shift_reg[13] ), .Y(n1138) );
  NOR4 U1158 ( .A(\db_mole7/shift_reg[10] ), .B(\db_mole7/shift_reg[12] ), .C(
        \db_mole7/shift_reg[0] ), .D(\db_mole7/shift_reg[11] ), .Y(n1137) );
  OAI2BB2 U1159 ( .B0(n1141), .B1(n1142), .A0N(n1143), .A1N(n1144), .Y(n737)
         );
  AND4 U1160 ( .A(n1145), .B(n1146), .C(\db_mole8/shift_reg[15] ), .D(
        \db_mole8/shift_reg[1] ), .Y(n1144) );
  AND4 U1161 ( .A(\db_mole8/shift_reg[0] ), .B(\db_mole8/shift_reg[11] ), .C(
        \db_mole8/shift_reg[12] ), .D(\db_mole8/shift_reg[10] ), .Y(n1146) );
  AND2 U1162 ( .A(\db_mole8/shift_reg[13] ), .B(\db_mole8/shift_reg[14] ), .Y(
        n1145) );
  AND4 U1163 ( .A(n1147), .B(n1148), .C(\db_mole8/shift_reg[8] ), .D(
        \db_mole8/shift_reg[9] ), .Y(n1143) );
  AND4 U1164 ( .A(\db_mole8/shift_reg[2] ), .B(\db_mole8/shift_reg[4] ), .C(
        \db_mole8/shift_reg[5] ), .D(\db_mole8/shift_reg[3] ), .Y(n1148) );
  AND2 U1165 ( .A(\db_mole8/shift_reg[6] ), .B(\db_mole8/shift_reg[7] ), .Y(
        n1147) );
  AND4 U1166 ( .A(n1149), .B(n1150), .C(n1151), .D(n1152), .Y(n1141) );
  NOR4 U1167 ( .A(\db_mole8/shift_reg[7] ), .B(\db_mole8/shift_reg[9] ), .C(
        \db_mole8/shift_reg[8] ), .D(\db_mole8/shift_reg[6] ), .Y(n1152) );
  NOR4 U1168 ( .A(\db_mole8/shift_reg[3] ), .B(\db_mole8/shift_reg[5] ), .C(
        \db_mole8/shift_reg[2] ), .D(\db_mole8/shift_reg[4] ), .Y(n1151) );
  NOR4 U1169 ( .A(\db_mole8/shift_reg[14] ), .B(\db_mole8/shift_reg[1] ), .C(
        \db_mole8/shift_reg[15] ), .D(\db_mole8/shift_reg[13] ), .Y(n1150) );
  NOR4 U1170 ( .A(\db_mole8/shift_reg[10] ), .B(\db_mole8/shift_reg[12] ), .C(
        \db_mole8/shift_reg[0] ), .D(\db_mole8/shift_reg[11] ), .Y(n1149) );
  NOR2B U1171 ( .AN(n1153), .B(\u_us/N40 ), .Y(n736) );
  INV U1172 ( .A(n1154), .Y(\u_us/N40 ) );
  OAI21 U1173 ( .A0(n964), .A1(n969), .B0(n1155), .Y(n1153) );
  NAND3B U1174 ( .AN(n971), .B(n998), .C(n958), .Y(n969) );
  NOR2B U1175 ( .AN(start_btn_db_d), .B(start_btn_db), .Y(n964) );
  OAI21 U1176 ( .A0(n1156), .A1(n965), .B0(n974), .Y(n734) );
  NOR2 U1177 ( .A(n983), .B(time_interval[1]), .Y(n1156) );
  NAND2B U1178 ( .AN(n1157), .B(n974), .Y(n733) );
  MX2 U1179 ( .A(n1158), .B(n1159), .S0(level[0]), .Y(n1157) );
  INV U1180 ( .A(n1160), .Y(n732) );
  MX2 U1181 ( .A(n1161), .B(n1162), .S0(level[1]), .Y(n1160) );
  OAI2BB2 U1182 ( .B0(n930), .B1(n1161), .A0N(level[2]), .A1N(n1163), .Y(n731)
         );
  NAND2 U1183 ( .A(level[1]), .B(n937), .Y(n930) );
  NAND2B U1184 ( .AN(n1164), .B(n974), .Y(n730) );
  MX2 U1185 ( .A(n1158), .B(n1159), .S0(multiplier[0]), .Y(n1164) );
  INV U1186 ( .A(n1165), .Y(n729) );
  MX2 U1187 ( .A(n1166), .B(n1167), .S0(multiplier[1]), .Y(n1165) );
  OAI2BB2 U1188 ( .B0(n907), .B1(n1166), .A0N(multiplier[2]), .A1N(n1168), .Y(
        n728) );
  NAND2 U1189 ( .A(multiplier[1]), .B(n914), .Y(n907) );
  MX2 U1190 ( .A(\u_us/N16 ), .B(rnd_out[0]), .S0(n1169), .Y(n727) );
  MX2 U1191 ( .A(\u_us/N16 ), .B(us_selected_number[0]), .S0(n1154), .Y(n726)
         );
  MX2 U1192 ( .A(n812), .B(rnd_out[1]), .S0(n1169), .Y(n725) );
  MX2 U1193 ( .A(n812), .B(us_selected_number[1]), .S0(n1154), .Y(n724) );
  MX2 U1194 ( .A(\u_us/N18 ), .B(rnd_out[2]), .S0(n1169), .Y(n723) );
  NOR2B U1195 ( .AN(\u_us/searching ), .B(n1004), .Y(n1169) );
  OAI21 U1196 ( .A0(state[0]), .A1(state[1]), .B0(rstn), .Y(n1004) );
  OAI2BB1 U1197 ( .A0N(n1154), .A1N(us_selected_number[2]), .B0(n1170), .Y(
        n722) );
  NOR2B U1198 ( .AN(n1171), .B(n1172), .Y(n1154) );
  OAI2BB2 U1199 ( .B0(n1173), .B1(n1174), .A0N(n1175), .A1N(
        \sll_307/ML_int[2][0] ), .Y(n721) );
  NOR2B U1200 ( .AN(n1354), .B(us_selected_number[1]), .Y(
        \sll_307/ML_int[2][0] ) );
  INV U1201 ( .A(us_selected_number[0]), .Y(n1354) );
  OAI2BB2 U1202 ( .B0(n1176), .B1(n1174), .A0N(n1175), .A1N(
        \sll_307/ML_int[2][1] ), .Y(n720) );
  NOR2B U1203 ( .AN(us_selected_number[0]), .B(us_selected_number[1]), .Y(
        \sll_307/ML_int[2][1] ) );
  INV U1204 ( .A(mole2_led), .Y(n1176) );
  OAI2BB2 U1205 ( .B0(n1026), .B1(n1174), .A0N(n791), .A1N(n1175), .Y(n719) );
  OAI2BB2 U1206 ( .B0(n1027), .B1(n1174), .A0N(n792), .A1N(n1175), .Y(n718) );
  NOR2B U1207 ( .AN(n1177), .B(us_selected_number[2]), .Y(n1175) );
  OAI2BB2 U1208 ( .B0(n1178), .B1(n1174), .A0N(n796), .A1N(n1177), .Y(n717) );
  OAI2BB2 U1209 ( .B0(n1179), .B1(n1174), .A0N(n797), .A1N(n1177), .Y(n716) );
  OAI2BB2 U1210 ( .B0(n1180), .B1(n1174), .A0N(n798), .A1N(n1177), .Y(n715) );
  OAI22 U1211 ( .A0(n1181), .A1(n841), .B0(n808), .B1(n965), .Y(n698) );
  INV U1212 ( .A(time_interval[2]), .Y(n965) );
  NOR2 U1213 ( .A(n1002), .B(n1182), .Y(n1181) );
  AOI2BB1 U1214 ( .A0N(ic_count[1]), .A1N(ic_count[0]), .B0(n955), .Y(n1182)
         );
  MX2 U1215 ( .A(n1183), .B(n1002), .S0(ic_count[0]), .Y(n697) );
  INV U1216 ( .A(n1184), .Y(n1002) );
  NOR2B U1217 ( .AN(n1184), .B(n955), .Y(n1183) );
  OAI31 U1218 ( .A0(n953), .A1(\u_interval_cnt/done ), .A2(n951), .B0(n952), 
        .Y(n1184) );
  INV U1219 ( .A(n1185), .Y(n953) );
  NOR2 U1220 ( .A(n955), .B(n1186), .Y(n695) );
  AOI21 U1221 ( .A0(n951), .A1(n1185), .B0(\u_interval_cnt/done ), .Y(n1186)
         );
  AND3 U1222 ( .A(n1187), .B(n1188), .C(n1189), .Y(n1185) );
  AND4 U1223 ( .A(\u_interval_cnt/div_cnt[7] ), .B(\u_interval_cnt/div_cnt[5] ), .C(\u_interval_cnt/div_cnt[8] ), .D(n1190), .Y(n1189) );
  AND4 U1224 ( .A(\u_interval_cnt/div_cnt[2] ), .B(\u_interval_cnt/div_cnt[1] ), .C(\u_interval_cnt/div_cnt[14] ), .D(\u_interval_cnt/div_cnt[13] ), .Y(n1190) );
  NOR4 U1225 ( .A(\u_interval_cnt/div_cnt[9] ), .B(\u_interval_cnt/div_cnt[6] ), .C(\u_interval_cnt/div_cnt[4] ), .D(\u_interval_cnt/div_cnt[3] ), .Y(n1188)
         );
  NOR4B U1226 ( .AN(\u_interval_cnt/div_cnt[0] ), .B(
        \u_interval_cnt/div_cnt[12] ), .C(\u_interval_cnt/div_cnt[11] ), .D(
        \u_interval_cnt/div_cnt[10] ), .Y(n1187) );
  NOR2 U1227 ( .A(ic_count[1]), .B(n839), .Y(n951) );
  NAND2 U1228 ( .A(n841), .B(n840), .Y(n839) );
  INV U1229 ( .A(ic_count[0]), .Y(n840) );
  INV U1230 ( .A(ic_count[2]), .Y(n841) );
  INV U1231 ( .A(n952), .Y(n955) );
  NOR4BB U1232 ( .AN(rstn), .BN(n974), .C(game_over_led), .D(us_done), .Y(n952) );
  OAI32 U1233 ( .A0(n1166), .A1(n920), .A2(n909), .B0(n1191), .B1(n906), .Y(
        n667) );
  AOI21 U1234 ( .A0(n914), .A1(n822), .B0(n1168), .Y(n1191) );
  OAI2BB1 U1235 ( .A0N(n920), .A1N(n822), .B0(n1167), .Y(n1168) );
  AOI21 U1236 ( .A0(n911), .A1(n822), .B0(n1159), .Y(n1167) );
  INV U1237 ( .A(multiplier[0]), .Y(n911) );
  INV U1238 ( .A(multiplier[2]), .Y(n914) );
  NAND2 U1239 ( .A(multiplier[2]), .B(n906), .Y(n909) );
  INV U1240 ( .A(multiplier[3]), .Y(n906) );
  INV U1241 ( .A(multiplier[1]), .Y(n920) );
  NAND2 U1242 ( .A(n810), .B(n1158), .Y(n1166) );
  OAI32 U1243 ( .A0(n1161), .A1(n943), .A2(n932), .B0(n1192), .B1(n929), .Y(
        n666) );
  AOI21 U1244 ( .A0(n937), .A1(n822), .B0(n1163), .Y(n1192) );
  OAI2BB1 U1245 ( .A0N(n943), .A1N(n822), .B0(n1162), .Y(n1163) );
  AOI21 U1246 ( .A0(n934), .A1(n822), .B0(n1159), .Y(n1162) );
  INV U1247 ( .A(level[0]), .Y(n934) );
  INV U1248 ( .A(level[2]), .Y(n937) );
  NAND2 U1249 ( .A(level[2]), .B(n929), .Y(n932) );
  INV U1250 ( .A(level[3]), .Y(n929) );
  INV U1251 ( .A(level[1]), .Y(n943) );
  NAND2 U1252 ( .A(level[0]), .B(n1158), .Y(n1161) );
  NOR2B U1253 ( .AN(n822), .B(n1159), .Y(n1158) );
  INV U1254 ( .A(n1193), .Y(n1159) );
  AOI2BB1 U1255 ( .A0N(time_interval[2]), .A1N(n1194), .B0(n983), .Y(n1193) );
  NOR2B U1256 ( .AN(n974), .B(n822), .Y(n983) );
  INV U1257 ( .A(n1194), .Y(n974) );
  NOR3B U1258 ( .AN(n971), .B(state[2]), .C(state[1]), .Y(n1194) );
  NOR3B U1259 ( .AN(state[2]), .B(state[1]), .C(state[0]), .Y(n966) );
  OAI2BB2 U1260 ( .B0(n1195), .B1(n1174), .A0N(n799), .A1N(n1177), .Y(n665) );
  OR2 U1261 ( .A(game_over_led), .B(n1177), .Y(n1174) );
  NOR2B U1262 ( .AN(us_done), .B(game_over_led), .Y(n1177) );
  INV U1263 ( .A(mole6_led), .Y(n1195) );
  INV U1264 ( .A(n1196), .Y(n663) );
  AOI31 U1265 ( .A0(n1172), .A1(\u_us/N16 ), .A2(n812), .B0(
        \u_us/selected_mask[7] ), .Y(n1196) );
  OAI31 U1266 ( .A0(n1171), .A1(n812), .A2(n819), .B0(n978), .Y(n662) );
  INV U1267 ( .A(\u_us/selected_mask[0] ), .Y(n978) );
  INV U1268 ( .A(n1197), .Y(n661) );
  AOI31 U1269 ( .A0(n1172), .A1(n1198), .A2(n812), .B0(\u_us/selected_mask[6] ), .Y(n1197) );
  OAI31 U1270 ( .A0(n1170), .A1(n812), .A2(n1198), .B0(n981), .Y(n660) );
  INV U1271 ( .A(\u_us/selected_mask[5] ), .Y(n981) );
  OAI31 U1272 ( .A0(n1170), .A1(n812), .A2(n819), .B0(n980), .Y(n659) );
  INV U1273 ( .A(\u_us/selected_mask[4] ), .Y(n980) );
  INV U1274 ( .A(n1172), .Y(n1170) );
  NOR3B U1275 ( .AN(\u_us/N18 ), .B(n751), .C(n1155), .Y(n1172) );
  INV U1276 ( .A(\u_us/searching ), .Y(n1155) );
  INV U1277 ( .A(n1199), .Y(n658) );
  AOI31 U1278 ( .A0(n1200), .A1(n819), .A2(n812), .B0(\u_us/selected_mask[3] ), 
        .Y(n1199) );
  INV U1279 ( .A(n1201), .Y(n657) );
  AOI31 U1280 ( .A0(n1200), .A1(n1198), .A2(n812), .B0(\u_us/selected_mask[2] ), .Y(n1201) );
  OAI31 U1281 ( .A0(n1171), .A1(n812), .A2(n1198), .B0(n979), .Y(n656) );
  INV U1282 ( .A(\u_us/selected_mask[1] ), .Y(n979) );
  INV U1283 ( .A(\u_us/N16 ), .Y(n1198) );
  INV U1284 ( .A(n1200), .Y(n1171) );
  NOR3B U1285 ( .AN(\u_us/searching ), .B(n754), .C(\u_us/N18 ), .Y(n1200) );
  XOR2 U1286 ( .A(\u_score_disp/digit_idx[0] ), .B(n903), .Y(n655) );
  INV U1287 ( .A(n1202), .Y(n903) );
  NAND2 U1288 ( .A(n889), .B(n1203), .Y(n654) );
  MX2 U1289 ( .A(n880), .B(n902), .S0(n1202), .Y(n1203) );
  AND2 U1290 ( .A(n1204), .B(n1205), .Y(n1202) );
  NOR4B U1291 ( .AN(n1206), .B(\u_score_disp/scan_cnt[13] ), .C(
        \u_score_disp/scan_cnt[11] ), .D(\u_score_disp/scan_cnt[12] ), .Y(
        n1205) );
  AOI31 U1292 ( .A0(\u_score_disp/scan_cnt[5] ), .A1(
        \u_score_disp/scan_cnt[4] ), .A2(n1207), .B0(
        \u_score_disp/scan_cnt[10] ), .Y(n1206) );
  NOR2B U1293 ( .AN(\u_score_disp/scan_cnt[3] ), .B(n1208), .Y(n1207) );
  OAI21 U1294 ( .A0(\u_score_disp/scan_cnt[0] ), .A1(
        \u_score_disp/scan_cnt[1] ), .B0(\u_score_disp/scan_cnt[2] ), .Y(n1208) );
  NOR4B U1295 ( .AN(n1209), .B(\u_score_disp/scan_cnt[6] ), .C(
        \u_score_disp/scan_cnt[14] ), .D(\u_score_disp/scan_cnt[15] ), .Y(
        n1204) );
  NOR3 U1296 ( .A(\u_score_disp/scan_cnt[7] ), .B(\u_score_disp/scan_cnt[9] ), 
        .C(\u_score_disp/scan_cnt[8] ), .Y(n1209) );
  INV U1297 ( .A(\u_score_disp/digit_idx[1] ), .Y(n902) );
  INV U1298 ( .A(score_sel1), .Y(n880) );
  NOR2B U1299 ( .AN(\u_score_disp/digit_idx[0] ), .B(
        \u_score_disp/digit_idx[1] ), .Y(score_sel1) );
  INV U1300 ( .A(score_sel2), .Y(n889) );
  NOR2B U1301 ( .AN(\u_score_disp/digit_idx[1] ), .B(
        \u_score_disp/digit_idx[0] ), .Y(score_sel2) );
  XOR2 U1302 ( .A(n893), .B(n1357), .Y(n642) );
  INV U1303 ( .A(n898), .Y(n1357) );
  OAI221 U1304 ( .A0(n1210), .A1(n1211), .B0(n1212), .B1(n887), .C0(n1213), 
        .Y(n898) );
  AOI21 U1305 ( .A0(n1214), .A1(n1215), .B0(n1216), .Y(n1213) );
  OAI2BB1 U1306 ( .A0N(n1217), .A1N(n1218), .B0(n1219), .Y(n1214) );
  AOI2BB2 U1307 ( .B0(n1215), .B1(n1220), .A0N(n1221), .A1N(n1222), .Y(n1212)
         );
  AOI32 U1308 ( .A0(n1223), .A1(n1224), .A2(n1225), .B0(n1226), .B1(n1227), 
        .Y(n1222) );
  OAI2BB1 U1309 ( .A0N(n1217), .A1N(\u_score_disp/rem2[3] ), .B0(n1228), .Y(
        n1226) );
  INV U1310 ( .A(n1229), .Y(n1217) );
  NAND2 U1311 ( .A(n1229), .B(n1230), .Y(n1223) );
  NOR2 U1312 ( .A(n817), .B(n811), .Y(n1229) );
  OAI2BB1 U1313 ( .A0N(n811), .A1N(n817), .B0(n1230), .Y(n1220) );
  AOI31 U1314 ( .A0(n1218), .A1(n817), .A2(n811), .B0(n1224), .Y(n1210) );
  NOR3B U1315 ( .AN(score_reg[1]), .B(n877), .C(n878), .Y(
        \u_score_disp/rem2[1] ) );
  NOR2B U1316 ( .AN(n803), .B(n1232), .Y(n877) );
  NOR2B U1317 ( .AN(n1211), .B(n887), .Y(n893) );
  INV U1318 ( .A(n901), .Y(n887) );
  NOR3B U1319 ( .AN(n1046), .B(n1233), .C(n1234), .Y(n618) );
  NOR3B U1320 ( .AN(n1235), .B(n1048), .C(n1236), .Y(n616) );
  NOR3B U1321 ( .AN(n1046), .B(n1237), .C(n1238), .Y(n613) );
  NOR2 U1322 ( .A(n1239), .B(n1236), .Y(n1046) );
  NOR4B U1323 ( .AN(n1049), .B(n1240), .C(n1239), .D(n1047), .Y(n438) );
  NOR4B U1324 ( .AN(n1241), .B(n1237), .C(n1238), .D(n1047), .Y(n434) );
  NOR2B U1325 ( .AN(n1235), .B(n1242), .Y(n1241) );
  NOR3B U1326 ( .AN(n1042), .B(n1037), .C(n1038), .Y(n423) );
  NOR3B U1327 ( .AN(n1243), .B(n1039), .C(n1038), .Y(n418) );
  NOR3B U1328 ( .AN(n1243), .B(n1040), .C(n1045), .Y(n415) );
  OAI21 U1329 ( .A0(n1244), .A1(n1221), .B0(n901), .Y(n272) );
  AOI2BB1 U1330 ( .A0N(n1245), .A1N(n1228), .B0(n1216), .Y(n901) );
  AOI21 U1331 ( .A0(n1246), .A1(n1247), .B0(n803), .Y(n1216) );
  NOR4B U1332 ( .AN(n1248), .B(\u_score_disp/N381 ), .C(\u_score_disp/N380 ), 
        .D(\u_score_disp/N382 ), .Y(n1247) );
  NOR2 U1333 ( .A(\u_score_disp/N384 ), .B(\u_score_disp/N383 ), .Y(n1248) );
  NOR4 U1334 ( .A(\u_score_disp/N379 ), .B(\u_score_disp/N378 ), .C(
        \u_score_disp/N377 ), .D(\u_score_disp/N376 ), .Y(n1246) );
  NOR2B U1335 ( .AN(n1219), .B(n1225), .Y(n1228) );
  OAI2BB1 U1336 ( .A0N(n817), .A1N(n1218), .B0(n1245), .Y(n1221) );
  NOR2 U1337 ( .A(n1227), .B(n1211), .Y(n1244) );
  OAI21 U1338 ( .A0(n1219), .A1(n1249), .B0(n1245), .Y(n1211) );
  INV U1339 ( .A(n1215), .Y(n1245) );
  OAI2BB2 U1340 ( .B0(n1250), .B1(n1251), .A0N(\u_score_disp/N375 ), .A1N(n802), .Y(n1215) );
  NOR2 U1341 ( .A(\u_score_disp/rem2[3] ), .B(n1225), .Y(n1249) );
  INV U1342 ( .A(n1224), .Y(n1219) );
  AOI211 U1343 ( .A0(n817), .A1(n1225), .B0(n1218), .C0(n1224), .Y(n1227) );
  OAI2BB2 U1344 ( .B0(n1252), .B1(n1251), .A0N(\u_score_disp/N374 ), .A1N(n802), .Y(n1224) );
  NOR2B U1345 ( .AN(n1225), .B(n1230), .Y(n1218) );
  INV U1346 ( .A(\u_score_disp/rem2[3] ), .Y(n1230) );
  OAI2BB2 U1347 ( .B0(n1253), .B1(n1251), .A0N(\u_score_disp/N372 ), .A1N(n802), .Y(\u_score_disp/rem2[3] ) );
  OAI2BB2 U1348 ( .B0(n1254), .B1(n1251), .A0N(\u_score_disp/N373 ), .A1N(n802), .Y(n1225) );
  OAI2BB2 U1349 ( .B0(n1255), .B1(n1251), .A0N(\u_score_disp/N371 ), .A1N(n802), .Y(\u_score_disp/rem2[2] ) );
  NOR4BB U1350 ( .AN(n424), .BN(n1243), .C(n1038), .D(n1041), .Y(n1231) );
  NOR3B U1351 ( .AN(n874), .B(n896), .C(n820), .Y(n1041) );
  NOR2B U1352 ( .AN(n820), .B(n874), .Y(n1038) );
  NOR2 U1353 ( .A(n1043), .B(n1037), .Y(n1243) );
  NOR2B U1354 ( .AN(n820), .B(n1256), .Y(n1037) );
  NOR2B U1355 ( .AN(n1257), .B(n896), .Y(n1043) );
  NOR3B U1356 ( .AN(n1042), .B(n1039), .C(n1045), .Y(n424) );
  NOR3B U1357 ( .AN(n1256), .B(n1257), .C(n1258), .Y(n1045) );
  NOR3B U1358 ( .AN(n874), .B(n1257), .C(n1258), .Y(n1039) );
  NOR2 U1359 ( .A(n1044), .B(n1040), .Y(n1042) );
  NOR3B U1360 ( .AN(n896), .B(n1256), .C(n888), .Y(n1040) );
  NOR3B U1361 ( .AN(n1256), .B(n1258), .C(n888), .Y(n1044) );
  INV U1362 ( .A(n896), .Y(n1258) );
  INV U1363 ( .A(n874), .Y(n1256) );
  INV U1364 ( .A(n1232), .Y(n1251) );
  NOR4B U1365 ( .AN(n888), .B(n820), .C(n896), .D(n874), .Y(n1232) );
  OAI211 U1366 ( .A0(n1259), .A1(n820), .B0(n1260), .C0(n1261), .Y(n874) );
  AOI32 U1367 ( .A0(n1262), .A1(n1369), .A2(n1263), .B0(n1264), .B1(n1265), 
        .Y(n1261) );
  AOI31 U1368 ( .A0(n1255), .A1(n1250), .A2(n1266), .B0(n1267), .Y(n1264) );
  OAI21 U1369 ( .A0(n1252), .A1(n1268), .B0(n1269), .Y(n1262) );
  AOI21 U1370 ( .A0(n1375), .A1(n1374), .B0(n1373), .Y(n1268) );
  AOI2BB2 U1371 ( .B0(n1270), .B1(n1368), .A0N(n1271), .A1N(n1272), .Y(n1259)
         );
  AOI221 U1372 ( .A0(n1273), .A1(n1274), .B0(n1275), .B1(n1276), .C0(n1368), 
        .Y(n1272) );
  NOR3B U1373 ( .AN(n1371), .B(n1252), .C(n1254), .Y(n1276) );
  NOR2B U1374 ( .AN(n1265), .B(n1277), .Y(n1275) );
  OAI31 U1375 ( .A0(n1278), .A1(n1252), .A2(n1250), .B0(n1279), .Y(n1274) );
  NOR2B U1376 ( .AN(n1277), .B(n1373), .Y(n1278) );
  NOR2B U1377 ( .AN(n1255), .B(n1374), .Y(n1277) );
  OAI21 U1378 ( .A0(n1279), .A1(n1280), .B0(n1281), .Y(n1270) );
  AOI31 U1379 ( .A0(n1372), .A1(n1374), .A2(n1282), .B0(n1371), .Y(n1280) );
  NOR2B U1380 ( .AN(n1373), .B(n1255), .Y(n1282) );
  INV U1381 ( .A(n1254), .Y(n1373) );
  AOI2BB1 U1382 ( .A0N(n1271), .A1N(n1283), .B0(n820), .Y(n896) );
  NOR2B U1383 ( .AN(n1263), .B(n1273), .Y(n1283) );
  AOI31 U1384 ( .A0(n1284), .A1(n1370), .A2(n1371), .B0(n1369), .Y(n1273) );
  INV U1385 ( .A(n1281), .Y(n1369) );
  INV U1386 ( .A(n1266), .Y(n1284) );
  NOR2B U1387 ( .AN(n1253), .B(n1285), .Y(n1266) );
  AOI31 U1388 ( .A0(n1286), .A1(n1281), .A2(n1279), .B0(n1267), .Y(n1271) );
  OAI211 U1389 ( .A0(n1374), .A1(n1372), .B0(n1371), .C0(n1285), .Y(n1286) );
  INV U1390 ( .A(n1253), .Y(n1374) );
  AOI22 U1391 ( .A0(score_reg[3]), .A1(n807), .B0(\u_score_disp/N109 ), .B1(
        n1288), .Y(n1253) );
  INV U1392 ( .A(n1257), .Y(n888) );
  NOR2 U1393 ( .A(n820), .B(n1263), .Y(n1257) );
  AOI21 U1394 ( .A0(n1289), .A1(n1265), .B0(n1368), .Y(n1263) );
  INV U1395 ( .A(n1267), .Y(n1368) );
  NOR2B U1396 ( .AN(n1370), .B(n1281), .Y(n1265) );
  INV U1397 ( .A(n1279), .Y(n1370) );
  NAND2B U1398 ( .AN(n1285), .B(n1250), .Y(n1289) );
  NAND2 U1399 ( .A(n1254), .B(n1252), .Y(n1285) );
  AOI22 U1400 ( .A0(score_reg[4]), .A1(n807), .B0(\u_score_disp/N110 ), .B1(
        n1288), .Y(n1254) );
  OAI31 U1401 ( .A0(n1290), .A1(n1267), .A2(n1281), .B0(n1260), .Y(n883) );
  NOR4B U1402 ( .AN(n1291), .B(n1362), .C(n1363), .D(n1364), .Y(n1260) );
  NOR2B U1403 ( .AN(\u_score_disp/N119 ), .B(n821), .Y(n1364) );
  NOR2B U1404 ( .AN(\u_score_disp/N120 ), .B(n821), .Y(n1363) );
  NOR2B U1405 ( .AN(\u_score_disp/N121 ), .B(n821), .Y(n1362) );
  NOR3 U1406 ( .A(n1367), .B(n1365), .C(n1366), .Y(n1291) );
  NOR2B U1407 ( .AN(\u_score_disp/N117 ), .B(n821), .Y(n1366) );
  NOR2B U1408 ( .AN(\u_score_disp/N118 ), .B(n821), .Y(n1365) );
  NOR2B U1409 ( .AN(\u_score_disp/N116 ), .B(n821), .Y(n1367) );
  AOI22 U1410 ( .A0(score_reg[8]), .A1(n807), .B0(\u_score_disp/N114 ), .B1(
        n1288), .Y(n1281) );
  AOI22 U1411 ( .A0(score_reg[9]), .A1(n807), .B0(\u_score_disp/N115 ), .B1(
        n1288), .Y(n1267) );
  NOR2B U1412 ( .AN(n1269), .B(n1372), .Y(n1290) );
  INV U1413 ( .A(n1252), .Y(n1372) );
  AOI22 U1414 ( .A0(score_reg[5]), .A1(n807), .B0(\u_score_disp/N111 ), .B1(
        n1288), .Y(n1252) );
  NOR2B U1415 ( .AN(n1279), .B(n1371), .Y(n1269) );
  INV U1416 ( .A(n1250), .Y(n1371) );
  AOI22 U1417 ( .A0(score_reg[6]), .A1(n807), .B0(\u_score_disp/N112 ), .B1(
        n1288), .Y(n1250) );
  AOI22 U1418 ( .A0(score_reg[7]), .A1(n807), .B0(\u_score_disp/N113 ), .B1(
        n1288), .Y(n1279) );
  INV U1419 ( .A(n1292), .Y(n1288) );
  INV U1420 ( .A(n1375), .Y(n1255) );
  NOR2B U1421 ( .AN(score_reg[2]), .B(n878), .Y(n1375) );
  NOR2B U1422 ( .AN(n1292), .B(n807), .Y(n878) );
  NOR2B U1423 ( .AN(n1293), .B(n809), .Y(n1287) );
  NOR4BB U1424 ( .AN(n440), .BN(n1235), .C(n1048), .D(n1239), .Y(n1292) );
  NOR3B U1425 ( .AN(n890), .B(n875), .C(n894), .Y(n1239) );
  OR2 U1426 ( .A(n1233), .B(n1237), .Y(n1048) );
  NOR3B U1427 ( .AN(n1294), .B(n1295), .C(n890), .Y(n1237) );
  NOR2B U1428 ( .AN(n1295), .B(n818), .Y(n1233) );
  INV U1429 ( .A(n1240), .Y(n1235) );
  NOR3B U1430 ( .AN(n875), .B(n1294), .C(n890), .Y(n1240) );
  NOR4BB U1431 ( .AN(n1049), .BN(n1378), .C(n1047), .D(n1236), .Y(n440) );
  NOR3B U1432 ( .AN(n1294), .B(n875), .C(n890), .Y(n1236) );
  NOR2B U1433 ( .AN(n1293), .B(n1295), .Y(n1047) );
  NOR3B U1434 ( .AN(n890), .B(n1294), .C(n884), .Y(n1293) );
  INV U1435 ( .A(n1242), .Y(n1378) );
  NOR2B U1436 ( .AN(n875), .B(n818), .Y(n1242) );
  NOR2 U1437 ( .A(n1238), .B(n1234), .Y(n1049) );
  NOR3B U1438 ( .AN(n894), .B(n875), .C(n890), .Y(n1234) );
  NOR3B U1439 ( .AN(n890), .B(n1295), .C(n894), .Y(n1238) );
  INV U1440 ( .A(n1294), .Y(n894) );
  AOI21 U1441 ( .A0(n1297), .A1(n1298), .B0(n884), .Y(n1294) );
  NAND2B U1442 ( .AN(n1299), .B(n1300), .Y(n1298) );
  INV U1443 ( .A(n875), .Y(n1295) );
  OAI221 U1444 ( .A0(n1299), .A1(n1301), .B0(n1302), .B1(n884), .C0(n1303), 
        .Y(n875) );
  NOR3B U1445 ( .AN(n1022), .B(score_reg[15]), .C(n1304), .Y(n1303) );
  AOI2BB1 U1446 ( .A0N(n1305), .A1N(n1306), .B0(n1021), .Y(n1304) );
  OAI31 U1447 ( .A0(n1013), .A1(n1307), .A2(n1308), .B0(n1309), .Y(n1306) );
  INV U1448 ( .A(score_reg[14]), .Y(n1022) );
  INV U1449 ( .A(n1296), .Y(n884) );
  AOI32 U1450 ( .A0(score_reg[11]), .A1(n1310), .A2(score_reg[12]), .B0(n1311), 
        .B1(n1297), .Y(n1302) );
  OAI2BB1 U1451 ( .A0N(n1019), .A1N(n1312), .B0(score_reg[12]), .Y(n1297) );
  OAI21 U1452 ( .A0(n1313), .A1(n1314), .B0(score_reg[10]), .Y(n1312) );
  NOR4BB U1453 ( .AN(score_reg[5]), .BN(score_reg[4]), .C(n1308), .D(n1014), 
        .Y(n1313) );
  OAI22 U1454 ( .A0(n1315), .A1(n1020), .B0(n1316), .B1(n1300), .Y(n1311) );
  OAI31 U1455 ( .A0(n1317), .A1(n1318), .A2(n1018), .B0(n1319), .Y(n1300) );
  NOR2B U1456 ( .AN(n1019), .B(score_reg[12]), .Y(n1319) );
  INV U1457 ( .A(n1320), .Y(n1316) );
  OAI31 U1458 ( .A0(n1013), .A1(n1307), .A2(n1317), .B0(n1309), .Y(n1320) );
  NOR3B U1459 ( .AN(n1019), .B(score_reg[12]), .C(score_reg[10]), .Y(n1309) );
  INV U1460 ( .A(n1321), .Y(n1317) );
  INV U1461 ( .A(score_reg[5]), .Y(n1013) );
  NOR2B U1462 ( .AN(n1018), .B(n1322), .Y(n1315) );
  AOI21 U1463 ( .A0(n1307), .A1(n1323), .B0(n1324), .Y(n1322) );
  NOR2B U1464 ( .AN(n1012), .B(score_reg[3]), .Y(n1307) );
  OAI2BB1 U1465 ( .A0N(n1325), .A1N(n1326), .B0(n1018), .Y(n1310) );
  OAI31 U1466 ( .A0(n1014), .A1(n1318), .A2(n1327), .B0(n1015), .Y(n1326) );
  NOR2B U1467 ( .AN(n1011), .B(score_reg[5]), .Y(n1327) );
  INV U1468 ( .A(score_reg[3]), .Y(n1011) );
  NOR2B U1469 ( .AN(n1012), .B(score_reg[5]), .Y(n1318) );
  OAI31 U1470 ( .A0(n1328), .A1(score_reg[10]), .A2(n1321), .B0(score_reg[11]), 
        .Y(n1301) );
  NOR2B U1471 ( .AN(n1314), .B(n1014), .Y(n1321) );
  NOR4BB U1472 ( .AN(score_reg[3]), .BN(score_reg[5]), .C(n1324), .D(n1012), 
        .Y(n1328) );
  INV U1473 ( .A(score_reg[4]), .Y(n1012) );
  NAND2 U1474 ( .A(n1296), .B(n1299), .Y(n890) );
  OAI31 U1475 ( .A0(n1329), .A1(n1323), .A2(n1018), .B0(n1020), .Y(n1299) );
  INV U1476 ( .A(score_reg[10]), .Y(n1018) );
  NOR2B U1477 ( .AN(n1014), .B(score_reg[5]), .Y(n1323) );
  NAND2 U1478 ( .A(score_reg[11]), .B(n1314), .Y(n1329) );
  NOR4B U1479 ( .AN(n1021), .B(score_reg[15]), .C(score_reg[14]), .D(n1330), 
        .Y(n1296) );
  NOR4BB U1480 ( .AN(score_reg[10]), .BN(n1305), .C(n1019), .D(n1020), .Y(
        n1330) );
  INV U1481 ( .A(score_reg[12]), .Y(n1020) );
  INV U1482 ( .A(score_reg[11]), .Y(n1019) );
  OAI21 U1483 ( .A0(n1308), .A1(n1014), .B0(n1324), .Y(n1305) );
  INV U1484 ( .A(n1314), .Y(n1324) );
  NOR2B U1485 ( .AN(n1325), .B(n1015), .Y(n1314) );
  INV U1486 ( .A(score_reg[7]), .Y(n1015) );
  INV U1487 ( .A(score_reg[6]), .Y(n1014) );
  INV U1488 ( .A(n1325), .Y(n1308) );
  NOR2B U1489 ( .AN(score_reg[9]), .B(n1016), .Y(n1325) );
  INV U1490 ( .A(score_reg[8]), .Y(n1016) );
  INV U1491 ( .A(score_reg[13]), .Y(n1021) );
  OR2 U1492 ( .A(n1331), .B(n1332), .Y(hit_led) );
  OAI221 U1493 ( .A0(n1179), .A1(n1130), .B0(n1180), .B1(n1142), .C0(n1333), 
        .Y(n1332) );
  AOI2BB2 U1494 ( .B0(mole_btns_db[5]), .B1(mole6_led), .A0N(n991), .A1N(n1178), .Y(n1333) );
  INV U1495 ( .A(mole5_led), .Y(n1178) );
  INV U1496 ( .A(mole_btns_db[4]), .Y(n991) );
  INV U1497 ( .A(mole_btns_db[7]), .Y(n1142) );
  INV U1498 ( .A(mole8_led), .Y(n1180) );
  INV U1499 ( .A(mole_btns_db[6]), .Y(n1130) );
  INV U1500 ( .A(mole7_led), .Y(n1179) );
  OAI221 U1501 ( .A0(n1026), .A1(n1085), .B0(n1027), .B1(n1029), .C0(n1334), 
        .Y(n1331) );
  AOI2BB2 U1502 ( .B0(mole_btns_db[1]), .B1(mole2_led), .A0N(n994), .A1N(n1173), .Y(n1334) );
  INV U1503 ( .A(mole1_led), .Y(n1173) );
  INV U1504 ( .A(mole_btns_db[0]), .Y(n994) );
  INV U1505 ( .A(mole_btns_db[3]), .Y(n1029) );
  INV U1506 ( .A(mole4_led), .Y(n1027) );
  INV U1507 ( .A(mole_btns_db[2]), .Y(n1085) );
  INV U1508 ( .A(mole3_led), .Y(n1026) );
  NOR3B U1509 ( .AN(n998), .B(n958), .C(n971), .Y(n1379) );
  INV U1510 ( .A(state[0]), .Y(n971) );
  INV U1511 ( .A(state[2]), .Y(n958) );
  INV U1512 ( .A(state[1]), .Y(n998) );
endmodule

