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

INTERN  R        Ra  N1:=A, N2:=N0_1  ( R:=0.0184808 ); 
INTERN  R        Rb  N1:=B, N2:=N0_2  ( R:=0.0184808 ); 
INTERN  R        Rc  N1:=C, N2:=N0_3  ( R:=0.0184808 ); 
INTERN  L        La  N1:=N0_1, N2:=N0_4  ( L:=0.00359434, I0:=0 ); 
INTERN  L        Lb  N1:=N0_2, N2:=N0_5  ( L:=0.00359434, I0:=0 ); 
INTERN  L        Lc  N1:=N0_3, N2:=N0_6  ( L:=0.00359434, I0:=0 ); 
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
INTERN  E        BVmd  N1:=N_31, N2:=N_25  ( EMF:=0.00627974 * N_4.V * VImq.I, PARTDERIV:=1 ); 
INTERN  L        Lad  N1:=N_31, N2:=N_33  ( L:=0.000146779, I0:=0 ); 
INTERN  AM       VImd  N1:=N_33, N2:=GND  ; 
INTERN  I        BI1q  N1:=GND, N2:=N_24  ( IS:=VIa.I*sin(N_8.V) - VIb.I*cos(N_8.V), PARTDERIV:=1 ); 
INTERN  AM       VI1q  N1:=N_24, N2:=N_26  ; 
INTERN  E        BVmq  N1:=N_32, N2:=N_26  ( EMF:=-0.00146779 * N_4.V * VImd.I, PARTDERIV:=1 ); 
INTERN  L        Laq  N1:=N_32, N2:=N_34  ( L:=0.000627974, I0:=0 ); 
INTERN  AM       VImq  N1:=N_34, N2:=GND  ; 
INTERN  I        BTm  N1:=GND, N2:=N_4  ( IS:=(VIa.I*N_10.V + VIb.I*N_11.V), PARTDERIV:=1 ); 
INTERN  I        BTdq  N1:=GND, N2:=N_4  ( IS:=0.00481195 * VI1d.I * VI1q.I, PARTDERIV:=1 ); 
INTERN  R        RT  N1:=N_4, N2:=GND  ( R:=1e12 ); 
INTERN  VM       VM_Speed  N1:=N_4, N2:=GND  ; 
INTERN  IV       Gx  N1:=GND, N2:=N_7  ( QUANT:=VM_Speed.V, FACT:=1 ); 
INTERN  C        Cx  N1:=N_7, N2:=GND  ( C:=1, V0:=pos0*0.0174533 ); 
INTERN  VM       VM_Pos  N1:=N_7, N2:=GND  ; 
INTERN  EV       Ex1  N1:=GND, N2:=N_8  ( QUANT:=VM_Pos.V, FACT:=10 ); 
INTERN  VM       VM_Ex1  N1:=N_8, N2:=GND  ; 
INTERN  EV       Ex2  N1:=GND, N2:=N_5  ( QUANT:=VM_Pos.V, FACT:=57.2958 ); 
INTERN  VM       VM_kea  N1:=N_10, N2:=GND  ; 
INTERN  VM       VM_keb  N1:=N_11, N2:=GND  ; 
INTERN  VM       VM_ke0  N1:=N_12, N2:=GND  ; 
INTERN  NDSRC    Pke N0:=N_10, N1:=GND, N2:=N_11, N3:=GND, N4:=N_12, N5:=GND  ( QUANT:={N_8.V}, SRC:={vsrc, vsrc, vsrc}, TableData:="\
.MODEL Setup1_ke_table pwl TABLE=( 361, 0.261799, 0.279253, 0.296706, 0.314159,\
 0.331613, 0.349066, 0.366519, 0.383972, 0.401426, 0.418879, 0.436332,\
 0.453786, 0.471239, 0.488692, 0.506145, 0.523599, 0.541052, 0.558505,\
 0.575959, 0.593412, 0.610865, 0.628319, 0.645772, 0.663225, 0.680678,\
 0.698132, 0.715585, 0.733038, 0.750492, 0.767945, 0.785398, 0.802851,\
 0.820305, 0.837758, 0.855211, 0.872665, 0.890118, 0.907571, 0.925025,\
 0.942478, 0.959931, 0.977384, 0.994838, 1.01229, 1.02974, 1.0472, 1.06465,\
 1.0821, 1.09956, 1.11701, 1.13446, 1.15192, 1.16937, 1.18682, 1.20428,\
 1.22173, 1.23918, 1.25664, 1.27409, 1.29154, 1.309, 1.32645, 1.3439, 1.36136,\
 1.37881, 1.39626, 1.41372, 1.43117, 1.44862, 1.46608, 1.48353, 1.50098,\
 1.51844, 1.53589, 1.55334, 1.5708, 1.58825, 1.6057, 1.62316, 1.64061, 1.65806,\
 1.67552, 1.69297, 1.71042, 1.72788, 1.74533, 1.76278, 1.78024, 1.79769,\
 1.81514, 1.8326, 1.85005, 1.8675, 1.88496, 1.90241, 1.91986, 1.93732, 1.95477,\
 1.97222, 1.98968, 2.00713, 2.02458, 2.04204, 2.05949, 2.07694, 2.0944,\
 2.11185, 2.1293, 2.14675, 2.16421, 2.18166, 2.19911, 2.21657, 2.23402,\
 2.25147, 2.26893, 2.28638, 2.30383, 2.32129, 2.33874, 2.35619, 2.37365,\
 2.3911, 2.40855, 2.42601, 2.44346, 2.46091, 2.47837, 2.49582, 2.51327,\
 2.53073, 2.54818, 2.56563, 2.58309, 2.60054, 2.61799, 2.63545, 2.6529,\
 2.67035, 2.68781, 2.70526, 2.72271, 2.74017, 2.75762, 2.77507, 2.79253,\
 2.80998, 2.82743, 2.84489, 2.86234, 2.87979, 2.89725, 2.9147, 2.93215,\
 2.94961, 2.96706, 2.98451, 3.00197, 3.01942, 3.03687, 3.05433, 3.07178,\
 3.08923, 3.10669, 3.12414, 3.14159, 3.15905, 3.1765, 3.19395, 3.21141,\
 3.22886, 3.24631, 3.26377, 3.28122, 3.29867, 3.31613, 3.33358, 3.35103,\
 3.36849, 3.38594, 3.40339, 3.42085, 3.4383, 3.45575, 3.47321, 3.49066,\
 3.50811, 3.52557, 3.54302, 3.56047, 3.57792, 3.59538, 3.61283, 3.63028,\
 3.64774, 3.66519, 3.68264, 3.7001, 3.71755, 3.735, 3.75246, 3.76991, 3.78736,\
 3.80482, 3.82227, 3.83972, 3.85718, 3.87463, 3.89208, 3.90954, 3.92699,\
 3.94444, 3.9619, 3.97935, 3.9968, 4.01426, 4.03171, 4.04916, 4.06662, 4.08407,\
 4.10152, 4.11898, 4.13643, 4.15388, 4.17134, 4.18879, 4.20624, 4.2237,\
 4.24115, 4.2586, 4.27606, 4.29351, 4.31096, 4.32842, 4.34587, 4.36332,\
 4.38078, 4.39823, 4.41568, 4.43314, 4.45059, 4.46804, 4.4855, 4.50295, 4.5204,\
 4.53786, 4.55531, 4.57276, 4.59022, 4.60767, 4.62512, 4.64258, 4.66003,\
 4.67748, 4.69494, 4.71239, 4.72984, 4.7473, 4.76475, 4.7822, 4.79966, 4.81711,\
 4.83456, 4.85202, 4.86947, 4.88692, 4.90438, 4.92183, 4.93928, 4.95674,\
 4.97419, 4.99164, 5.00909, 5.02655, 5.044, 5.06145, 5.07891, 5.09636, 5.11381,\
 5.13127, 5.14872, 5.16617, 5.18363, 5.20108, 5.21853, 5.23599, 5.25344,\
 5.27089, 5.28835, 5.3058, 5.32325, 5.34071, 5.35816, 5.37561, 5.39307,\
 5.41052, 5.42797, 5.44543, 5.46288, 5.48033, 5.49779, 5.51524, 5.53269,\
 5.55015, 5.5676, 5.58505, 5.60251, 5.61996, 5.63741, 5.65487, 5.67232,\
 5.68977, 5.70723, 5.72468, 5.74213, 5.75959, 5.77704, 5.79449, 5.81195,\
 5.8294, 5.84685, 5.86431, 5.88176, 5.89921, 5.91667, 5.93412, 5.95157,\
 5.96903, 5.98648, 6.00393, 6.02139, 6.03884, 6.05629, 6.07375, 6.0912,\
 6.10865, 6.12611, 6.14356, 6.16101, 6.17847, 6.19592, 6.21337, 6.23083,\
 6.24828, 6.26573, 6.28319, 6.30064, 6.31809, 6.33555, 6.353, 6.37045, 6.38791,\
 6.40536, 6.42281, 6.44026, 6.45772, 6.47517, 6.49262, 6.51008, 6.52753,\
 6.54498, 3, 0.344712, 0.377254, 0.410995, 0.456489, 0.514046, 0.577772,\
 0.642425, 0.694001, 0.733809, 0.772405, 0.792801, 0.810369, 0.823984,\
 0.834996, 0.844049, 0.852199, 0.859954, 0.867781, 0.876302, 0.885905,\
 0.897963, 0.912638, 0.936298, 0.960469, 0.99045, 1.02691, 1.06378, 1.10115,\
 1.13246, 1.15788, 1.1871, 1.21881, 1.25169, 1.29629, 1.35285, 1.41552,\
 1.47906, 1.52944, 1.56795, 1.60513, 1.62396, 1.63969, 1.65088, 1.65918,\
 1.66514, 1.66969, 1.67306, 1.67535, 1.67618, 1.67534, 1.67218, 1.66856,\
 1.65566, 1.64199, 1.62232, 1.59602, 1.57102, 1.55266, 1.54016, 1.53348,\
 1.53182, 1.53513, 1.54346, 1.55764, 1.57783, 1.60468, 1.63288, 1.65447,\
 1.67011, 1.68504, 1.69076, 1.69627, 1.70029, 1.70278, 1.704, 1.7044, 1.704,\
 1.70278, 1.70029, 1.69627, 1.69076, 1.68504, 1.67011, 1.65447, 1.63288,\
 1.60468, 1.57783, 1.55764, 1.54346, 1.53513, 1.53182, 1.53348, 1.54016,\
 1.55266, 1.57102, 1.59602, 1.62232, 1.64199, 1.65566, 1.66856, 1.67218,\
 1.67534, 1.67618, 1.67535, 1.67306, 1.66969, 1.66514, 1.65918, 1.65088,\
 1.63969, 1.62396, 1.60513, 1.56795, 1.52944, 1.47906, 1.41552, 1.35285,\
 1.29629, 1.25169, 1.21881, 1.1871, 1.15788, 1.13246, 1.10115, 1.06378,\
 1.02691, 0.99045, 0.960469, 0.936298, 0.912638, 0.897963, 0.885905, 0.876302,\
 0.867781, 0.859954, 0.852199, 0.844049, 0.834996, 0.823984, 0.810369,\
 0.792801, 0.772405, 0.733809, 0.694001, 0.642425, 0.577772, 0.514046,\
 0.456489, 0.410995, 0.377254, 0.344712, 0.314672, 0.288467, 0.256374,\
 0.218169, 0.180492, 0.143264, 0.112555, 0.0877067, 0.0634334, 0.0482223,\
 0.0356492, 0.025292, 0.0161633, 0.00791907, 0, -0.00791907, -0.0161633,\
 -0.025292, -0.0356492, -0.0482223, -0.0634334, -0.0877067, -0.112555,\
 -0.143264, -0.180492, -0.218169, -0.256374, -0.288467, -0.314672, -0.344712,\
 -0.377254, -0.410995, -0.456489, -0.514046, -0.577772, -0.642425, -0.694001,\
 -0.733809, -0.772405, -0.792801, -0.810369, -0.823984, -0.834996, -0.844049,\
 -0.852199, -0.859954, -0.867781, -0.876302, -0.885905, -0.897963, -0.912638,\
 -0.936298, -0.960469, -0.99045, -1.02691, -1.06378, -1.10115, -1.13246,\
 -1.15788, -1.1871, -1.21881, -1.25169, -1.29629, -1.35285, -1.41552, -1.47906,\
 -1.52944, -1.56795, -1.60513, -1.62396, -1.63969, -1.65088, -1.65918,\
 -1.66514, -1.66969, -1.67306, -1.67535, -1.67618, -1.67534, -1.67218,\
 -1.66856, -1.65566, -1.64199, -1.62232, -1.59602, -1.57102, -1.55266,\
 -1.54016, -1.53348, -1.53182, -1.53513, -1.54346, -1.55764, -1.57783,\
 -1.60468, -1.63288, -1.65447, -1.67011, -1.68504, -1.69076, -1.69627,\
 -1.70029, -1.70278, -1.704, -1.7044, -1.704, -1.70278, -1.70029, -1.69627,\
 -1.69076, -1.68504, -1.67011, -1.65447, -1.63288, -1.60468, -1.57783,\
 -1.55764, -1.54346, -1.53513, -1.53182, -1.53348, -1.54016, -1.55266,\
 -1.57102, -1.59602, -1.62232, -1.64199, -1.65566, -1.66856, -1.67218,\
 -1.67534, -1.67618, -1.67535, -1.67306, -1.66969, -1.66514, -1.65918,\
 -1.65088, -1.63969, -1.62396, -1.60513, -1.56795, -1.52944, -1.47906,\
 -1.41552, -1.35285, -1.29629, -1.25169, -1.21881, -1.1871, -1.15788, -1.13246,\
 -1.10115, -1.06378, -1.02691, -0.99045, -0.960469, -0.936298, -0.912638,\
 -0.897963, -0.885905, -0.876302, -0.867781, -0.859954, -0.852199, -0.844049,\
 -0.834996, -0.823984, -0.810369, -0.792801, -0.772405, -0.733809, -0.694001,\
 -0.642425, -0.577772, -0.514046, -0.456489, -0.410995, -0.377254, -0.344712,\
 -0.314672, -0.288467, -0.256374, -0.218169, -0.180492, -0.143264, -0.112555,\
 -0.0877067, -0.0634334, -0.0482223, -0.0356492, -0.025292, -0.0161633,\
 -0.00791907, 0, 0.00791907, 0.0161633, 0.025292, 0.0356492, 0.0482223,\
 0.0634334, 0.0877067, 0.112555, 0.143264, 0.180492, 0.218169, 0.256374,\
 0.288467, 0.314672, 0.344712, -1.56977, -1.55481, -1.54495, -1.53506,\
 -1.52513, -1.51935, -1.51458, -1.50974, -1.50481, -1.49977, -1.4946, -1.49082,\
 -1.48759, -1.48411, -1.4803, -1.47605, -1.47112, -1.46518, -1.45739, -1.44721,\
 -1.43389, -1.41881, -1.3879, -1.35589, -1.31365, -1.26004, -1.20774, -1.16286,\
 -1.12841, -1.10412, -1.08341, -1.06703, -1.05576, -1.04445, -1.03299,\
 -1.02567, -1.01936, -1.01299, -1.00653, -0.999969, -0.993273, -0.987842,\
 -0.982343, -0.976593, -0.970514, -0.963998, -0.956798, -0.948598, -0.938536,\
 -0.926096, -0.90975, -0.890099, -0.854621, -0.818037, -0.771221, -0.713045,\
 -0.655107, -0.600396, -0.556118, -0.522005, -0.486355, -0.450693, -0.416541,\
 -0.372197, -0.31739, -0.25931, -0.200932, -0.153846, -0.116907, -0.0809636,\
 -0.0607153, -0.0436107, -0.0302059, -0.0189285, -0.0091827, 0, 0.0091827,\
 0.0189285, 0.0302059, 0.0436107, 0.0607153, 0.0809636, 0.116907, 0.153846,\
 0.200932, 0.25931, 0.31739, 0.372197, 0.416541, 0.450693, 0.486355, 0.522005,\
 0.556118, 0.600396, 0.655107, 0.713045, 0.771221, 0.818037, 0.854621,\
 0.890099, 0.90975, 0.926096, 0.938536, 0.948598, 0.956798, 0.963998, 0.970514,\
 0.976593, 0.982343, 0.987842, 0.993273, 0.999969, 1.00653, 1.01299, 1.01936,\
 1.02567, 1.03299, 1.04445, 1.05576, 1.06703, 1.08341, 1.10412, 1.12841,\
 1.16286, 1.20774, 1.26004, 1.31365, 1.35589, 1.3879, 1.41881, 1.43389,\
 1.44721, 1.45739, 1.46518, 1.47112, 1.47605, 1.4803, 1.48411, 1.48759,\
 1.49082, 1.4946, 1.49977, 1.50481, 1.50974, 1.51458, 1.51935, 1.52513,\
 1.53506, 1.54495, 1.55481, 1.56977, 1.58904, 1.61188, 1.64485, 1.68809,\
 1.73871, 1.79058, 1.83103, 1.86115, 1.89007, 1.90302, 1.91394, 1.92088,\
 1.92519, 1.92731, 1.928, 1.92731, 1.92519, 1.92088, 1.91394, 1.90302, 1.89007,\
 1.86115, 1.83103, 1.79058, 1.73871, 1.68809, 1.64485, 1.61188, 1.58904,\
 1.56977, 1.55481, 1.54495, 1.53506, 1.52513, 1.51935, 1.51458, 1.50974,\
 1.50481, 1.49977, 1.4946, 1.49082, 1.48759, 1.48411, 1.4803, 1.47605, 1.47112,\
 1.46518, 1.45739, 1.44721, 1.43389, 1.41881, 1.3879, 1.35589, 1.31365,\
 1.26004, 1.20774, 1.16286, 1.12841, 1.10412, 1.08341, 1.06703, 1.05576,\
 1.04445, 1.03299, 1.02567, 1.01936, 1.01299, 1.00653, 0.999969, 0.993273,\
 0.987842, 0.982343, 0.976593, 0.970514, 0.963998, 0.956798, 0.948598,\
 0.938536, 0.926096, 0.90975, 0.890099, 0.854621, 0.818037, 0.771221, 0.713045,\
 0.655107, 0.600396, 0.556118, 0.522005, 0.486355, 0.450693, 0.416541,\
 0.372197, 0.31739, 0.25931, 0.200932, 0.153846, 0.116907, 0.0809636,\
 0.0607153, 0.0436107, 0.0302059, 0.0189285, 0.0091827, 0, -0.0091827,\
 -0.0189285, -0.0302059, -0.0436107, -0.0607153, -0.0809636, -0.116907,\
 -0.153846, -0.200932, -0.25931, -0.31739, -0.372197, -0.416541, -0.450693,\
 -0.486355, -0.522005, -0.556118, -0.600396, -0.655107, -0.713045, -0.771221,\
 -0.818037, -0.854621, -0.890099, -0.90975, -0.926096, -0.938536, -0.948598,\
 -0.956798, -0.963998, -0.970514, -0.976593, -0.982343, -0.987842, -0.993273,\
 -0.999969, -1.00653, -1.01299, -1.01936, -1.02567, -1.03299, -1.04445,\
 -1.05576, -1.06703, -1.08341, -1.10412, -1.12841, -1.16286, -1.20774,\
 -1.26004, -1.31365, -1.35589, -1.3879, -1.41881, -1.43389, -1.44721, -1.45739,\
 -1.46518, -1.47112, -1.47605, -1.4803, -1.48411, -1.48759, -1.49082, -1.4946,\
 -1.49977, -1.50481, -1.50974, -1.51458, -1.51935, -1.52513, -1.53506,\
 -1.54495, -1.55481, -1.56977, -1.58904, -1.61188, -1.64485, -1.68809,\
 -1.73871, -1.79058, -1.83103, -1.86115, -1.89007, -1.90302, -1.91394,\
 -1.92088, -1.92519, -1.92731, -1.928, -1.92731, -1.92519, -1.92088, -1.91394,\
 -1.90302, -1.89007, -1.86115, -1.83103, -1.79058, -1.73871, -1.68809,\
 -1.64485, -1.61188, -1.58904, -1.56977, -0.217129, -0.212552, -0.200864,\
 -0.180885, -0.152399, -0.114473, -0.0746445, -0.0441414, -0.0220565,\
 -0.00095989, 0.00711034, 0.014887, 0.0205462, 0.0240613, 0.0257894, 0.0263479,\
 0.0257894, 0.0240613, 0.0205462, 0.014887, 0.00711034, -0.00095989,\
 -0.0220565, -0.0441414, -0.0746445, -0.114473, -0.152399, -0.180885,\
 -0.200864, -0.212552, -0.217129, -0.214627, -0.204996, -0.187069, -0.16081,\
 -0.125051, -0.0873025, -0.0587742, -0.038533, -0.0191055, -0.0124939,\
 -0.00612262, -0.00254851, -0.000711858, -0.000126005, 0, 0.000126005,\
 0.000711858, 0.00254851, 0.00612262, 0.0124939, 0.0191055, 0.038533,\
 0.0587742, 0.0873025, 0.125051, 0.16081, 0.187069, 0.204996, 0.214627,\
 0.217129, 0.212552, 0.200864, 0.180885, 0.152399, 0.114473, 0.0746445,\
 0.0441414, 0.0220565, 0.00095989, -0.00711034, -0.014887, -0.0205462,\
 -0.0240613, -0.0257894, -0.0263479, -0.0257894, -0.0240613, -0.0205462,\
 -0.014887, -0.00711034, 0.00095989, 0.0220565, 0.0441414, 0.0746445, 0.114473,\
 0.152399, 0.180885, 0.200864, 0.212552, 0.217129, 0.214627, 0.204996,\
 0.187069, 0.16081, 0.125051, 0.0873025, 0.0587742, 0.038533, 0.0191055,\
 0.0124939, 0.00612262, 0.00254851, 0.000711858, 0.000126005, 0, -0.000126005,\
 -0.000711858, -0.00254851, -0.00612262, -0.0124939, -0.0191055, -0.038533,\
 -0.0587742, -0.0873025, -0.125051, -0.16081, -0.187069, -0.204996, -0.214627,\
 -0.217129, -0.212552, -0.200864, -0.180885, -0.152399, -0.114473, -0.0746445,\
 -0.0441414, -0.0220565, -0.00095989, 0.00711034, 0.014887, 0.0205462,\
 0.0240613, 0.0257894, 0.0263479, 0.0257894, 0.0240613, 0.0205462, 0.014887,\
 0.00711034, -0.00095989, -0.0220565, -0.0441414, -0.0746445, -0.114473,\
 -0.152399, -0.180885, -0.200864, -0.212552, -0.217129, -0.214627, -0.204996,\
 -0.187069, -0.16081, -0.125051, -0.0873025, -0.0587742, -0.038533, -0.0191055,\
 -0.0124939, -0.00612262, -0.00254851, -0.000711858, -0.000126005, 0,\
 0.000126005, 0.000711858, 0.00254851, 0.00612262, 0.0124939, 0.0191055,\
 0.038533, 0.0587742, 0.0873025, 0.125051, 0.16081, 0.187069, 0.204996,\
 0.214627, 0.217129, 0.212552, 0.200864, 0.180885, 0.152399, 0.114473,\
 0.0746445, 0.0441414, 0.0220565, 0.00095989, -0.00711034, -0.014887,\
 -0.0205462, -0.0240613, -0.0257894, -0.0263479, -0.0257894, -0.0240613,\
 -0.0205462, -0.014887, -0.00711034, 0.00095989, 0.0220565, 0.0441414,\
 0.0746445, 0.114473, 0.152399, 0.180885, 0.200864, 0.212552, 0.217129,\
 0.214627, 0.204996, 0.187069, 0.16081, 0.125051, 0.0873025, 0.0587742,\
 0.038533, 0.0191055, 0.0124939, 0.00612262, 0.00254851, 0.000711858,\
 0.000126005, 0, -0.000126005, -0.000711858, -0.00254851, -0.00612262,\
 -0.0124939, -0.0191055, -0.038533, -0.0587742, -0.0873025, -0.125051,\
 -0.16081, -0.187069, -0.204996, -0.214627, -0.217129, -0.212552, -0.200864,\
 -0.180885, -0.152399, -0.114473, -0.0746445, -0.0441414, -0.0220565,\
 -0.00095989, 0.00711034, 0.014887, 0.0205462, 0.0240613, 0.0257894, 0.0263479,\
 0.0257894, 0.0240613, 0.0205462, 0.014887, 0.00711034, -0.00095989,\
 -0.0220565, -0.0441414, -0.0746445, -0.114473, -0.152399, -0.180885,\
 -0.200864, -0.212552, -0.217129, -0.214627, -0.204996, -0.187069, -0.16081,\
 -0.125051, -0.0873025, -0.0587742, -0.038533, -0.0191055, -0.0124939,\
 -0.00612262, -0.00254851, -0.000711858, -0.000126005, 0, 0.000126005,\
 0.000711858, 0.00254851, 0.00612262, 0.0124939, 0.0191055, 0.038533,\
 0.0587742, 0.0873025, 0.125051, 0.16081, 0.187069, 0.204996, 0.214627,\
 0.217129, 0.212552, 0.200864, 0.180885, 0.152399, 0.114473, 0.0746445,\
 0.0441414, 0.0220565, 0.00095989, -0.00711034, -0.014887, -0.0205462,\
 -0.0240613, -0.0257894, -0.0263479, -0.0257894, -0.0240613, -0.0205462,\
 -0.014887, -0.00711034, 0.00095989, 0.0220565, 0.0441414, 0.0746445, 0.114473,\
 0.152399, 0.180885, 0.200864, 0.212552, 0.217129, 0.214627, 0.204996,\
 0.187069, 0.16081, 0.125051, 0.0873025, 0.0587742, 0.038533, 0.0191055,\
 0.0124939, 0.00612262, 0.00254851, 0.000711858, 0.000126005, 0, -0.000126005,\
 -0.000711858, -0.00254851, -0.00612262, -0.0124939, -0.0191055, -0.038533,\
 -0.0587742, -0.0873025, -0.125051, -0.16081, -0.187069, -0.204996, -0.214627,\
 -0.217129) PERIODIC NOSPLINE" );
}

}
