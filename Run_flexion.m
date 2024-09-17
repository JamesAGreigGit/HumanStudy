clear
close all 
clc

p1 = 1;
pause(p1)

d = daq('ni');
d.Rate = 1000;

%Runtime in seconds
time = 20;
s = d.Rate*time;

%Outputs
ch = addoutput(d,'Dev1',0,'Voltage');

%Pressure (1 V = 0.5 bar)
outScanData = linspace(1,1,s)';

ch0 = addinput(d,"Dev1",0:5,"Voltage");
%Repeat command n times
n = 1;
for k = 1:n
    
scanData = readwrite(d,outScanData);

%Zero pressure
N = 0;
write(d,N)
%pause for deflation
p2 = 3;
pause(p2)
end