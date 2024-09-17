clear
clc
close all
%Read matrix files from folder
data = readmatrix('Static.txt');
%Collect sample rate and elbow flexion angle
Sample = data(:,1);
Time = Sample/100;

Angle = data(:,8);
FlexionAngle = smoothdata(Angle,'gaussian',50);

%Apply Gaussian filter to pressure and force
Gauss = smoothdata(data(:,6:7),'gaussian',50);

%Force Function
ForceV = Gauss(:,2);
%%OLD FUNCTION%%func1 = @(x) (x*40.229-202.52)-12.435;
%%%PRELOADED FUNCTION%%%%func1 = @(x) (x*36.251 - 191.35);
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
%Filter frequency 20 Hz
wn = [20/1000 450/1000];
[b,a] = butter(n,wn,'bandpass');
Butterworth = filter(b,a,data(:,3:8));

%Define EMG variables to plot
EMG_A = Butterworth(:,1);
EMG_B = Butterworth(:,2);
EMG_C = Butterworth(:,3);
%EMG_D = Butterworth(:,4);

%Apply moving RMS 
movrmsWin = dsp.MovingRMS(300);
RMS_A = movrmsWin(EMG_A);
RMS_B = movrmsWin(EMG_B);
RMS_C = movrmsWin(EMG_C);
%RMS_D = movrmsWin(EMG_D);

%Max MVC
%Read txt
MVC_Max = readmatrix('MVC_Max.txt');
MVC_A =   MVC_Max(1);
MVC_B =   MVC_Max(2);
MVC_C =   MVC_Max(3);
Length = MVC_Max(6);

rel_A = (RMS_A/MVC_A)*100;
rel_B = (RMS_B/MVC_B)*100;
rel_C = (RMS_C/MVC_C)*100;

%Plot Results
figure(1)
subplot(6,1,1);
plot(Time,FlexionAngle);
ylabel('Elbow Flexion Angle (Degrees)')
%findpeaks(FlexionAngle,Time,'MinPeakProminence',20)
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
subplot(6,1,2);
hold on
plot(Time,Pressure);
findpeaks(Pressure,Time,'MinPeakProminence',20)
xlim([0 max(Time)])
ylim([0 60])
ylabel('Pressure (kPa)')
set(get(gca,'ylabel'),'rotation',0)
subplot(6,1,3);
plot(Time,Force);
ylabel('Force (N)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 30])
subplot(6,1,4);
plot(Time,rel_A);
ylabel('EMG A, Triceps (% MVC)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 10])
subplot(6,1,5);
plot(Time,rel_B);
ylabel('EMG B, Biceps (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 25])
subplot(6,1,6);
plot(Time,rel_C);
ylabel('EMG C, Brachioradialis (% MVC)');
set(get(gca,'ylabel'),'rotation',0)
xlabel('Time (s)')
xlim([0 max(Time)])
ylim([0 40])


%Plot Results
figure(2)
subplot(2,1,1);
hold on
plot(Time,Pressure);
findpeaks(Pressure,Time,'MinPeakProminence',20)
xlim([0 max(Time)])
ylim([0 50])
ylabel('Pressure (kPa)')
set(get(gca,'ylabel'),'rotation',0)
subplot(2,1,2);
plot(Time,Force);
ylabel('Force (N)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([-5 15])
grid on
xlabel('Time (s)')



%Locate peaks in pressure
[pks,locs] = findpeaks(Pressure,Sample,'MinPeakProminence',20);
P1 = locs(2);
P2 = locs(3);
P3 = locs(4);
P4 = locs(5);
P5 = locs(6);

%Calulate maximum relative EMG during period of test
Rel_A_max = max(rel_A(P1-896:P5))
Rel_B_max = max(rel_B(P1-896:P5))
Rel_C_max = max(rel_C(P1-896:P5))

%Calculate force change during inflation
D1 = Force(P1-896)-Force(P1);
D2 = Force(P2-896)-Force(P2);
D3 = Force(P3-896)-Force(P3);
D4 = Force(P4-896)-Force(P4);
D5 = Force(P5-896)-Force(P5);
Av_Force = mean([D1 D2 D3 D4 D5])
std_Force = std([D1 D2 D3 D4 D5])
Av_Moment = Av_Force * Length
std_Moment = std_Force * Length


%Calculate change in flexion angle during inflation
A1 = FlexionAngle(locs(2))-FlexionAngle(locs(2)-896);
A2 = FlexionAngle(locs(2))-FlexionAngle(locs(2)-896);
A3 = FlexionAngle(locs(2))-FlexionAngle(locs(2)-896);
A4 = FlexionAngle(locs(2))-FlexionAngle(locs(2)-896);
A5 = FlexionAngle(locs(2))-FlexionAngle(locs(2)-896);

Angle = mean([A1 A2 A3 A4 A5])

Static_results = [Av_Moment std_Moment Av_Force Length Angle];
%writematrix(Static_results)
