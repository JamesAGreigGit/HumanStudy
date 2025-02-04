%This file takes the flexion angle and load cell data and calculates the
%moment generated by the motor for each repetition of the movement. The
%curves of angle vs. moment are averaged for the unassisted and assisted
%movements and then the difference is calculated, which is the moment
%generated by the device. 

clear
clc
close all
%Read matrix files from folder
data = readmatrix('Motor.txt');

%Collect sample rate and elbow flexion angle
Sample = data(:,1);
Time = Sample/100;
FlexionAngleRaw = abs(data(:,8));

%Apply filter to angle. This must be sufficient to eliminate any gaps
FlexionAngleSmooth = smoothdata(FlexionAngleRaw,'gaussian',300);

%Apply Gaussian filter to pressure and force
Gauss = smoothdata(data(:,6:7),'gaussian',100);

%Pressure Function
PressureV = Gauss(:,1);
pmax = 30;
pmin = -30;
Vs = 5;

func2 = @(x) (x * ((pmax - pmin)/(0.8 * Vs)) - (0.1 * Vs) + pmin - 3.54)*6.89476;
Pressure = arrayfun(func2,PressureV);

%Read flexion angle change from Static results
Static_results = readmatrix('Static_results.txt');
Angle = Static_results(5);

%Correct flexion angle when pressurised, so at P = 0, correction = 0 and P
%= 50kPa, correction = max angle from static results
FlexionAngle = FlexionAngleSmooth - (Angle/50 * Pressure);


%Force Function
ForceV = Gauss(:,2);
%%%OLD FUNCTION%%%func1 = @(x) (x*40.229-202.52)-12.435;
%%%PRELOADED FUNCTION%%%%func1 = @(x) (x*36.251 - 191.35);
%%% NEW FUNCTION
func1 = @(x) (x*39.245 - 201.01);
Force = arrayfun(func1,ForceV);

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
movrmsWin = dsp.MovingRMS(200);
RMS_A = movrmsWin(EMG_A);
RMS_B = movrmsWin(EMG_B);
RMS_C = movrmsWin(EMG_C);
%RMS_D = movrmsWin(EMG_D);

%Max EMG from MVC readings and moment arm length
MVC_Max = readmatrix('MVC_Max.txt');
MVC_A =   MVC_Max(1);
MVC_B =   MVC_Max(2);
MVC_C =   MVC_Max(3);
Length = MVC_Max(6);
Max_Triceps = MVC_Max(5);

%Calculate relative EMG against MVC readings
rel_A = (RMS_A/MVC_A)*100;
rel_B = (RMS_B/MVC_B)*100;
rel_C = (RMS_C/MVC_C)*100;

%Moment Calculation
Fwinch = (Force.*sin(FlexionAngle*pi/180));
Moment = Fwinch * Length;

%Plot Results
figure(1)
subplot(6,1,1);
hold on
plot(Time,FlexionAngleSmooth,Time,FlexionAngle);
ylabel('Elbow Flexion Angle (Degrees)')
findpeaks(FlexionAngle,Time,'MinPeakProminence',40)
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
subplot(6,1,2);
plot(Time,Pressure);
xlim([0 max(Time)])
ylim([0 60])
ylabel('Pressure (kPa)')
set(get(gca,'ylabel'),'rotation',0)
subplot(6,1,3);
plot(Time,Moment);
ylabel('Winch Moment (Nm)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 5])
subplot(6,1,4);
plot(Time,rel_A);
ylabel('EMG A, Triceps (% MVC)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 50])
subplot(6,1,5);
plot(Time,rel_B);
ylabel('EMG B, Biceps (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 50])
subplot(6,1,6);
plot(Time,rel_C);
ylabel('EMG C, Brachioradialis (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlabel('Time (s)')
xlim([0 max(Time)])
ylim([0 50])

%Find peak flexion angles, to determine end of each movement
[pks,locs] = findpeaks(FlexionAngle,Sample,'MinPeakProminence',40);

%Max relative EMG for each muscle
Max_A = max(rel_A)
Max_B = max(rel_B)
Max_C = max(rel_C)

%Winch time in samples, min to max flexion
Twinch = 1250;

%Start and end times of each movement
T1e = locs(1);
T1s = T1e-Twinch;
T2e = locs(2);
T2s = T2e-Twinch;
T3e = locs(3);
T3s = T3e-Twinch;
T4e = locs(4);
T4s = T4e-Twinch;
T5e = locs(5);
T5s = T5e-Twinch;
T6e = locs(6);
T6s = T6e-Twinch;
T7e = locs(7);
T7s = T7e-Twinch;
T8e = locs(8);
T8s = T8e-Twinch;
T9e = locs(9);
T9s = T9e-Twinch;
%T10e = locs(10);
%T10s = T10e-Twinch;

%{Arrays with flexion angle and Moment for each time step

%F1 = FlexionAngle(T1s:T1e);
%F2 = FlexionAngle(T1s:T1e);
%F3 = FlexionAngle(T3s:T3e);
%F4 = FlexionAngle(T4s:T4e);
%F5 = FlexionAngle(T5s:T5e);
%F6 = FlexionAngle(T6s:T6e);
%F7 = FlexionAngle(T7s:T7e);
%F8 = FlexionAngle(T8s:T8e);
%F9 = FlexionAngle(T9s:T9e);
%F10 = FlexionAngle(T10s:T10e);
%M1 = Moment(T1s:T1e);
%M2 = Moment(T2s:T2e);
%M3 = Moment(T3s:T3e);
%M4 = Moment(T4s:T4e);
%M5 = Moment(T5s:T5e);
%M6 = Moment(T6s:T6e);
%M7 = Moment(T7s:T7e);
%M8 = Moment(T8s:T8e);
%M9 = Moment(T9s:T9e);
%M10 = Moment(T10s:T10e);
%FUn = [F1 F2 F3 F4 F5];
%FAss = [F6 F7 F8 F9 F10];
%FmUn = mean(FUn,2);
%FmAss = mean(FAss,2);
%MUn = [M1 M2 M3 M4 M5];
%MAss = [M6 M7 M8 M9 M10];
%MmUn = mean(MUn,2);
%MmAss = mean(MAss,2);
%MDev = MmUn - MmAss;
%figure(2)
%hold on
%scatter(FmUn,MmUn);
%scatter(FmAss,MmAss);
%scatter(FmUn,MDev);
%L = [length(S1) length(S2) length(S3) length(S4) length(S5) length(S6) length(S7) length(S8) length(S9) length(S10)];

%Create standard length vector between 0 and max flexion angle
xq = (0:max(FlexionAngle)/Twinch:max(FlexionAngle));
%Interpolate all curves along vector created above
vq1 = interp1(FlexionAngle(T1s:T1e),Moment(T1s:T1e),xq,'linear');
vq2 = interp1(FlexionAngle(T2s:T2e),Moment(T2s:T2e),xq,'linear');
vq3 = interp1(FlexionAngle(T3s:T3e),Moment(T3s:T3e),xq,'linear');
vq4 = interp1(FlexionAngle(T4s:T4e),Moment(T4s:T4e),xq,'linear');
vq5 = interp1(FlexionAngle(T5s:T5e),Moment(T5s:T5e),xq,'linear');
vq6 = interp1(FlexionAngle(T6s:T6e),Moment(T6s:T6e),xq,'linear');
vq7 = interp1(FlexionAngle(T7s:T7e),Moment(T7s:T7e),xq,'linear');
vq8 = interp1(FlexionAngle(T8s:T8e),Moment(T8s:T8e),xq,'linear');
vq9 = interp1(FlexionAngle(T9s:T9e),Moment(T9s:T9e),xq,'linear');
%vq10 = interp1(FlexionAngle(T10s:T10e),Moment(T10s:T10e),xq,'linear');
%Create matrix for Unassisted movements
vqUn = [vq1;vq2;vq3;vq4;vq5];
%Create matrix for Assisted movements
vqAss = [vq6;vq7;vq8;vq9];
%Calculate mean of above
vqmUn = mean(vqUn,'omitnan');
vqmUnsmooth = smoothdata(vqmUn);
vqmAss = mean(vqAss,'omitnan');
vqmAsssmooth = smoothdata(vqmAss);
%Calculate difference (device moment)
Mdev = vqmUnsmooth - vqmAsssmooth;

%Use measured triceps EMG to estimate moment due to muscle activity:
M_Triceps = rel_A .* (Max_Triceps/100);
MT1 = interp1(FlexionAngle(T1s:T1e),M_Triceps(T1s:T1e),xq,'linear');
MT2 = interp1(FlexionAngle(T2s:T2e),M_Triceps(T2s:T2e),xq,'linear');
MT3 = interp1(FlexionAngle(T3s:T3e),M_Triceps(T3s:T3e),xq,'linear');
MT4 = interp1(FlexionAngle(T4s:T4e),M_Triceps(T4s:T4e),xq,'linear');
MT5 = interp1(FlexionAngle(T5s:T5e),M_Triceps(T5s:T5e),xq,'linear');
MT6 = interp1(FlexionAngle(T6s:T6e),M_Triceps(T6s:T6e),xq,'linear');
MT7 = interp1(FlexionAngle(T7s:T7e),M_Triceps(T7s:T7e),xq,'linear');
MT8 = interp1(FlexionAngle(T8s:T8e),M_Triceps(T8s:T8e),xq,'linear');
MT9 = interp1(FlexionAngle(T9s:T9e),M_Triceps(T9s:T9e),xq,'linear');
%MT10 = interp1(FlexionAngle(T10s:T10e),M_Triceps(T10s:T10e),xq,'linear');
MTUn = [MT1;MT2;MT3;MT4;MT5];
MTAss = [MT6;MT7;MT8;MT9];
MTmUn = mean(MTUn,'omitnan');
MTmAss = mean(MTAss,'omitnan');
Mm = MTmUn-MTmAss;
Mmsmooth = smoothdata(Mm);
figure(2)
hold on
scatter(xq,vqmUnsmooth)
scatter(xq,vqmAsssmooth)
scatter(xq,Mdev)
%scatter(xq,Mmsmooth)
%scatter(xq,MTmAss)
%scatter(xq,vqUn)
%scatter(xq,vqAss)
legend('Unassisted','Assisted','Device')
xlabel('Elbow Flexion Angle (Degrees)')
%legend
ylabel('Moment (N.m)')

%Write results file
MDevice = [xq;Mdev];
%writematrix(MDevice);