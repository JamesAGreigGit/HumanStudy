clear
close all 
clc

p1 = 2;
pause(p1)

d = daq('ni');
d.Rate = 1000;

%Runtime in seconds
time = 10;
s = d.Rate*time;

%Outputs
ch = addoutput(d,'Dev1',0,'Voltage');

%Pressure (1 V = 0.5 bar)
outScanData(:,1) = linspace(1,1,s)';

ch0 = addinput(d,"Dev1",0:5,"Voltage");
%Repeat command n times
n = 2;
for k = 1:n
    
scanData = readwrite(d,outScanData);

%Zero pressure
N = 0;
write(d,N)

%Pause for deflation
p2 = 3;
pause(p2)
end