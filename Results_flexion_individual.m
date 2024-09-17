clear
clc
close all
%Read matrix files from folder
data1 = readmatrix('Flexion_2k.txt');
data = data1(1:(length(data1))-50,:);

%Collect sample rate and elbow flexion angle
Sample = data(:,1);
Time = Sample/2000;
FlexionAngleRaw = abs(data(:,8));
FlexionAngle = smoothdata(FlexionAngleRaw,'gaussian',5000);

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
wn = [20/1000 450/1000];
[b,a] = butter(n,wn,'bandpass');
Butterworth = filtfilt(b,a,data(:,3:5));

%Define EMG variables to plot
EMG_A = Butterworth(:,1);
EMG_B = Butterworth(:,2);
EMG_C = Butterworth(:,3);
%EMG_D = Butterworth(:,4);

%Apply moving RMS 
movrmsWin = dsp.MovingRMS(2000);
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

rel_A = (RMS_A/MVC_A)*100;
rel_B = (RMS_B/MVC_B)*100;
rel_C = (RMS_C/MVC_C)*100;

[pks,locs] = findpeaks(FlexionAngle,Sample,'MinPeakProminence',90);
%Plot Results
Y = 30;
figure(1)
subplot(5,1,1);
plot(Time,FlexionAngle);
findpeaks(FlexionAngle,Time,'MinPeakProminence',90)
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

Max_A = max(rel_A);
Max_B = max(rel_B);
Max_C = max(rel_C);

for x = 1:30
    T(x) = locs(x)-(630*2000/100);
end

%for x = 7:31
%T(x-1) = locs(x)-650;
%end
Markers = [T(1) T(2) T(3) T(4) T(5) T(6) T(7) T(8) T(9) T(10) T(11) T(12) T(13) T(14) T(15) T(16) T(17) T(18) T(19) T(20) T(21) T(22) T(23) T(24) T(25) T(26) T(27) T(28) T(29) T(30)];
writematrix(Markers);