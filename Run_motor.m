clear
close all 
clc

d = daq('ni');
d.Rate = 1000;

%Runtime in seconds
time = 9;
s = d.Rate*time;

%Outputs
ch = addoutput(d,'Dev1',0:1,'Voltage');


%Pressure (1 V = 0.5 bar)
outScanData(:,1) = linspace(1,1,s)';


%Winch speed (4 V)
outScanData(:,2) = linspace(4,4,s);

ch0 = addinput(d,"Dev1",0:5,"Voltage");
scanData = readwrite(d,outScanData);

%Zero pressure
N = [0 0];
write(d,N)
