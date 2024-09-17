FlexAngles_P1 = readmatrix('FlexAnglesP1.txt');
FlexAngles_P2 = readmatrix('FlexAnglesP2.txt');
FlexAngles_P3 = readmatrix('FlexAnglesP3.txt');
FlexAngles_P4 = readmatrix('FlexAnglesP4.txt');
FlexAngles_P5 = readmatrix('FlexAnglesP5.txt');
FlexAngles_P6 = readmatrix('FlexAnglesP6.txt');
FlexAngles_P7 = readmatrix('FlexAnglesP7.txt');
FlexAngles_P8 = readmatrix('FlexAnglesP8.txt');
FlexAngles_P9 = readmatrix('FlexAnglesP9.txt');
FlexAngles_P10 = readmatrix('FlexAnglesP10.txt');
FlexAngles_P11 = readmatrix('FlexAnglesP11.txt');
FlexAngles_P12 = readmatrix('FlexAnglesP12.txt');
FlexAngles_P13 = readmatrix('FlexAnglesP13.txt');
FlexAngles_P14 = readmatrix('FlexAnglesP14.txt');
FlexAngles_P15 = readmatrix('FlexAnglesP15.txt');
FlexAngles_P16 = readmatrix('FlexAnglesP16.txt');
FlexAngles_P17 = readmatrix('FlexAnglesP17.txt');
FlexAngles_P18 = readmatrix('FlexAnglesP18.txt');
FlexAngles_P19 = readmatrix('FlexAnglesP19.txt');
FlexAngles_P20 = readmatrix('FlexAnglesP20.txt');
Cuff_Angle = readmatrix('Cuff_Angle.txt');

Max_P1 = FlexAngles_P1(2);
Max_P2 = FlexAngles_P2(2);
Max_P3 = FlexAngles_P3(2);
Max_P4 = FlexAngles_P4(2);
Max_P5 = FlexAngles_P5(2);
Max_P6 = FlexAngles_P6(2);
Max_P7 = FlexAngles_P7(2);
Max_P8 = FlexAngles_P8(2);
Max_P9 = FlexAngles_P9(2);
Max_P10 = FlexAngles_P10(2);
Max_P11 = FlexAngles_P11(2);
Max_P12 = FlexAngles_P12(2);
Max_P13 = FlexAngles_P13(2);
Max_P14 = FlexAngles_P14(2);
Max_P15 = FlexAngles_P15(2);
Max_P16 = FlexAngles_P16(2);
Max_P17 = FlexAngles_P17(2);
Max_P18 = FlexAngles_P18(2);
Max_P19 = FlexAngles_P19(2);
Max_P20 = FlexAngles_P20(2);

Min_P1 = FlexAngles_P1(1);
Min_P2 = FlexAngles_P2(1);
Min_P3 = FlexAngles_P3(1);
Min_P4 = FlexAngles_P4(1);
Min_P5 = FlexAngles_P5(1);
Min_P6 = FlexAngles_P6(1);
Min_P7 = FlexAngles_P7(1);
Min_P8 = FlexAngles_P8(1);
Min_P9 = FlexAngles_P9(1);
Min_P10 = FlexAngles_P10(1);
Min_P11 = FlexAngles_P11(1);
Min_P12 = FlexAngles_P12(1);
Min_P13 = FlexAngles_P13(1);
Min_P14 = FlexAngles_P14(1);
Min_P15 = FlexAngles_P15(1);
Min_P16 = FlexAngles_P16(1);
Min_P17 = FlexAngles_P17(1);
Min_P18 = FlexAngles_P18(1);
Min_P19 = FlexAngles_P19(1);
Min_P20 = FlexAngles_P20(1);

Max_Unassisted_P1 = FlexAngles_P1(3);
Max_Unassisted_P2 = FlexAngles_P2(3);
Max_Unassisted_P3 = FlexAngles_P3(3);
Max_Unassisted_P4 = FlexAngles_P4(3);
Max_Unassisted_P5 = FlexAngles_P5(3);
Max_Unassisted_P6 = FlexAngles_P6(3);
Max_Unassisted_P7 = FlexAngles_P7(3);
Max_Unassisted_P8 = FlexAngles_P8(3);
Max_Unassisted_P9 = FlexAngles_P9(3);
Max_Unassisted_P10 = FlexAngles_P10(3);
Max_Unassisted_P11 = FlexAngles_P11(3);
Max_Unassisted_P12 = FlexAngles_P12(3);
Max_Unassisted_P13 = FlexAngles_P13(3);
Max_Unassisted_P14 = FlexAngles_P14(3);
Max_Unassisted_P15 = FlexAngles_P15(3);
Max_Unassisted_P16 = FlexAngles_P16(3);
Max_Unassisted_P17 = FlexAngles_P17(3);
Max_Unassisted_P18 = FlexAngles_P18(3);
Max_Unassisted_P19 = FlexAngles_P19(3);
Max_Unassisted_P20 = FlexAngles_P20(3);

Max = [Max_P1 Max_P2 Max_P3 Max_P4 Max_P5 Max_P6 Max_P7 Max_P8 Max_P9 Max_P10 Max_P11 Max_P12 Max_P13 Max_P14 Max_P15 Max_P16 Max_P17 Max_P18 Max_P19 Max_P20];
Min = [Min_P1 Min_P2 Min_P3 Min_P4 Min_P5 Min_P6 Min_P7 Min_P8 Min_P9 Min_P10 Min_P11 Min_P12 Min_P13 Min_P14 Min_P15 Min_P16 Min_P17 Min_P18 Min_P19 Min_P20];
Max_Unassisted = [Max_Unassisted_P1 Max_Unassisted_P2 Max_Unassisted_P3 Max_Unassisted_P3 Max_Unassisted_P4 Max_Unassisted_P5 Max_Unassisted_P6 Max_Unassisted_P7 Max_Unassisted_P8 Max_Unassisted_P9 Max_Unassisted_P10 Max_Unassisted_P11 Max_Unassisted_P12 Max_Unassisted_P13 Max_Unassisted_P14 Max_Unassisted_P15 Max_Unassisted_P16 Max_Unassisted_P17 Max_Unassisted_P18 Max_Unassisted_P19 Max_Unassisted_P20];

Range_Max = Max-Min;
%Range_Unassisted = Max_Unassisted-Min;

mean_CuffAngle = 20.3;

max_ass = max(Range_Max) - mean_CuffAngle;
mean_ass = mean(Range_Max) - mean_CuffAngle;
std_ass = std(Range_Max);
mean_max = mean(Max) - mean_CuffAngle;
std_max = std(Max) - mean_CuffAngle;

max_un = max(Range_Unassisted);
mean_un = mean(Range_Unassisted);
std_un = std(Range_Unassisted);

cuff = Cuff_Angle.';
real_max = Max-cuff(1:20)
Participants = 1:20;
scatter(Participants,Range_Max);
