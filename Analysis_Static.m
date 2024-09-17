P1 = readmatrix('Static_resultsP1.txt');
P2 = readmatrix('Static_resultsP2.txt');
P3 = readmatrix('Static_resultsP3.txt');
P4 = readmatrix('Static_resultsP4.txt');
P5 = readmatrix('Static_resultsP5.txt');
P6 = readmatrix('Static_resultsP6.txt');
P7 = readmatrix('Static_resultsP7.txt');
P8 = readmatrix('Static_resultsP8.txt');
P9 = readmatrix('Static_resultsP9.txt');
P10 = readmatrix('Static_resultsP10.txt');
P11 = readmatrix('Static_resultsP11.txt');
P12 = readmatrix('Static_resultsP12.txt');
P13 = readmatrix('Static_resultsP13.txt');
P14 = readmatrix('Static_resultsP14.txt');
P15 = readmatrix('Static_resultsP15.txt');
P16 = readmatrix('Static_resultsP16.txt');
P17 = readmatrix('Static_resultsP17.txt');
P18 = readmatrix('Static_resultsP18.txt');
P19 = readmatrix('Static_resultsP19.txt');
P20 = readmatrix('Static_resultsP20.txt');

P1b = readmatrix('MVC_MaxP1.txt');
P2b = readmatrix('MVC_MaxP2.txt');
P3b = readmatrix('MVC_MaxP3.txt');
P4b = readmatrix('MVC_MaxP4.txt');
P5b = readmatrix('MVC_MaxP5.txt');
P6b = readmatrix('MVC_MaxP6.txt');
P7b = readmatrix('MVC_MaxP7.txt');
P8b = readmatrix('MVC_MaxP8.txt');
P9b = readmatrix('MVC_MaxP9.txt');
P10b = readmatrix('MVC_MaxP10.txt');
P11b = readmatrix('MVC_MaxP11.txt');
P12b = readmatrix('MVC_MaxP12.txt');
P13b = readmatrix('MVC_MaxP13.txt');
P14b = readmatrix('MVC_MaxP14.txt');
P15b = readmatrix('MVC_MaxP15.txt');
P16b = readmatrix('MVC_MaxP16.txt');
P17b = readmatrix('MVC_MaxP17.txt');
P18b = readmatrix('MVC_MaxP18.txt');
P19b = readmatrix('MVC_MaxP19.txt');
P20b = readmatrix('MVC_MaxP20.txt');

%Static Moment
AvP1 = P1(1);
AvP2 = P2(1);
AvP3 = P3(1);
AvP4 = P4(1);
AvP5 = P5(1);
AvP6 = P6(1);
AvP7 = P7(1);
AvP8 = P8(1);
AvP9 = P9(1);
AvP10 = P10(1);
AvP11 = P11(1);
AvP12 = P12(1);
AvP13 = P13(1);
AvP14 = P14(1);
AvP15 = P15(1);
AvP16 = P16(1);
AvP17 = P17(1);
AvP18 = P18(1);
AvP19 = P19(1);
AvP20 = P20(1);

Av = [AvP1 AvP2 AvP3 AvP4 AvP5 AvP6 AvP7 AvP8 AvP9 AvP10 AvP11 AvP12 AvP13 AvP14 AvP15 AvP16 AvP17 AvP18 AvP19 AvP20];
Mean_Moment = mean(Av);
Std_Moment = std(Av);

StdP1 = P1(2);
StdP2 = P2(2);
StdP3 = P3(2);
StdP4 = P4(2);
StdP5 = P5(2);
StdP6 = P6(2);
StdP7 = P7(2);
StdP8 = P8(2);
StdP9 = P9(2);
StdP10 = P10(2);
StdP11 = P11(2);
StdP12 = P12(2);
StdP13 = P13(2);
StdP14 = P14(2);
StdP15 = P15(2);
StdP16 = P16(2);
StdP17 = P17(2);
StdP18 = P18(2);
StdP19 = P18(2);
StdP20 = P20(2);

Std = [StdP1 StdP2 StdP3 StdP4 StdP5 StdP6 StdP7 StdP8 StdP9 StdP10 StdP11 StdP12 StdP13 StdP14 StdP15 StdP16 StdP17 StdP18 StdP19 StdP20];

%Moment Arm Length
LP1 = P1(4);
LP2 = P2(4);
LP3 = P3(4);
LP4 = P4(4);
LP5 = P5(4);
LP6 = P6(4);
LP7 = P7(4);
LP8 = P8(4);
LP9 = P9(4);
LP10 = P10(4);
LP11 = P11(4);
LP12 = P12(4);
LP13 = P13(4);
LP14 = P14(4);
LP15 = P15(4);
LP16 = P16(4);
LP17 = P17(4);
LP18 = P18(4);
LP19 = P19(4);
LP20 = P20(4);

Length = [LP1 LP2 LP3 LP4 LP5 LP6 LP7 LP8 LP9 LP10 LP11 LP12 LP13 LP14 LP15 LP16 LP17 LP18 LP19 LP20];
Mean_Length = mean(Length);
Std_Length = std(Length);

%Max Flexion Moment
FlexP1 = P1b(4);
FlexP2 = P2b(4);
FlexP3 = P3b(4);
FlexP4 = P4b(4);
FlexP5 = P5b(4);
FlexP6 = P6b(4);
FlexP7 = P7b(4);
FlexP8 = P8b(4);
FlexP9 = P9b(4);
FlexP10 = P10b(4);
FlexP11 = P11b(4);
FlexP12 = P12b(4);
FlexP13 = P13b(4);
FlexP14 = P14b(4);
FlexP15 = P15b(4);
FlexP16 = P16b(4);
FlexP17 = P17b(4);
FlexP18 = P18b(4);
FlexP19 = P19b(4);
FlexP20 = P20b(4);

Flexion = [FlexP1 FlexP2 FlexP3 FlexP4 FlexP5 FlexP6 FlexP7 FlexP8 FlexP9 FlexP10 FlexP11 FlexP12 FlexP13 FlexP14 FlexP15 FlexP16 FlexP17 FlexP18 FlexP19 FlexP20];
Mean_Flexion = mean(Flexion);
Std_Flexion = std(Flexion);

%Max Extension Moment
ExtP1 = P1b(5);
ExtP2 = P2b(5);
ExtP3 = P3b(5);
ExtP4 = P4b(5);
ExtP5 = P5b(5);
ExtP6 = P6b(5);
ExtP7 = P7b(5);
ExtP8 = P8b(5);
ExtP9 = P9b(5);
ExtP10 = P10b(5);
ExtP11 = P11b(5);
ExtP12 = P12b(5);
ExtP13 = P13b(5);
ExtP14 = P14b(5);
ExtP15 = P15b(5);
ExtP16 = P16b(5);
ExtP17 = P17b(5);
ExtP18 = P18b(5);
ExtP19 = P19b(5);
ExtP20 = P20b(5);

Extension = [ExtP1 ExtP2 ExtP3 ExtP4 ExtP5 ExtP6 ExtP7 ExtP8 ExtP9 ExtP10 ExtP11 ExtP12 ExtP13 ExtP14 ExtP15 ExtP16 ExtP17 ExtP18 ExtP19 ExtP20];
Mean_Extension = mean(Extension);
Std_Extension = std(Extension);
%{
%Max Triceps EMG
ExtP1 = P1b(1);
ExtP2 = P2b(1);
ExtP3 = P3b(1);
ExtP4 = P4b(1);
ExtP5 = P5b(1);
ExtP6 = P6b(1);
ExtP7 = P7b(1);
ExtP8 = P8b(1);
ExtP9 = P9b(1);
ExtP10 = P10b(1);
ExtP11 = P11b(1);
ExtP12 = P12b(1);
ExtP13 = P13b(1);
ExtP14 = P14b(1);
ExtP15 = P15b(1);
ExtP16 = P16b(1);
ExtP17 = P17b(1);
ExtP18 = P18b(1);
ExtP19 = P19b(1);
ExtP20 = P20b(1);

Tri = [TriP1 TriP2 TriP3 TriP4 TriP5 TriP6 TriP7 TriP8 TriP9 TriP10 TriP11 TriP12 TriP13 TriP14 TriP15 TriP16 TriP17 TriP18 TriP19 TriP20];
Mean_Tri = mean(Tri);
Std_Tri = std(Tri);

%Max Triceps Static
ExtP1 = P1b(5);
ExtP2 = P2b(5);
ExtP3 = P3b(5);
ExtP4 = P4b(5);
ExtP5 = P5b(5);
ExtP6 = P6b(5);
ExtP7 = P7b(5);
ExtP8 = P8b(5);
ExtP9 = P9b(5);
ExtP10 = P10b(5);
ExtP11 = P11b(5);
ExtP12 = P12b(5);
ExtP13 = P13b(5);
ExtP14 = P14b(5);
ExtP15 = P15b(5);
ExtP16 = P16b(5);
ExtP17 = P17b(5);
ExtP18 = P18b(5);
ExtP19 = P19b(5);
ExtP20 = P20b(5);
%}
Extension = [ExtP1 ExtP2 ExtP3 ExtP4 ExtP5 ExtP6 ExtP7 ExtP8 ExtP9 ExtP10 ExtP11 ExtP12 ExtP13 ExtP14 ExtP15 ExtP16 ExtP17 ExtP18 ExtP19 ExtP20];
Mean_Extension = mean(Extension);
Std_Extension = std(Extension);

%Cuff Angle Change
AgP1 = P1(5);
AgP2 = P2(5);
AgP3 = P3(5);
AgP4 = P4(5);
AgP5 = P5(5);
AgP6 = P6(5);
AgP7 = P7(5);
AgP8 = P8(5);
AgP9 = P9(5);
AgP10 = P10(5);
AgP11 = P11(5);
AgP12 = P12(5);
AgP13 = P13(5);
AgP14 = P14(5);
AgP15 = P15(5);
AgP16 = P16(5);
AgP17 = P17(5);
AgP18 = P18(5);
AgP19 = P19(5);
AgP20 = P20(5);

Ag = [AgP1 AgP2 AgP3 AgP4 AgP5 AgP6 AgP7 AgP9 AgP10 AgP11 AgP12 AgP14 AgP15 AgP16 AgP17 AgP18 AgP19 AgP20];
Mean_Angle = mean(Ag);
Std_Angle = std(Ag);

figure(1)
Participants = ['P.01';'P.02';'P.03';'P.04';'P.05';'P.06';'P.07';'P.08';'P.09';'P.10';'P.11';'P.12';'P.13';'P.14';'P.15';'P.16';'P.17';'P.18';'P.19';'P.20';'Mean';'StDv'];
Age = [57;64;34;70;72;32;60;47;24;47;32;31;25;32;49;50;24;27;28;34;41.9500;15.8728];
Sex = ['F';'M';'F';'F';'M';'M';'F';'M';'F';'M';'M';'F';'M';'M';'F';'F';'M';'F';'F';'M';'N';'N'];
Dominant = ['R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'R';'L';'N';'N'];
Weight = [68;108;78;70;85;83;66;60;64;98;65;65;100;100;52;67;67;65;65;83;75.4500;15.6591];
Height = [158;191;168;175;182;180;163;178;175;186;170;160;194;187;165;157;170;173;164;183;173.9500;11.0333];
LengthCheck = [175;180;185;180;195;180;155;175;165;210;180;180;160;170;165;190;195;170;165;185;178;13.3180];
Setting = [-1;1;0;0;0;0;0;0;0;-1;0;1;0;0;-1;0;0;0;-1;0;'N';'N'];
Moment = [AvP1;AvP2;AvP3;AvP4;AvP5;AvP6;AvP7;AvP8;AvP9;AvP10;AvP11;AvP12;AvP13;AvP14;AvP15;AvP16;AvP17;AvP18;AvP19;AvP20;Mean_Moment;Std_Moment];
SD = [StdP1;StdP2;StdP3;StdP4;StdP5;StdP6;StdP7;StdP8;StdP9;StdP10;StdP11;StdP12;StdP13;StdP14;StdP15;StdP16;StdP17;StdP18;StdP19;StdP20;0;0];
Flexion_MVC = [FlexP1;FlexP2;FlexP3;FlexP4;FlexP5;FlexP6;FlexP7;FlexP8;FlexP9;FlexP10;FlexP11;FlexP12;FlexP13;FlexP14;FlexP15;FlexP16;FlexP17;FlexP18;FlexP19;FlexP20;Mean_Flexion;Std_Flexion];
Extension_MVC = [ExtP1;ExtP2;ExtP3;ExtP4;ExtP5;ExtP6;ExtP7;ExtP8;ExtP9;ExtP10;ExtP11;ExtP12;ExtP13;ExtP14;ExtP15;ExtP16;ExtP17;ExtP18;ExtP19;ExtP20;Mean_Extension;Std_Extension];
Moment_Arm = [LP1;LP2;LP3;LP4;LP5;LP6;LP7;LP8;LP9;LP10;LP11;LP12;LP13;LP14;LP15;LP16;LP17;LP18;LP19;LP20;Mean_Length;Std_Length];
Cuff_Angle = [AgP1;AgP2;AgP3;AgP4;AgP5;AgP6;AgP7;AgP8;AgP9;AgP10;AgP11;AgP12;AgP13;AgP14;AgP15;AgP16;AgP17;AgP18;AgP19;AgP20;Mean_Angle;Std_Angle];
Results = table(Participants,Age,Sex,Dominant,Weight,Height,Flexion_MVC,Extension_MVC,LengthCheck,Setting,Moment,SD,Moment_Arm,Cuff_Angle)

Ps = [1:1:20];
sz = size(Ps);
D = 0.94*ones(sz);

figure(2)
errorbar(Ps,Av,Std,'o',"LineStyle","none",'linewidth',1.5);
hold on 
plot(Ps,D,'linewidth',1);
hold off
xlim([0 21])
xticks(1:1:20)
xlabel('Participant Number')
ylabel('Moment (Nm)')
fontsize(16,'points')
legend('Participants','Mean')

figure(3)
scatter(Moment,Cuff_Angle,'filled')
ylabel('Change in cuff angle on pressurisation (Degrees)')
xlabel('Fixed Angle Bending Moment (Nm)')
fontsize(16,'points')

corrcoef(Moment,Cuff_Angle)
