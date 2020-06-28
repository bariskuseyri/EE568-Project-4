// BEGIN ANSOFT HEADER
//         Left: A B C N
//        Right: ROT1 ROT2 Pos

// A           : Phase A
// B           : Phase B
// C           : Phase C
// N           : Neutral
// ROT1        : Mechanical plus
// ROT2        : Mechanical minus
// Pos         : Position
// END ANSOFT HEADER

MODELDEF Setup1
{
PORT electrical: A;
PORT electrical: B;
PORT electrical: C;
PORT electrical: N;
PORT ROTATIONAL_V: ROT1;
PORT ROTATIONAL_V: ROT2;
PORT REAL OUT ANGLE[deg]: Pos = VM_Pos.V;
PORT REAL IN ANGLE[deg]: IniPos = 0;

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=0.0178793 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=0.0178793 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=0.0178793 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.00512048, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.00512048, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.00512048, I0:=0 ); 
UMODEL Transformation_3To2 AB0 NAP:=N0_4, NAN:=N, NBP:=N0_5, NBN:=N, NCP:=N0_6, NCN:=N, NALPHA:=alpha, NBETA:=beta, NZERO:=zero () SRC: DLL( File:="Transformation.dll");

INTERN  EV       Speed  N1:=NM_1, N2:=GND  ( QUANT:=Torq.V, FACT:=1 ); 
INTERN  II       Torq  N1:=NM_6, N2:=NM_5  ( QUANT:=Speed.I, FACT:=1 ); 
UMODEL D2D D2D1 N1:=NM_5, N2:=ROT1 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
UMODEL D2D D2D2 N1:=NM_6, N2:=ROT2 ( NATURE_1:="electrical", NATURE_2:="Rotational_V" ) SRC: DLL( File:="Domains.dll");
INTERN  VM       VM_Pos  N1:=NM_2, N2:=GND  ; 
MODEL Setup1_AB0 model1 N_1:=alpha, N_2:=beta, N_3:=zero, N_4:=NM_1, N_5:=NM_2 ( pos0:=IniPos );


// BEGIN ANSOFT HEADER
//         Left: N_1 N_2 N_3
//        Right: N_4 N_5
// END ANSOFT HEADER

MODELDEF Setup1_AB0
{
PORT electrical: N_1;
PORT electrical: N_4;
PORT electrical: N_2;
PORT electrical: N_5;
PORT electrical: N_3;
PORT REAL IN: pos0 = 0;

INTERN  AM       VR1a  N1:=N_1, N2:=N_17  ; 
INTERN  E        BEma  N1:=N_19, N2:=N_17  ( EMF:=N_4.V * N_10.V, PARTDERIV:=1 ); 
INTERN  E        BVa  N1:=N_21, N2:=N_19  ( EMF:=N_23.V*cos(N_8.V) + N_24.V*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIa  N1:=N_21, N2:=GND  ; 
INTERN  VM       VM_Ea  N1:=N_17, N2:=GND  ; 
INTERN  AM       VR1b  N1:=N_2, N2:=N_18  ; 
INTERN  E        BEmb  N1:=N_20, N2:=N_18  ( EMF:=N_4.V * N_11.V, PARTDERIV:=1 ); 
INTERN  E        BVb  N1:=N_22, N2:=N_20  ( EMF:=N_23.V*sin(N_8.V) - N_24.V*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VIb  N1:=N_22, N2:=GND  ; 
INTERN  VM       VM_Eb  N1:=N_18, N2:=GND  ; 
INTERN  AM       VR0  N1:=N_3, N2:=N_14  ; 
INTERN  E        BEm0  N1:=GND, N2:=N_14  ( EMF:=N_4.V * N_12.V, PARTDERIV:=1 ); 
INTERN  I        BI1d  N1:=GND, N2:=N_23  ( IS:=VIa.I*cos(N_8.V) + VIb.I*sin(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1d  N1:=N_23, N2:=N_25  ; 
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.00470467 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=7.22301e-05, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.000938992 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.000361898, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  I        BTdq  N1:=GND, N2:=N_4  ( IS:=0.00376568 * VI1d.I * VI1q.I, PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=13 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke N0:=N_10, N1:=GND, N2:=N_11, N3:=GND, N4:=N_12, N5:=GND  ( QUANT:={N_8.V}, SRC:={vsrc, vsrc, vsrc}, TableData:="\
.MODEL Setup1_ke_table pwl TABLE=( 361, 0.410152, 0.427606, 0.445059, 0.462512,\
 0.479966, 0.497419, 0.514872, 0.532325, 0.549779, 0.567232, 0.584685,\
 0.602139, 0.619592, 0.637045, 0.654498, 0.671952, 0.689405, 0.706858,\
 0.724312, 0.741765, 0.759218, 0.776672, 0.794125, 0.811578, 0.829031,\
 0.846485, 0.863938, 0.881391, 0.898845, 0.916298, 0.933751, 0.951204,\
 0.968658, 0.986111, 1.00356, 1.02102, 1.03847, 1.05592, 1.07338, 1.09083,\
 1.10828, 1.12574, 1.14319, 1.16064, 1.1781, 1.19555, 1.213, 1.23046, 1.24791,\
 1.26536, 1.28282, 1.30027, 1.31772, 1.33518, 1.35263, 1.37008, 1.38754,\
 1.40499, 1.42244, 1.4399, 1.45735, 1.4748, 1.49226, 1.50971, 1.52716, 1.54462,\
 1.56207, 1.57952, 1.59698, 1.61443, 1.63188, 1.64934, 1.66679, 1.68424,\
 1.7017, 1.71915, 1.7366, 1.75406, 1.77151, 1.78896, 1.80642, 1.82387, 1.84132,\
 1.85878, 1.87623, 1.89368, 1.91114, 1.92859, 1.94604, 1.9635, 1.98095, 1.9984,\
 2.01586, 2.03331, 2.05076, 2.06822, 2.08567, 2.10312, 2.12058, 2.13803,\
 2.15548, 2.17293, 2.19039, 2.20784, 2.22529, 2.24275, 2.2602, 2.27765,\
 2.29511, 2.31256, 2.33001, 2.34747, 2.36492, 2.38237, 2.39983, 2.41728,\
 2.43473, 2.45219, 2.46964, 2.48709, 2.50455, 2.522, 2.53945, 2.55691, 2.57436,\
 2.59181, 2.60927, 2.62672, 2.64417, 2.66163, 2.67908, 2.69653, 2.71399,\
 2.73144, 2.74889, 2.76635, 2.7838, 2.80125, 2.81871, 2.83616, 2.85361,\
 2.87107, 2.88852, 2.90597, 2.92343, 2.94088, 2.95833, 2.97579, 2.99324,\
 3.01069, 3.02815, 3.0456, 3.06305, 3.08051, 3.09796, 3.11541, 3.13287,\
 3.15032, 3.16777, 3.18523, 3.20268, 3.22013, 3.23759, 3.25504, 3.27249,\
 3.28995, 3.3074, 3.32485, 3.34231, 3.35976, 3.37721, 3.39467, 3.41212,\
 3.42957, 3.44703, 3.46448, 3.48193, 3.49939, 3.51684, 3.53429, 3.55175,\
 3.5692, 3.58665, 3.6041, 3.62156, 3.63901, 3.65646, 3.67392, 3.69137, 3.70882,\
 3.72628, 3.74373, 3.76118, 3.77864, 3.79609, 3.81354, 3.831, 3.84845, 3.8659,\
 3.88336, 3.90081, 3.91826, 3.93572, 3.95317, 3.97062, 3.98808, 4.00553,\
 4.02298, 4.04044, 4.05789, 4.07534, 4.0928, 4.11025, 4.1277, 4.14516, 4.16261,\
 4.18006, 4.19752, 4.21497, 4.23242, 4.24988, 4.26733, 4.28478, 4.30224,\
 4.31969, 4.33714, 4.3546, 4.37205, 4.3895, 4.40696, 4.42441, 4.44186, 4.45932,\
 4.47677, 4.49422, 4.51168, 4.52913, 4.54658, 4.56404, 4.58149, 4.59894,\
 4.6164, 4.63385, 4.6513, 4.66876, 4.68621, 4.70366, 4.72112, 4.73857, 4.75602,\
 4.77348, 4.79093, 4.80838, 4.82584, 4.84329, 4.86074, 4.8782, 4.89565, 4.9131,\
 4.93056, 4.94801, 4.96546, 4.98292, 5.00037, 5.01782, 5.03527, 5.05273,\
 5.07018, 5.08763, 5.10509, 5.12254, 5.13999, 5.15745, 5.1749, 5.19235,\
 5.20981, 5.22726, 5.24471, 5.26217, 5.27962, 5.29707, 5.31453, 5.33198,\
 5.34943, 5.36689, 5.38434, 5.40179, 5.41925, 5.4367, 5.45415, 5.47161,\
 5.48906, 5.50651, 5.52397, 5.54142, 5.55887, 5.57633, 5.59378, 5.61123,\
 5.62869, 5.64614, 5.66359, 5.68105, 5.6985, 5.71595, 5.73341, 5.75086,\
 5.76831, 5.78577, 5.80322, 5.82067, 5.83813, 5.85558, 5.87303, 5.89049,\
 5.90794, 5.92539, 5.94285, 5.9603, 5.97775, 5.99521, 6.01266, 6.03011,\
 6.04757, 6.06502, 6.08247, 6.09993, 6.11738, 6.13483, 6.15229, 6.16974,\
 6.18719, 6.20465, 6.2221, 6.23955, 6.25701, 6.27446, 6.29191, 6.30937,\
 6.32682, 6.34427, 6.36173, 6.37918, 6.39663, 6.41409, 6.43154, 6.44899,\
 6.46644, 6.4839, 6.50135, 6.5188, 6.53626, 6.55371, 6.57116, 6.58862, 6.60607,\
 6.62352, 6.64098, 6.65843, 6.67588, 6.69334, 3, 0.613508, 0.638701, 0.663852,\
 0.688966, 0.71396, 0.738753, 0.763328, 0.787552, 0.8114, 0.834844, 0.857927,\
 0.880717, 0.903178, 0.925304, 0.947174, 0.968827, 0.990318, 1.01158, 1.03261,\
 1.05337, 1.07373, 1.09367, 1.11305, 1.13184, 1.15002, 1.16768, 1.18492,\
 1.20171, 1.21807, 1.23411, 1.24989, 1.26548, 1.28079, 1.29587, 1.31065,\
 1.32502, 1.33896, 1.35232, 1.36509, 1.37725, 1.38887, 1.40006, 1.41079,\
 1.42109, 1.43106, 1.44076, 1.45025, 1.45947, 1.46843, 1.47709, 1.48534,\
 1.49314, 1.50034, 1.50694, 1.51291, 1.51833, 1.5233, 1.52779, 1.53181,\
 1.53548, 1.53881, 1.54188, 1.54457, 1.54689, 1.5488, 1.55015, 1.55088,\
 1.55088, 1.55015, 1.5488, 1.54689, 1.54457, 1.54188, 1.53881, 1.53548,\
 1.53181, 1.52779, 1.5233, 1.51833, 1.51291, 1.50694, 1.50034, 1.49314,\
 1.48534, 1.47709, 1.46843, 1.45947, 1.45025, 1.44076, 1.43106, 1.42109,\
 1.41079, 1.40006, 1.38887, 1.37725, 1.36509, 1.35232, 1.33896, 1.32502,\
 1.31065, 1.29587, 1.28079, 1.26548, 1.24989, 1.23411, 1.21807, 1.20171,\
 1.18492, 1.16768, 1.15002, 1.13184, 1.11305, 1.09367, 1.07373, 1.05337,\
 1.03261, 1.01158, 0.990318, 0.968827, 0.947174, 0.925304, 0.903178, 0.880717,\
 0.857927, 0.834844, 0.8114, 0.787552, 0.763328, 0.738753, 0.71396, 0.688966,\
 0.663852, 0.638701, 0.613508, 0.588304, 0.562988, 0.537469, 0.511721,\
 0.485718, 0.459546, 0.433206, 0.406675, 0.380088, 0.353507, 0.327069,\
 0.300748, 0.274545, 0.248538, 0.222688, 0.196945, 0.171192, 0.145317,\
 0.119267, 0.0930026, 0.0666032, 0.0400667, 0.0133655, -0.0133655, -0.0400667,\
 -0.0666032, -0.0930026, -0.119267, -0.145317, -0.171192, -0.196945, -0.222688,\
 -0.248538, -0.274545, -0.300748, -0.327069, -0.353507, -0.380088, -0.406675,\
 -0.433206, -0.459546, -0.485718, -0.511721, -0.537469, -0.562988, -0.588304,\
 -0.613508, -0.638701, -0.663852, -0.688966, -0.71396, -0.738753, -0.763328,\
 -0.787552, -0.8114, -0.834844, -0.857927, -0.880717, -0.903178, -0.925304,\
 -0.947174, -0.968827, -0.990318, -1.01158, -1.03261, -1.05337, -1.07373,\
 -1.09367, -1.11305, -1.13184, -1.15002, -1.16768, -1.18492, -1.20171,\
 -1.21807, -1.23411, -1.24989, -1.26548, -1.28079, -1.29587, -1.31065,\
 -1.32502, -1.33896, -1.35232, -1.36509, -1.37725, -1.38887, -1.40006,\
 -1.41079, -1.42109, -1.43106, -1.44076, -1.45025, -1.45947, -1.46843,\
 -1.47709, -1.48534, -1.49314, -1.50034, -1.50694, -1.51291, -1.51833, -1.5233,\
 -1.52779, -1.53181, -1.53548, -1.53881, -1.54188, -1.54457, -1.54689, -1.5488,\
 -1.55015, -1.55088, -1.55088, -1.55015, -1.5488, -1.54689, -1.54457, -1.54188,\
 -1.53881, -1.53548, -1.53181, -1.52779, -1.5233, -1.51833, -1.51291, -1.50694,\
 -1.50034, -1.49314, -1.48534, -1.47709, -1.46843, -1.45947, -1.45025,\
 -1.44076, -1.43106, -1.42109, -1.41079, -1.40006, -1.38887, -1.37725,\
 -1.36509, -1.35232, -1.33896, -1.32502, -1.31065, -1.29587, -1.28079,\
 -1.26548, -1.24989, -1.23411, -1.21807, -1.20171, -1.18492, -1.16768,\
 -1.15002, -1.13184, -1.11305, -1.09367, -1.07373, -1.05337, -1.03261,\
 -1.01158, -0.990318, -0.968827, -0.947174, -0.925304, -0.903178, -0.880717,\
 -0.857927, -0.834844, -0.8114, -0.787552, -0.763328, -0.738753, -0.71396,\
 -0.688966, -0.663852, -0.638701, -0.613508, -0.588304, -0.562988, -0.537469,\
 -0.511721, -0.485718, -0.459546, -0.433206, -0.406675, -0.380088, -0.353507,\
 -0.327069, -0.300748, -0.274545, -0.248538, -0.222688, -0.196945, -0.171192,\
 -0.145317, -0.119267, -0.0930026, -0.0666032, -0.0400667, -0.0133655,\
 0.0133655, 0.0400667, 0.0666032, 0.0930026, 0.119267, 0.145317, 0.171192,\
 0.196945, 0.222688, 0.248538, 0.274545, 0.300748, 0.327069, 0.353507,\
 0.380088, 0.406675, 0.433206, 0.459546, 0.485718, 0.511721, 0.537469,\
 0.562988, 0.588304, 0.613508, -1.42266, -1.41165, -1.40024, -1.38842, -1.3762,\
 -1.36344, -1.35009, -1.33611, -1.3215, -1.30641, -1.29087, -1.27503, -1.25896,\
 -1.24264, -1.22617, -1.20943, -1.19238, -1.17492, -1.15704, -1.1388, -1.12014,\
 -1.10102, -1.08151, -1.06166, -1.04163, -1.02144, -1.00113, -0.980796,\
 -0.960391, -0.939927, -0.919302, -0.89842, -0.877184, -0.855559, -0.833608,\
 -0.811267, -0.78848, -0.765331, -0.74187, -0.718248, -0.694474, -0.670607,\
 -0.646725, -0.622789, -0.598809, -0.574683, -0.550315, -0.525607, -0.500525,\
 -0.475134, -0.449368, -0.423174, -0.396636, -0.369808, -0.342842, -0.315748,\
 -0.288591, -0.261453, -0.234312, -0.207194, -0.180016, -0.152696, -0.125207,\
 -0.0975494, -0.0697919, -0.041943, -0.0139854, 0.0139854, 0.041943, 0.0697919,\
 0.0975494, 0.125207, 0.152696, 0.180016, 0.207194, 0.234312, 0.261453,\
 0.288591, 0.315748, 0.342842, 0.369808, 0.396636, 0.423174, 0.449368,\
 0.475134, 0.500525, 0.525607, 0.550315, 0.574683, 0.598809, 0.622789,\
 0.646725, 0.670607, 0.694474, 0.718248, 0.74187, 0.765331, 0.78848, 0.811267,\
 0.833608, 0.855559, 0.877184, 0.89842, 0.919302, 0.939927, 0.960391, 0.980796,\
 1.00113, 1.02144, 1.04163, 1.06166, 1.08151, 1.10102, 1.12014, 1.1388,\
 1.15704, 1.17492, 1.19238, 1.20943, 1.22617, 1.24264, 1.25896, 1.27503,\
 1.29087, 1.30641, 1.3215, 1.33611, 1.35009, 1.36344, 1.3762, 1.38842, 1.40024,\
 1.41165, 1.42266, 1.43336, 1.44375, 1.45383, 1.46351, 1.47278, 1.48164,\
 1.48995, 1.49765, 1.50468, 1.51103, 1.51677, 1.52196, 1.52674, 1.53111,\
 1.53507, 1.53874, 1.54209, 1.54514, 1.54779, 1.55003, 1.55186, 1.55314,\
 1.55381, 1.55381, 1.55314, 1.55186, 1.55003, 1.54779, 1.54514, 1.54209,\
 1.53874, 1.53507, 1.53111, 1.52674, 1.52196, 1.51677, 1.51103, 1.50468,\
 1.49765, 1.48995, 1.48164, 1.47278, 1.46351, 1.45383, 1.44375, 1.43336,\
 1.42266, 1.41165, 1.40024, 1.38842, 1.3762, 1.36344, 1.35009, 1.33611, 1.3215,\
 1.30641, 1.29087, 1.27503, 1.25896, 1.24264, 1.22617, 1.20943, 1.19238,\
 1.17492, 1.15704, 1.1388, 1.12014, 1.10102, 1.08151, 1.06166, 1.04163,\
 1.02144, 1.00113, 0.980796, 0.960391, 0.939927, 0.919302, 0.89842, 0.877184,\
 0.855559, 0.833608, 0.811267, 0.78848, 0.765331, 0.74187, 0.718248, 0.694474,\
 0.670607, 0.646725, 0.622789, 0.598809, 0.574683, 0.550315, 0.525607,\
 0.500525, 0.475134, 0.449368, 0.423174, 0.396636, 0.369808, 0.342842,\
 0.315748, 0.288591, 0.261453, 0.234312, 0.207194, 0.180016, 0.152696,\
 0.125207, 0.0975494, 0.0697919, 0.041943, 0.0139854, -0.0139854, -0.041943,\
 -0.0697919, -0.0975494, -0.125207, -0.152696, -0.180016, -0.207194, -0.234312,\
 -0.261453, -0.288591, -0.315748, -0.342842, -0.369808, -0.396636, -0.423174,\
 -0.449368, -0.475134, -0.500525, -0.525607, -0.550315, -0.574683, -0.598809,\
 -0.622789, -0.646725, -0.670607, -0.694474, -0.718248, -0.74187, -0.765331,\
 -0.78848, -0.811267, -0.833608, -0.855559, -0.877184, -0.89842, -0.919302,\
 -0.939927, -0.960391, -0.980796, -1.00113, -1.02144, -1.04163, -1.06166,\
 -1.08151, -1.10102, -1.12014, -1.1388, -1.15704, -1.17492, -1.19238, -1.20943,\
 -1.22617, -1.24264, -1.25896, -1.27503, -1.29087, -1.30641, -1.3215, -1.33611,\
 -1.35009, -1.36344, -1.3762, -1.38842, -1.40024, -1.41165, -1.42266, -1.43336,\
 -1.44375, -1.45383, -1.46351, -1.47278, -1.48164, -1.48995, -1.49765,\
 -1.50468, -1.51103, -1.51677, -1.52196, -1.52674, -1.53111, -1.53507,\
 -1.53874, -1.54209, -1.54514, -1.54779, -1.55003, -1.55186, -1.55314,\
 -1.55381, -1.55381, -1.55314, -1.55186, -1.55003, -1.54779, -1.54514,\
 -1.54209, -1.53874, -1.53507, -1.53111, -1.52674, -1.52196, -1.51677,\
 -1.51103, -1.50468, -1.49765, -1.48995, -1.48164, -1.47278, -1.46351,\
 -1.45383, -1.44375, -1.43336, -1.42266, -0.0410439, -0.0429737, -0.0446933,\
 -0.0461338, -0.0473134, -0.0481299, -0.048542, -0.048542, -0.0481299,\
 -0.0473134, -0.0461338, -0.0446933, -0.0429737, -0.0410439, -0.0390178,\
 -0.0369602, -0.0349423, -0.0329687, -0.0310576, -0.0291829, -0.0273283,\
 -0.0255285, -0.0237519, -0.0220212, -0.0203027, -0.0186203, -0.0169516,\
 -0.0152598, -0.0135525, -0.011823, -0.010112, -0.00845962, -0.00685778,\
 -0.00531329, -0.00378843, -0.00225965, -0.000756515, 0.000756515, 0.00225965,\
 0.00378843, 0.00531329, 0.00685778, 0.00845962, 0.010112, 0.011823, 0.0135525,\
 0.0152598, 0.0169516, 0.0186203, 0.0203027, 0.0220212, 0.0237519, 0.0255285,\
 0.0273283, 0.0291829, 0.0310576, 0.0329687, 0.0349423, 0.0369602, 0.0390178,\
 0.0410439, 0.0429737, 0.0446933, 0.0461338, 0.0473134, 0.0481299, 0.048542,\
 0.048542, 0.0481299, 0.0473134, 0.0461338, 0.0446933, 0.0429737, 0.0410439,\
 0.0390178, 0.0369602, 0.0349423, 0.0329687, 0.0310576, 0.0291829, 0.0273283,\
 0.0255285, 0.0237519, 0.0220212, 0.0203027, 0.0186203, 0.0169516, 0.0152598,\
 0.0135525, 0.011823, 0.010112, 0.00845962, 0.00685778, 0.00531329, 0.00378843,\
 0.00225965, 0.000756515, -0.000756515, -0.00225965, -0.00378843, -0.00531329,\
 -0.00685778, -0.00845962, -0.010112, -0.011823, -0.0135525, -0.0152598,\
 -0.0169516, -0.0186203, -0.0203027, -0.0220212, -0.0237519, -0.0255285,\
 -0.0273283, -0.0291829, -0.0310576, -0.0329687, -0.0349423, -0.0369602,\
 -0.0390178, -0.0410439, -0.0429737, -0.0446933, -0.0461338, -0.0473134,\
 -0.0481299, -0.048542, -0.048542, -0.0481299, -0.0473134, -0.0461338,\
 -0.0446933, -0.0429737, -0.0410439, -0.0390178, -0.0369602, -0.0349423,\
 -0.0329687, -0.0310576, -0.0291829, -0.0273283, -0.0255285, -0.0237519,\
 -0.0220212, -0.0203027, -0.0186203, -0.0169516, -0.0152598, -0.0135525,\
 -0.011823, -0.010112, -0.00845962, -0.00685778, -0.00531329, -0.00378843,\
 -0.00225965, -0.000756515, 0.000756515, 0.00225965, 0.00378843, 0.00531329,\
 0.00685778, 0.00845962, 0.010112, 0.011823, 0.0135525, 0.0152598, 0.0169516,\
 0.0186203, 0.0203027, 0.0220212, 0.0237519, 0.0255285, 0.0273283, 0.0291829,\
 0.0310576, 0.0329687, 0.0349423, 0.0369602, 0.0390178, 0.0410439, 0.0429737,\
 0.0446933, 0.0461338, 0.0473134, 0.0481299, 0.048542, 0.048542, 0.0481299,\
 0.0473134, 0.0461338, 0.0446933, 0.0429737, 0.0410439, 0.0390178, 0.0369602,\
 0.0349423, 0.0329687, 0.0310576, 0.0291829, 0.0273283, 0.0255285, 0.0237519,\
 0.0220212, 0.0203027, 0.0186203, 0.0169516, 0.0152598, 0.0135525, 0.011823,\
 0.010112, 0.00845962, 0.00685778, 0.00531329, 0.00378843, 0.00225965,\
 0.000756515, -0.000756515, -0.00225965, -0.00378843, -0.00531329, -0.00685778,\
 -0.00845962, -0.010112, -0.011823, -0.0135525, -0.0152598, -0.0169516,\
 -0.0186203, -0.0203027, -0.0220212, -0.0237519, -0.0255285, -0.0273283,\
 -0.0291829, -0.0310576, -0.0329687, -0.0349423, -0.0369602, -0.0390178,\
 -0.0410439, -0.0429737, -0.0446933, -0.0461338, -0.0473134, -0.0481299,\
 -0.048542, -0.048542, -0.0481299, -0.0473134, -0.0461338, -0.0446933,\
 -0.0429737, -0.0410439, -0.0390178, -0.0369602, -0.0349423, -0.0329687,\
 -0.0310576, -0.0291829, -0.0273283, -0.0255285, -0.0237519, -0.0220212,\
 -0.0203027, -0.0186203, -0.0169516, -0.0152598, -0.0135525, -0.011823,\
 -0.010112, -0.00845962, -0.00685778, -0.00531329, -0.00378843, -0.00225965,\
 -0.000756515, 0.000756515, 0.00225965, 0.00378843, 0.00531329, 0.00685778,\
 0.00845962, 0.010112, 0.011823, 0.0135525, 0.0152598, 0.0169516, 0.0186203,\
 0.0203027, 0.0220212, 0.0237519, 0.0255285, 0.0273283, 0.0291829, 0.0310576,\
 0.0329687, 0.0349423, 0.0369602, 0.0390178, 0.0410439, 0.0429737, 0.0446933,\
 0.0461338, 0.0473134, 0.0481299, 0.048542, 0.048542, 0.0481299, 0.0473134,\
 0.0461338, 0.0446933, 0.0429737, 0.0410439, 0.0390178, 0.0369602, 0.0349423,\
 0.0329687, 0.0310576, 0.0291829, 0.0273283, 0.0255285, 0.0237519, 0.0220212,\
 0.0203027, 0.0186203, 0.0169516, 0.0152598, 0.0135525, 0.011823, 0.010112,\
 0.00845962, 0.00685778, 0.00531329, 0.00378843, 0.00225965, 0.000756515,\
 -0.000756515, -0.00225965, -0.00378843, -0.00531329, -0.00685778, -0.00845962,\
 -0.010112, -0.011823, -0.0135525, -0.0152598, -0.0169516, -0.0186203,\
 -0.0203027, -0.0220212, -0.0237519, -0.0255285, -0.0273283, -0.0291829,\
 -0.0310576, -0.0329687, -0.0349423, -0.0369602, -0.0390178, -0.0410439)\
 PERIODIC NOSPLINE" );
}

}