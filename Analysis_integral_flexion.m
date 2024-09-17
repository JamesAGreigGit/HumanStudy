clear
clc
close all
%Read matrix files from folder
data = readmatrix('Flexion.txt');

%Collect sample rate and elbow flexion angle
Sample = data(:,1);
Time = Sample/100;
FlexionAngleRaw = abs(data(:,8));
FlexionAngle = smoothdata(FlexionAngleRaw,'gaussian',300);

%Apply Gaussian filter to pressure and force
Gauss = smoothdata(data(:,6:7),'gaussian',50);

%Pressure Function
PressureV = Gauss(:,1);
pmax = 30;
pmin = -30;
Vs = 5;

func2 = @(x) (x * ((pmax - pmin)/(0.8 * Vs)) - (0.1 * Vs) + pmin - 3.54)*6.89476;
Pressure = arrayfun(func2,PressureV);

%Apply Butterworth Filter to EMG
%Slope of 12dB/Oct
n = 2;
%Filter frequency 20 Hz
wn = [20/1000 450/1000];
[b,a] = butter(n,wn,'bandpass');
Butterworth = filter(b,a,data(:,3:5));

%Define EMG variables to plot
EMG_A = Butterworth(:,1);
EMG_B = Butterworth(:,2);
EMG_C = Butterworth(:,3);
%EMG_D = Butterworth(:,4);

%Apply moving RMS 
movrmsWin = dsp.MovingRMS(100);
RMS_A = movrmsWin(EMG_A);
RMS_B = movrmsWin(EMG_B);
RMS_C = movrmsWin(EMG_C);
%RMS_D = movrmsWin(EMG_D);
RMS_Flex = RMS_B + RMS_C;

%Read text file with max MVC for each muscle
MVC_Max = readmatrix('MVC_Max.txt');
MVC_A =   MVC_Max(1);
MVC_B =   MVC_Max(2);
MVC_C =   MVC_Max(3);

%Define EMG relative to MVC for each muscle
rel_A = (RMS_A/MVC_A)*100;
rel_B = (RMS_B/MVC_B)*100;
rel_C = (RMS_C/MVC_C)*100;

%Import markers from text file, defined in Results_flexion
Markers = readmatrix('Markers.txt');
T1 = Markers(1);
T2 = Markers(2);
T3 = Markers(3);
T4 = Markers(4);
T5 = Markers(5);
T6 = Markers(6);

%Interval time (time for 5 reps) for each flexion movement
Ti = 688;
Time_1 = Time(T1:(T1+10*Ti));
Time_1a = Time(T1:(T1+Ti));
Time_1b = Time((T1+2*Ti):(T1+3*Ti));
Time_1c = Time((T1+4*Ti):(T1+5*Ti));
Time_1d = Time((T1+6*Ti):(T1+7*Ti));
Time_1e = Time((T1+8*Ti):(T1+9*Ti));
Time_2 = Time(T2:(T2+10*Ti));
Time_2a = Time(T2:(T2+Ti));
Time_2b = Time((T2+2*Ti):(T2+3*Ti));
Time_2c = Time((T2+4*Ti):(T2+5*Ti));
Time_2d = Time((T2+6*Ti):(T2+7*Ti));
Time_2e = Time((T2+8*Ti):(T2+9*Ti));
Time_3 = Time(T3:(T3+10*Ti));
Time_3a = Time(T3:(T3+Ti));
Time_3b = Time((T3+2*Ti):(T3+3*Ti));
Time_3c = Time((T3+4*Ti):(T3+5*Ti));
Time_3d = Time((T3+6*Ti):(T3+7*Ti));
Time_3e = Time((T3+8*Ti):(T3+9*Ti));
Time_4 = Time(T4:(T4+10*Ti));
Time_4a = Time(T4:(T4+Ti));
Time_4b = Time((T4+2*Ti):(T4+3*Ti));
Time_4c = Time((T4+4*Ti):(T4+5*Ti));
Time_4d = Time((T4+6*Ti):(T4+7*Ti));
Time_4e = Time((T4+8*Ti):(T4+9*Ti));

Time_5 = Time(T5:(T5+10*Ti));
Time_5a = Time(T5:(T5+Ti));
Time_5b = Time((T5+2*Ti):(T5+3*Ti));
Time_5c = Time((T5+4*Ti):(T5+5*Ti));
Time_5d = Time((T5+6*Ti):(T5+7*Ti));
Time_5e = Time((T5+8*Ti):(T5+9*Ti));
Time_6 = Time(T6:(T6+10*Ti));
Time_6a = Time(T6:(T6+Ti));
Time_6b = Time((T6+2*Ti):(T6+3*Ti));
Time_6c = Time((T6+4*Ti):(T6+5*Ti));
Time_6d = Time((T6+6*Ti):(T6+7*Ti));
Time_6e = Time((T6+8*Ti):(T6+9*Ti));

%Elbow flexion angle for time steps
EF_1 = FlexionAngle(T1:(T1+10*Ti));
EF_2 = FlexionAngle(T2:(T2+10*Ti));
EF_3 = FlexionAngle(T3:(T3+10*Ti));
EF_4 = FlexionAngle(T4:(T4+10*Ti));
EF_5 = FlexionAngle(T5:(T5+10*Ti));
EF_6 = FlexionAngle(T6:(T6+10*Ti));

%Define EMG C for each flexion movement
Mov_1B = rel_B(T1:(T1+10*Ti));
Mov_1Ba = rel_B(T1:(T1+Ti));
Mov_1Bb = rel_B((T1+2*Ti):(T1+3*Ti));
Mov_1Bc = rel_B((T1+4*Ti):(T1+5*Ti));
Mov_1Bd = rel_B((T1+6*Ti):(T1+7*Ti));
Mov_1Be = rel_B((T1+8*Ti):(T1+9*Ti));
Mov_2B = rel_B(T2:(T2+10*Ti));
Mov_2Ba = rel_B(T2:(T2+Ti));
Mov_2Bb = rel_B((T2+2*Ti):(T2+3*Ti));
Mov_2Bc = rel_B((T2+4*Ti):(T2+5*Ti));
Mov_2Bd = rel_B((T2+6*Ti):(T2+7*Ti));
Mov_2Be = rel_B((T2+8*Ti):(T2+9*Ti));
Mov_3B = rel_B(T3:(T3+10*Ti));
Mov_3Ba = rel_B(T3:(T3+Ti));
Mov_3Bb = rel_B((T3+2*Ti):(T3+3*Ti));
Mov_3Bc = rel_B((T3+4*Ti):(T3+5*Ti));
Mov_3Bd = rel_B((T3+6*Ti):(T3+7*Ti));
Mov_3Be = rel_B((T3+8*Ti):(T3+9*Ti));
Mov_4B = rel_B(T4:(T4+10*Ti));
Mov_4Ba = rel_B(T4:(T4+Ti));
Mov_4Bb = rel_B((T4+2*Ti):(T4+3*Ti));
Mov_4Bc = rel_B((T4+4*Ti):(T4+5*Ti));
Mov_4Bd = rel_B((T4+6*Ti):(T4+7*Ti));
Mov_4Be = rel_B((T4+8*Ti):(T4+9*Ti));

Mov_5B = rel_B(T5:(T5+10*Ti));
Mov_5Ba = rel_B(T5:(T5+Ti));
Mov_5Bb = rel_B((T5+2*Ti):(T5+3*Ti));
Mov_5Bc = rel_B((T5+4*Ti):(T5+5*Ti));
Mov_5Bd = rel_B((T5+6*Ti):(T5+7*Ti));
Mov_5Be = rel_B((T5+8*Ti):(T5+9*Ti));
Mov_6B = rel_B(T6:(T6+10*Ti));
Mov_6Ba = rel_B(T6:(T6+Ti));
Mov_6Bb = rel_B((T6+2*Ti):(T6+3*Ti));
Mov_6Bc = rel_B((T6+4*Ti):(T6+5*Ti));
Mov_6Bd = rel_B((T6+6*Ti):(T6+7*Ti));
Mov_6Be = rel_B((T6+8*Ti):(T6+9*Ti));

%Define EMG C for each flexion movement
Mov_1C = rel_C(T1:(T1+10*Ti));
Mov_1Ca = rel_C(T1:(T1+Ti));
Mov_1Cb = rel_C((T1+2*Ti):(T1+3*Ti));
Mov_1Cc = rel_C((T1+4*Ti):(T1+5*Ti));
Mov_1Cd = rel_C((T1+6*Ti):(T1+7*Ti));
Mov_1Ce = rel_C((T1+8*Ti):(T1+9*Ti));
Mov_2C = rel_C(T2:(T2+10*Ti));
Mov_2Ca = rel_C(T2:(T2+Ti));
Mov_2Cb = rel_C((T2+2*Ti):(T2+3*Ti));
Mov_2Cc = rel_C((T2+4*Ti):(T2+5*Ti));
Mov_2Cd = rel_C((T2+6*Ti):(T2+7*Ti));
Mov_2Ce = rel_C((T2+8*Ti):(T2+9*Ti));
Mov_3C = rel_C(T3:(T3+10*Ti));
Mov_3Ca = rel_C(T3:(T3+Ti));
Mov_3Cb = rel_C((T3+2*Ti):(T3+3*Ti));
Mov_3Cc = rel_C((T3+4*Ti):(T3+5*Ti));
Mov_3Cd = rel_C((T3+6*Ti):(T3+7*Ti));
Mov_3Ce = rel_C((T3+8*Ti):(T3+9*Ti));
Mov_4C = rel_C(T4:(T4+10*Ti));
Mov_4Ca = rel_C(T4:(T4+Ti));
Mov_4Cb = rel_C((T4+2*Ti):(T4+3*Ti));
Mov_4Cc = rel_C((T4+4*Ti):(T4+5*Ti));
Mov_4Cd = rel_C((T4+6*Ti):(T4+7*Ti));
Mov_4Ce = rel_C((T4+8*Ti):(T4+9*Ti));

Mov_5C = rel_C(T5:(T5+10*Ti));
Mov_5Ca = rel_C(T5:(T5+Ti));
Mov_5Cb = rel_C((T5+2*Ti):(T5+3*Ti));
Mov_5Cc = rel_C((T5+4*Ti):(T5+5*Ti));
Mov_5Cd = rel_C((T5+6*Ti):(T5+7*Ti));
Mov_5Ce = rel_C((T5+8*Ti):(T5+9*Ti));
Mov_6C = rel_C(T6:(T6+10*Ti));
Mov_6Ca = rel_C(T6:(T6+Ti));
Mov_6Cb = rel_C((T6+2*Ti):(T6+3*Ti));
Mov_6Cc = rel_C((T6+4*Ti):(T6+5*Ti));
Mov_6Cd = rel_C((T6+6*Ti):(T6+7*Ti));
Mov_6Ce = rel_C((T6+8*Ti):(T6+9*Ti));

% Triceps EMG relative to MVC
Mov_1A = rel_A(T1:(T1+10*Ti));
Mov_2A = rel_A(T2:(T2+10*Ti));
Mov_3A = rel_A(T3:(T3+10*Ti));
Mov_4A = rel_A(T4:(T4+10*Ti));
Mov_5A = rel_A(T5:(T5+10*Ti));
Mov_6A = rel_A(T6:(T6+10*Ti));

%Integrate under EMG for each flexion movement
Int_B_1a = trapz(Time_1a,Mov_1Ba);
Int_B_1b = trapz(Time_1b,Mov_1Bb);
Int_B_1c = trapz(Time_1c,Mov_1Bc);
Int_B_1d = trapz(Time_1d,Mov_1Bd);
Int_B_1e = trapz(Time_1e,Mov_1Be);
Int_B_1 = (Int_B_1a + Int_B_1b + Int_B_1c + Int_B_1d + Int_B_1e);

%Find peaks for each flexion movement
Max1Ba = max(Mov_1Ba);
[~,x] = max(Mov_1Ba);
T1Ba = Time_1a(x,:);
Max1Bb = max(Mov_1Bb);
[~,y] = max(Mov_1Bb);
T1Bb = Time_1b(y,:);
Max1Bc = max(Mov_1Bc);
[~,z] = max(Mov_1Bc);
T1Bc = Time_1c(z,:);
Max1Bd = max(Mov_1Bd);
[~,a] = max(Mov_1Bd);
T1Bd = Time_1d(a,:);
Max1Be = max(Mov_1Be);
[~,b] = max(Mov_1Be);
T1Be = Time_1e(b,:);
Max1B = [Max1Ba Max1Bb Max1Bc Max1Bd Max1Be];
T1B = [T1Ba T1Bb T1Bc T1Bd T1Be];

Max1Ca = max(Mov_1Ca);
[~,x] = max(Mov_1Ca);
T1Ca = Time_1a(x,:);
Max1Cb = max(Mov_1Cb);
[~,x] = max(Mov_1Cb);
T1Cb = Time_1b(x,:);
Max1Cc = max(Mov_1Cc);
[~,x] = max(Mov_1Cc);
T1Cc = Time_1c(x,:);
Max1Cd = max(Mov_1Cd);
[~,x] = max(Mov_1Cd);
T1Cd = Time_1d(x,:);
Max1Ce = max(Mov_1Ce);
[~,x] = max(Mov_1Ce);
T1Ce = Time_1e(x,:);
Max1C = [Max1Ca Max1Cb Max1Cc Max1Cd Max1Ce];
T1C = [T1Ca T1Cb T1Cc T1Cd T1Ce];

Max2Ba = max(Mov_2Ba);
[~,x] = max(Mov_2Ba);
T2Ba = Time_2a(x,:);
Max2Bb = max(Mov_2Bb);
[~,y] = max(Mov_2Bb);
T2Bb = Time_2b(y,:);
Max2Bc = max(Mov_2Bc);
[~,z] = max(Mov_2Bc);
T2Bc = Time_2c(z,:);
Max2Bd = max(Mov_2Bd);
[~,a] = max(Mov_2Bd);
T2Bd = Time_2d(a,:);
Max2Be = max(Mov_2Be);
[~,b] = max(Mov_2Be);
T2Be = Time_2e(b,:);
Max2B = [Max2Ba Max2Bb Max2Bc Max2Bd Max2Be];
T2B = [T2Ba T2Bb T2Bc T2Bd T2Be];

Max2Ca = max(Mov_2Ca);
[~,x] = max(Mov_2Ca);
T2Ca = Time_2a(x,:);
Max2Cb = max(Mov_2Cb);
[~,x] = max(Mov_2Cb);
T2Cb = Time_2b(x,:);
Max2Cc = max(Mov_2Cc);
[~,x] = max(Mov_2Cc);
T2Cc = Time_2c(x,:);
Max2Cd = max(Mov_2Cd);
[~,x] = max(Mov_2Cd);
T2Cd = Time_2d(x,:);
Max2Ce = max(Mov_2Ce);
[~,x] = max(Mov_2Ce);
T2Ce = Time_2e(x,:);
Max2C = [Max2Ca Max2Cb Max2Cc Max2Cd Max2Ce];
T2C = [T2Ca T2Cb T2Cc T2Cd T2Ce];

Max3Ba = max(Mov_3Ba);
[~,x] = max(Mov_3Ba);
T3Ba = Time_3a(x,:);
Max3Bb = max(Mov_3Bb);
[~,y] = max(Mov_3Bb);
T3Bb = Time_3b(y,:);
Max3Bc = max(Mov_3Bc);
[~,z] = max(Mov_3Bc);
T3Bc = Time_3c(z,:);
Max3Bd = max(Mov_3Bd);
[~,a] = max(Mov_3Bd);
T3Bd = Time_3d(a,:);
Max3Be = max(Mov_3Be);
[~,b] = max(Mov_3Be);
T3Be = Time_3e(b,:);
Max3B = [Max3Ba Max3Bb Max3Bc Max3Bd Max3Be];
T3B = [T3Ba T3Bb T3Bc T3Bd T3Be];

Max3Ca = max(Mov_3Ca);
[~,x] = max(Mov_3Ca);
T3Ca = Time_3a(x,:);
Max3Cb = max(Mov_3Cb);
[~,x] = max(Mov_3Cb);
T3Cb = Time_3b(x,:);
Max3Cc = max(Mov_3Cc);
[~,x] = max(Mov_3Cc);
T3Cc = Time_3c(x,:);
Max3Cd = max(Mov_3Cd);
[~,x] = max(Mov_3Cd);
T3Cd = Time_3d(x,:);
Max3Ce = max(Mov_3Ce);
[~,x] = max(Mov_3Ce);
T3Ce = Time_3e(x,:);
Max3C = [Max3Ca Max3Cb Max3Cc Max3Cd Max3Ce];
T3C = [T3Ca T3Cb T3Cc T3Cd T3Ce];

Max4Ba = max(Mov_4Ba);
[~,x] = max(Mov_4Ba);
T4Ba = Time_4a(x,:);
Max4Bb = max(Mov_4Bb);
[~,y] = max(Mov_4Bb);
T4Bb = Time_4b(y,:);
Max4Bc = max(Mov_4Bc);
[~,z] = max(Mov_4Bc);
T4Bc = Time_4c(z,:);
Max4Bd = max(Mov_4Bd);
[~,a] = max(Mov_4Bd);
T4Bd = Time_4d(a,:);
Max4Be = max(Mov_4Be);
[~,b] = max(Mov_4Be);
T4Be = Time_4e(b,:);
Max4B = [Max4Ba Max4Bb Max4Bc Max4Bd Max4Be];
T4B = [T4Ba T4Bb T4Bc T4Bd T4Be];

Max4Ca = max(Mov_4Ca);
[~,x] = max(Mov_4Ca);
T4Ca = Time_4a(x,:);
Max4Cb = max(Mov_4Cb);
[~,x] = max(Mov_4Cb);
T4Cb = Time_4b(x,:);
Max4Cc = max(Mov_4Cc);
[~,x] = max(Mov_4Cc);
T4Cc = Time_4c(x,:);
Max4Cd = max(Mov_4Cd);
[~,x] = max(Mov_4Cd);
T4Cd = Time_4d(x,:);
Max4Ce = max(Mov_4Ce);
[~,x] = max(Mov_4Ce);
T4Ce = Time_4e(x,:);
Max4C = [Max4Ca Max4Cb Max4Cc Max4Cd Max4Ce];
T4C = [T4Ca T4Cb T4Cc T4Cd T4Ce];

Max5Ba = max(Mov_5Ba);
[~,x] = max(Mov_5Ba);
T5Ba = Time_5a(x,:);
Max5Bb = max(Mov_5Bb);
[~,y] = max(Mov_5Bb);
T5Bb = Time_5b(y,:);
Max5Bc = max(Mov_5Bc);
[~,z] = max(Mov_5Bc);
T5Bc = Time_5c(z,:);
Max5Bd = max(Mov_5Bd);
[~,a] = max(Mov_5Bd);
T5Bd = Time_5d(a,:);
Max5Be = max(Mov_5Be);
[~,b] = max(Mov_5Be);
T5Be = Time_5e(b,:);
Max5B = [Max5Ba Max5Bb Max5Bc Max5Bd Max5Be];
T5B = [T5Ba T5Bb T5Bc T5Bd T5Be];

Max5Ca = max(Mov_5Ca);
[~,x] = max(Mov_5Ca);
T5Ca = Time_5a(x,:);
Max5Cb = max(Mov_5Cb);
[~,x] = max(Mov_5Cb);
T5Cb = Time_5b(x,:);
Max5Cc = max(Mov_5Cc);
[~,x] = max(Mov_5Cc);
T5Cc = Time_5c(x,:);
Max5Cd = max(Mov_5Cd);
[~,x] = max(Mov_5Cd);
T5Cd = Time_5d(x,:);
Max5Ce = max(Mov_5Ce);
[~,x] = max(Mov_5Ce);
T5Ce = Time_5e(x,:);
Max5C = [Max5Ca Max5Cb Max5Cc Max5Cd Max5Ce];
T5C = [T5Ca T5Cb T5Cc T5Cd T5Ce];

Max6Ba = max(Mov_6Ba);
[~,x] = max(Mov_6Ba);
T6Ba = Time_6a(x,:);
Max6Bb = max(Mov_6Bb);
[~,y] = max(Mov_6Bb);
T6Bb = Time_6b(y,:);
Max6Bc = max(Mov_6Bc);
[~,z] = max(Mov_6Bc);
T6Bc = Time_6c(z,:);
Max6Bd = max(Mov_6Bd);
[~,a] = max(Mov_6Bd);
T6Bd = Time_6d(a,:);
Max6Be = max(Mov_6Be);
[~,b] = max(Mov_6Be);
T6Be = Time_6e(b,:);
Max6B = [Max6Ba Max6Bb Max6Bc Max6Bd Max6Be];
T6B = [T6Ba T6Bb T6Bc T6Bd T6Be];

Max6Ca = max(Mov_6Ca);
[~,x] = max(Mov_6Ca);
T6Ca = Time_6a(x,:);
Max6Cb = max(Mov_6Cb);
[~,x] = max(Mov_6Cb);
T6Cb = Time_6b(x,:);
Max6Cc = max(Mov_6Cc);
[~,x] = max(Mov_6Cc);
T6Cc = Time_6c(x,:);
Max6Cd = max(Mov_6Cd);
[~,x] = max(Mov_6Cd);
T6Cd = Time_6d(x,:);
Max6Ce = max(Mov_6Ce);
[~,x] = max(Mov_6Ce);
T6Ce = Time_6e(x,:);
Max6C = [Max6Ca Max6Cb Max6Cc Max6Cd Max6Ce];
T6C = [T6Ca T6Cb T6Cc T6Cd T6Ce];


Int_B_2a = trapz(Time_2a,Mov_2Ba);
Int_B_2b = trapz(Time_2b,Mov_2Bb);
Int_B_2c = trapz(Time_2c,Mov_2Bc);
Int_B_2d = trapz(Time_2d,Mov_2Bd);
Int_B_2e = trapz(Time_2e,Mov_2Be);
Int_B_2 = (Int_B_2a + Int_B_2b + Int_B_2c + Int_B_2d + Int_B_2e);

Int_B_3a = trapz(Time_3a,Mov_3Ba);
Int_B_3b = trapz(Time_3b,Mov_3Bb);
Int_B_3c = trapz(Time_3c,Mov_3Bc);
Int_B_3d = trapz(Time_3d,Mov_3Bd);
Int_B_3e = trapz(Time_3e,Mov_3Be);
Int_B_3 = (Int_B_3a + Int_B_3b + Int_B_3c + Int_B_3d + Int_B_3e);

Int_B_4a = trapz(Time_4a,Mov_4Ba);
Int_B_4b = trapz(Time_4b,Mov_4Bb);
Int_B_4c = trapz(Time_4c,Mov_4Bc);
Int_B_4d = trapz(Time_4d,Mov_4Bd);
Int_B_4e= trapz(Time_4e,Mov_4Be);
Int_B_4 = (Int_B_4a + Int_B_4b + Int_B_4c + Int_B_4d + Int_B_4e);

Int_B_5a = trapz(Time_5a,Mov_5Ba);
Int_B_5b = trapz(Time_5b,Mov_5Bb);
Int_B_5c = trapz(Time_5c,Mov_5Bc);
Int_B_5d = trapz(Time_5d,Mov_5Bd);
Int_B_5e = trapz(Time_5e,Mov_5Be);
Int_B_5 = (Int_B_5a + Int_B_5b + Int_B_5c + Int_B_5d + Int_B_5e);

Int_B_6a = trapz(Time_6a,Mov_6Ba);
Int_B_6b = trapz(Time_6b,Mov_6Bb);
Int_B_6c = trapz(Time_6c,Mov_6Bc);
Int_B_6d = trapz(Time_6d,Mov_6Bd);
Int_B_6e = trapz(Time_6e,Mov_6Be);
Int_B_6 = (Int_B_6a + Int_B_6b + Int_B_6c + Int_B_6d + Int_B_6e);

Int_B = [Int_B_1 Int_B_2; Int_B_3 Int_B_4; Int_B_5 Int_B_6];

Int_C_1a = trapz(Time_1a,Mov_1Ca);
Int_C_1b = trapz(Time_1b,Mov_1Cb);
Int_C_1c = trapz(Time_1c,Mov_1Cc);
Int_C_1d = trapz(Time_1d,Mov_1Cd);
Int_C_1e = trapz(Time_1e,Mov_1Ce);
Int_C_1 = (Int_C_1a + Int_C_1b + Int_C_1c + Int_C_1d + Int_C_1e);

Int_C_2a = trapz(Time_2a,Mov_2Ca);
Int_C_2b = trapz(Time_2b,Mov_2Cb);
Int_C_2c = trapz(Time_2c,Mov_2Cc);
Int_C_2d = trapz(Time_2d,Mov_2Cd);
Int_C_2e = trapz(Time_2e,Mov_2Ce);
Int_C_2 = (Int_C_2a + Int_C_2b + Int_C_2c + Int_C_2d + Int_C_2e);

Int_C_3a = trapz(Time_3a,Mov_3Ca);
Int_C_3b = trapz(Time_3b,Mov_3Cb);
Int_C_3c = trapz(Time_3c,Mov_3Cc);
Int_C_3d = trapz(Time_3d,Mov_3Cd);
Int_C_3e = trapz(Time_3e,Mov_3Ce);
Int_C_3 = (Int_C_3a + Int_C_3b + Int_C_3c + Int_C_3d + Int_C_3e);

Int_C_4a = trapz(Time_4a,Mov_4Ca);
Int_C_4b = trapz(Time_4b,Mov_4Cb);
Int_C_4c = trapz(Time_4c,Mov_4Cc);
Int_C_4d = trapz(Time_4d,Mov_4Cd);
Int_C_4e= trapz(Time_4e,Mov_4Ce);
Int_C_4 = (Int_C_4a + Int_C_4b + Int_C_4c + Int_C_4d + Int_C_4e);

Int_C_5a = trapz(Time_5a,Mov_5Ca);
Int_C_5b = trapz(Time_5b,Mov_5Cb);
Int_C_5c = trapz(Time_5c,Mov_5Cc);
Int_C_5d = trapz(Time_5d,Mov_5Cd);
Int_C_5e = trapz(Time_5e,Mov_5Ce);
Int_C_5 = (Int_C_5a + Int_C_5b + Int_C_5c + Int_C_5d + Int_C_5e);

Int_C_6a = trapz(Time_6a,Mov_6Ca);
Int_C_6b = trapz(Time_6b,Mov_6Cb);
Int_C_6c = trapz(Time_6c,Mov_6Cc);
Int_C_6d = trapz(Time_6d,Mov_6Cd);
Int_C_6e = trapz(Time_6e,Mov_6Ce);
Int_C_6 = (Int_C_6a + Int_C_6b + Int_C_6c + Int_C_6d + Int_C_6e);

Int_C = [Int_C_1 Int_C_2; Int_C_3 Int_C_4; Int_C_5 Int_C_6];

%Create matrix for flexion integrals
Int_Flex = [Int_B_1 Int_C_1; Int_B_2 Int_C_2; Int_B_3 Int_C_3; Int_B_4 Int_C_4; Int_B_5 Int_C_5; Int_B_6 Int_C_6];

% Colour codes
b = [0 0.4470 0.7410];
r = [0.8500 0.3250 0.0980];

figure(1)
max_EMG = 100;
subplot(6,1,1)
hold on
plot(Time_1,Mov_1B,Time_1,Mov_1C)
plot(Time_1,Mov_1A,'color',"#77AC30")
scatter(T1B,Max1B,'filled','Markerfacecolor','b');
scatter(T1C,Max1C,'filled','Markerfacecolor','r');
area(Time_1a,Mov_1Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_1a,Mov_1Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_1b,Mov_1Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_1b,Mov_1Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_1c,Mov_1Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_1c,Mov_1Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_1d,Mov_1Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_1d,Mov_1Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_1e,Mov_1Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_1e,Mov_1Ce,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
xlim([min(Time_1) max(Time_1)])
ylim([0 max_EMG])
ylabel('0 kg No Assistance')
set(get(gca,'ylabel'),'rotation',0)
%legend('Biceps','Brachioradialis','Triceps','Elbow Flexion Angle','location','northoutside','Orientation','horizontal')
yyaxis right
plot(Time_1,EF_1,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')

subplot(6,1,2)
hold on
plot(Time_2,Mov_2B,Time_2,Mov_2C)
hold on
plot(Time_2,Mov_2A,'color',"#77AC30")
scatter(T2B,Max2B,'filled','Markerfacecolor','b');
scatter(T2C,Max2C,'filled','Markerfacecolor','r');
area(Time_2a,Mov_2Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_2a,Mov_2Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_2b,Mov_2Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_2b,Mov_2Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_2c,Mov_2Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_2c,Mov_2Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_2d,Mov_2Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_2d,Mov_2Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_2e,Mov_2Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_2e,Mov_2Ce,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
xlim([min(Time_2) max(Time_2)])
ylim([0 max_EMG])
ylabel('0 kg Assisted')
set(get(gca,'ylabel'),'rotation',0)
yyaxis right
plot(Time_2,EF_2,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')

subplot(6,1,3)
hold on
plot(Time_3,Mov_3B,Time_3,Mov_3C)
hold on
plot(Time_3,Mov_3A,'color',"#77AC30")
scatter(T3B,Max3B,'filled','Markerfacecolor','b');
scatter(T3C,Max3C,'filled','Markerfacecolor','r');
area(Time_3a,Mov_3Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_3a,Mov_3Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_3b,Mov_3Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_3b,Mov_3Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_3c,Mov_3Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_3c,Mov_3Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_3d,Mov_3Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_3d,Mov_3Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_3e,Mov_3Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_3e,Mov_3Ce,'FaceColor',[0.8500 0.3350 0.0980],'EdgeColor',[0.8500 0.3350 0.0980],'FaceAlpha',0.5)
xlim([min(Time_3) max(Time_3)])
ylim([0 max_EMG])
ylabel('1 kg No Assistance')
set(get(gca,'ylabel'),'rotation',0)
yyaxis right
plot(Time_3,EF_3,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')

subplot(6,1,4)
hold on
plot(Time_4,Mov_4B,Time_4,Mov_4C)
hold on
plot(Time_4,Mov_4A,'color',"#77AC30")
scatter(T4B,Max4B,'filled','Markerfacecolor','b');
scatter(T4C,Max4C,'filled','Markerfacecolor','r');
area(Time_4a,Mov_4Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_4a,Mov_4Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_4b,Mov_4Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_4b,Mov_4Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_4c,Mov_4Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_4c,Mov_4Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_4d,Mov_4Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_4d,Mov_4Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_4e,Mov_4Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_4e,Mov_4Ce,'FaceColor',[0.8500 0.3350 0.0980],'EdgeColor',[0.8500 0.3350 0.0980],'FaceAlpha',0.5)
xlim([min(Time_4) max(Time_4)])
ylim([0 max_EMG])
ylabel('1 kg Assisted')
set(get(gca,'ylabel'),'rotation',0)
yyaxis right
plot(Time_4,EF_4,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')

subplot(6,1,5)
hold on 
plot(Time_5,Mov_5B,Time_5,Mov_5C)
hold on
plot(Time_5,Mov_5A,'color',"#77AC30")
scatter(T5B,Max5B,'filled','Markerfacecolor','b');
scatter(T5C,Max5C,'filled','Markerfacecolor','r');
area(Time_5a,Mov_5Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_5a,Mov_5Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_5b,Mov_5Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_5b,Mov_5Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_5c,Mov_5Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_5c,Mov_5Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_5d,Mov_5Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_5d,Mov_5Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_5e,Mov_5Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_5e,Mov_5Ce,'FaceColor',[0.8500 0.3350 0.0980],'EdgeColor',[0.8500 0.3350 0.0980],'FaceAlpha',0.5)
xlim([min(Time_5) max(Time_5)])
ylim([0 max_EMG])
ylabel('2 kg No Assistance')
set(get(gca,'ylabel'),'rotation',0)
yyaxis right
plot(Time_5,EF_5,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')

subplot(6,1,6)
hold on
plot(Time_6,Mov_6B,Time_6,Mov_6C)
hold on
plot(Time_6,Mov_6A,'color',"#77AC30")
scatter(T6B,Max6B,'filled','Markerfacecolor','b');
scatter(T6C,Max6C,'filled','Markerfacecolor','r');
area(Time_6a,Mov_6Ba,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_6a,Mov_6Ca,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_6b,Mov_6Bb,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_6b,Mov_6Cb,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_6c,Mov_6Bc,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_6c,Mov_6Cc,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_6d,Mov_6Bd,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_6d,Mov_6Cd,'FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5)
area(Time_6e,Mov_6Be,'FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5)
area(Time_6e,Mov_6Ce,'FaceColor',[0.8500 0.3350 0.0980],'EdgeColor',[0.8500 0.3350 0.0980],'FaceAlpha',0.5)
xlim([min(Time_6) max(Time_6)])
ylabel('2 kg Assisted')
set(get(gca,'ylabel'),'rotation',0)
fontsize(12,'points')
ylim([0 max_EMG])
xlabel('Time (Seconds)')
yyaxis right
plot(Time_6,EF_6,'color','magenta')
ylim([0 180])
%ylabel('EFA (Deg)')


figure(2)
X = categorical({'0 kg No Assistance','0 kg Assisted','1 kg No Assistance','1 kg Assisted','2 kg No Assistance','2 kg Assisted'});
X = reordercats(X,{'0 kg No Assistance','0 kg Assisted','1 kg No Assistance','1 kg Assisted','2 kg No Assistance','2 kg Assisted'});
bar(X,Int_Flex,'stacked')
set(gca, 'YTick', [])
legend({'Biceps','Brachioradialis'},'Location','northwest')
fontsize(16,'points')
title('Integrated Values')

Total_Reduction_0kg = (((Int_B_1 + Int_C_1) - (Int_B_2 + Int_C_2))/(Int_B_1 + Int_C_1))*100
BRD_Reduction_0kg = ((Int_C_1 - Int_C_2)/Int_C_1)*100
BIC_Reduction_0kg = ((Int_B_1 - Int_B_2)/Int_B_1)*100
Total_Reduction_1kg = (((Int_B_3 + Int_C_3) - (Int_B_4 + Int_C_4))/(Int_B_3 + Int_C_3))*100
BRD_Reduction_1kg = ((Int_C_3 - Int_C_4)/Int_C_3)*100
BIC_Reduction_1kg = ((Int_B_3 - Int_B_4)/Int_B_3)*100
Total_Reduction_2kg = (((Int_B_5 + Int_C_5) - (Int_B_6 + Int_C_6))/(Int_B_5 + Int_C_5))*100
BRD_Reduction_2kg = ((Int_C_5 - Int_C_6)/Int_C_5)*100
BIC_Reduction_2kg = ((Int_B_5 - Int_B_6)/Int_B_5)*100

Totals = [Total_Reduction_0kg BRD_Reduction_0kg BIC_Reduction_0kg;Total_Reduction_1kg BRD_Reduction_1kg BIC_Reduction_1kg; Total_Reduction_2kg BRD_Reduction_2kg BIC_Reduction_2kg];
writematrix(Totals)

BIC_Peak_Reduction_0kg = ((mean(Max1B)-mean(Max2B))/mean(Max1B))*100
BRD_Peak_Reduction_0kg = ((mean(Max1C)-mean(Max2C))/mean(Max1C))*100
Total_Peak_Reduction_0kg = ((mean(Max1B)-mean(Max2B)) + ((mean(Max1C)-mean(Max2C)))) / ((mean(Max1B))+(mean(Max1C)))*100

BIC_Peak_Reduction_1kg = ((mean(Max3B)-mean(Max4B))/mean(Max3B))*100
BRD_Peak_Reduction_1kg = ((mean(Max3C)-mean(Max4C))/mean(Max3C))*100
Total_Peak_Reduction_1kg = ((mean(Max3B)-mean(Max4B)) + ((mean(Max3C)-mean(Max4C)))) / ((mean(Max3B))+(mean(Max3C)))*100

BIC_Peak_Reduction_2kg = ((mean(Max5B)-mean(Max6B))/mean(Max5B))*100
BRD_Peak_Reduction_2kg = ((mean(Max5C)-mean(Max6C))/mean(Max5C))*100
Total_Peak_Reduction_2kg = ((mean(Max5B)-mean(Max6B)) + ((mean(Max5C)-mean(Max6C)))) / ((mean(Max5B))+(mean(Max5C)))*100

Peaks = [Total_Peak_Reduction_0kg BIC_Peak_Reduction_0kg BRD_Peak_Reduction_0kg;Total_Peak_Reduction_1kg BIC_Peak_Reduction_1kg BRD_Peak_Reduction_1kg;Total_Peak_Reduction_2kg BIC_Peak_Reduction_2kg BRD_Peak_Reduction_2kg];
writematrix(Peaks)

Peak_Flex = [mean(Max1B) mean(Max1C) ; mean(Max2B) mean(Max2C) ; mean(Max3B) mean(Max3C) ; mean(Max4B) mean(Max4C) ;mean(Max5B) mean(Max5C) ; mean(Max6B) mean(Max6C)];
Peak_BIC = Peak_Flex(:,1);
Peak_BRD = Peak_Flex(:,2);

figure(3)
X = categorical({'0 kg No Assistance','0 kg Assisted','1 kg No Assistance','1 kg Assisted','2 kg No Assistance','2 kg Assisted'});
X = reordercats(X,{'0 kg No Assistance','0 kg Assisted','1 kg No Assistance','1 kg Assisted','2 kg No Assistance','2 kg Assisted'});
bar(X,Peak_Flex,'stacked')
set(gca, 'YTick', [])
legend({'Biceps','Brachioradialis'},'Location','northwest')
fontsize(16,'points')
title('Peak Values')
