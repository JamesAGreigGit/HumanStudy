
% This file reads the EMG signals taken from the maximum voluntary contraction
% (MVC) test, filters the results and finds the peak values for each channel.
% It also reads the .txt file containing the Dynamometer results and isolates
%%the peak values from this. These are then written into .txt files for use
%%in other scripts later.

clear
clc
close all
%Read EMG files from folder
data1 = readmatrix('MVC_2k.txt');
data = data1(1:(length(data1))-30,:);

Sample = data(:,1);
Time = Sample/2000;

%Measured arm length, metres
ArmLength = 0.195;

%Apply Butterworth Filter to EMG
%Slope of 12dB/Oct
n = 2;
%Filter frequency 20 Hz
wn = [20/1000 450/1000];
[b,a] = butter(n,wn,'bandpass');
Butterworth = filtfilt(b,a,data(:,3:5));

%Define EMG variables to plot
EMG_A = Butterworth(:,1);
EMG_B = Butterworth(:,2);
EMG_C = Butterworth(:,3);

%Apply a RMS moving average over 300 samples
movrmsWin = dsp.MovingRMS(2000);
RMS_A = movrmsWin(EMG_A);
RMS_B = movrmsWin(EMG_B);
RMS_C = movrmsWin(EMG_C);

%Read MyoMeter Results
Myo = smoothdata(data(:,9),'gaussian',100);
func1 = @(x) (x*25 - 50);
Moment = (arrayfun(func1,Myo))* 9.81 * ArmLength;
[pks,locs] = findpeaks(Moment,Time,'MinPeakProminence',10);

%Plot Results
figure(1)

subplot(4,1,1);
plot(Time,RMS_A);
ylabel('EMG A, Triceps (V)')
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 0.001])
subplot(4,1,2);
plot(Time,RMS_B);
ylabel('EMG B, Biceps (V)');
set(get(gca,'ylabel'),'rotation',0)
xlim([0 max(Time)])
ylim([0 0.001])
subplot(4,1,3);
plot(Time,RMS_C);
ylabel('EMG C, Brachioradialis (V)');
set(get(gca,'ylabel'),'rotation',0)
xlabel('Time (s)')
xlim([0 max(Time)])
ylim([0 0.01])
subplot(4,1,4);
hold on
plot(Time,Moment);
findpeaks(Moment,Time,'MinPeakProminence',10);
ylabel('Elbow Moment (Nm)');
set(get(gca,'ylabel'),'rotation',0)
xlabel('Time (s)')
xlim([0 max(Time)])
ylim([0 50])

% Find max values for EMG and Force

Max_A = max(RMS_A)
Mom_Flex = pks(1)
Max_B = max(RMS_B)
Mom_Ext = pks(2)
Max_C = max(RMS_C)

MVC_Max = [Max_A Max_B Max_C Mom_Flex Mom_Ext ArmLength];

%Write to file
writematrix(MVC_Max);
