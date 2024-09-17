clear
clc
close all
%Read matrix files from folder
data = readmatrix('Flexion_2k.txt');

%Collect sample rate and elbow flexion angle
Sample = data(:,1);
%Sample Freq, Hz
Fs = 2000;
Time = Sample/Fs;
FlexionAngleRaw = abs(data(:,8));
FlexionAngle = smoothdata(FlexionAngleRaw,'gaussian',200);

%Apply Gaussian filter to pressure and force
Gauss = smoothdata(data(:,6:7),'gaussian',50);

%Force Function
ForceV = Gauss(:,2);
%%%OLD FUNCTION%%%func1 = @(x) (x*40.229-202.52)-12.435;
%%%PRELOADED FUNCTION%%%%func1 = @(x) (x*36.251 - 191.35);
%%% NEW FUNCTION
func1 = @(x) (x*39.245 - 201.01);
Force = arrayfun(func1,ForceV);

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
%Filter frequency 20/450 Hz
wn = [50/1000 200/1000];
[b,a] = butter(n,wn,'bandpass');
Butterworth = filter(b,a,data(:,3:5));
Butter2 = filter(b,a,(Butterworth));

%Define EMG variables to plot
EMG_A = Butter2(:,1);
EMG_B = Butter2(:,2);
EMG_C = Butter2(:,3);
%EMG_D = Butterworth(:,4);

%Define EMG variables to plot
%EMG_A = data(:,3);
%EMG_B = data(:,4);
%EMG_C = data(:,5);

%Apply moving RMS 
%Time window, s
t = 1;
%Sample window
T = t * Fs;
movrmsWin = dsp.MovingRMS(T);
RMS_A = movrmsWin(EMG_A);
RMS_B = movrmsWin(EMG_B);
RMS_C = movrmsWin(EMG_C);
%RMS_D = movrmsWin(EMG_D);

%Max MVC
%Read txt
MVC_Max = readmatrix('MVC_Max.txt');
MVC_A = MVC_Max(1);
MVC_B = MVC_Max(2);
MVC_C = MVC_Max(3);

rel_A = (RMS_A/MVC_A)*100;
rel_B = (RMS_B/MVC_B)*100;
rel_B_raw = (data(:,4)/MVC_B)*100;
rel_B_raw_abs = abs(rel_B_raw);
rel_C = (RMS_C/MVC_C)*100;

[pks,locs] = findpeaks(FlexionAngle,Sample,'MinPeakProminence',70);
%Plot Results
Y = 50;
figure(1)
subplot(5,1,1);
plot(Time,FlexionAngle);
findpeaks(FlexionAngle,Time,'MinPeakProminence',70)
ylabel('Elbow Flexion Angle (Degrees)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
subplot(5,1,2);
plot(Time,Pressure);
xlim([0 max(Time)])
ylim([0 60])
ylabel('Pressure (kPa)')
set(get(gca,'ylabel'),'rotation',0)
subplot(5,1,3);
plot(Time,rel_A);
ylabel('EMG A, Triceps (% MVC)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 Y])
subplot(5,1,4);
plot(Time,rel_B);
ylabel('EMG B, Biceps (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 Y])
subplot(5,1,5);
plot(Time,rel_C);
ylabel('EMG C, Brachioradialis (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlabel('Time (s)')
xlim([0 max(Time)])
ylim([0 Y])

figure(2)
plot(Time,rel_B_raw)
hold on 
plot(Time,rel_B,'color','m','LineWidth',1)
legend('Raw EMG','Filtered EMG')

hold off
ylim([-10 300])

Max_A = max(rel_A)
Max_B = max(rel_B)
Max_C = max(rel_C)
%{
T1 = locs(1)-650;
T2 = locs(6)-650;
T3 = locs(11)-650;
T4 = locs(16)-650;
T5 = locs(21)-650;
T6 = locs(26)-650;
%}
%Markers = [T1 T2 T3 T4 T5 T6];
%writematrix(Markers);
MinFlex = min(FlexionAngle);
MaxFlex = max(FlexionAngle);
MaxUnPressurised = pks(4);
FlexAngles = [MinFlex MaxFlex MaxUnPressurised];
%writematrix(FlexAngles);