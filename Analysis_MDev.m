P1 = readmatrix('MDeviceP1.txt');
P2 = readmatrix('MDeviceP2.txt');
P3 = readmatrix('MDeviceP3.txt');
P4 = readmatrix('MDeviceP4.txt');
P5 = readmatrix('MDeviceP5.txt');
P6 = readmatrix('MDeviceP6.txt');
P7 = readmatrix('MDeviceP7.txt');
P9 = readmatrix('MDeviceP9.txt');
P10 = readmatrix('MDeviceP10.txt');
P11 = readmatrix('MDeviceP11.txt');
P12 = readmatrix('MDeviceP12.txt');
P13 = readmatrix('MDeviceP13.txt');
P14 = readmatrix('MDeviceP14.txt');
P15 = readmatrix('MDeviceP15.txt');
P16 = readmatrix('MDeviceP16.txt');
P17 = readmatrix('MDeviceP17.txt');
P18 = readmatrix('MDeviceP18.txt');
P19 = readmatrix('MDeviceP19.txt');
P20 = readmatrix('MDeviceP20.txt');

Angle1 = P1(1,:);
MdevP1 = P1(2,:);

Angle2 = P2(1,:);
MdevP2 = P2(2,:);

Angle3 = P3(1,:);
MdevP3 = P3(2,:);

Angle4 = P4(1,:);
MdevP4 = P4(2,:);

Angle5 = P5(1,:);
MdevP5 = P5(2,:);

Angle6 = P6(1,:);
MdevP6 = P6(2,:);

Angle7 = P7(1,:);
MdevP7 = P7(2,:);

Angle9 = P9(1,:);
MdevP9 = P9(2,:);

Angle10 = P10(1,:);
MdevP10 = P10(2,:);

Angle11 = P11(1,:);
MdevP11 = P11(2,:);

Angle12 = P12(1,:);
MdevP12 = P12(2,:);

Angle13 = P13(1,:);
MdevP13 = P13(2,:);

Angle14 = P14(1,:);
MdevP14 = P14(2,:);

Angle15 = P15(1,:);
MdevP15 = P15(2,:);

Angle16 = P16(1,:);
MdevP16 = P16(2,:);

Angle17 = P17(1,:);
MdevP17 = P17(2,:);

Angle18 = P18(1,:);
MdevP18 = P18(2,:);

Angle19 = P19(1,:);
MdevP19 = P19(2,:);

Angle20 = P20(1,:);
MdevP20 = P20(2,:);


Angle = [Angle1 Angle2 Angle3 Angle4 Angle5 Angle6 Angle7 Angle9 Angle10 Angle11 Angle12 Angle13 Angle14 Angle15 Angle16 Angle17 Angle18 Angle19 Angle20];

%Create standardised vector between 0 and max flexion angle
xq = (0:max(Angle)/5000:max(Angle));
%Interpolate all curves along vector created above
vq1 = interp1(Angle1,MdevP1,xq,'linear');
vq2 = interp1(Angle2,MdevP2,xq,'linear');
vq3 = interp1(Angle3,MdevP3,xq,'linear');
vq4 = interp1(Angle4,MdevP4,xq,'linear');
vq5 = interp1(Angle5,MdevP5,xq,'linear');
vq6 = interp1(Angle6,MdevP6,xq,'linear');
vq7 = interp1(Angle7,MdevP7,xq,'linear');
vq9 = interp1(Angle9,MdevP9,xq,'linear');
vq10 = interp1(Angle10,MdevP10,xq,'linear');
vq11 = interp1(Angle11,MdevP11,xq,'linear');
vq12 = interp1(Angle12,MdevP12,xq,'linear');
vq13 = interp1(Angle13,MdevP13,xq,'linear');
vq14 = interp1(Angle14,MdevP14,xq,'linear');
vq15 = interp1(Angle15,MdevP15,xq,'linear');
vq16 = interp1(Angle16,MdevP16,xq,'linear');
vq17 = interp1(Angle17,MdevP17,xq,'linear');
vq18 = interp1(Angle18,MdevP18,xq,'linear');
vq19 = interp1(Angle19,MdevP19,xq,'linear');
vq20 = interp1(Angle20,MdevP20,xq,'linear');


Mdev = [vq1;vq2;vq3;vq6;vq7;vq9;vq10;vq11;vq12;vq14;vq15;vq16;vq17;vq18;vq19;vq20];
MdevMean = mean(Mdev,'omitnan');
MdevMax = max(Mdev);
MdevMin = min(Mdev);
MdevSD = std(Mdev,'omitnan');
MdevMeansmooth = smoothdata(MdevMean);
Mdevtop = MdevMean + (MdevSD.*2);
Mdevlow = MdevMean - (MdevSD.*2);

xqmin = (5000/max(Angle))*20;
xqmax = (5000/max(Angle))*135;

xq2 = [xq(xqmin:xqmax), fliplr(xq(xqmin:xqmax))];
inBetween = [Mdevtop(xqmin:xqmax), fliplr(Mdevlow(xqmin:xqmax))];

figure(1)
hold on
scatter(Angle1,MdevP1,'filled','Markerfacecolor',"#0072BD");
scatter(Angle2,MdevP2,'filled','Markerfacecolor',"#D95319");
scatter(Angle3,MdevP3,'filled','Markerfacecolor',"#EDB120");
%scatter(Angle4,MdevP4,'filled','Markerfacecolor',"#7E2F8E");
%scatter(Angle5,MdevP5,'filled','Markerfacecolor',"#77AC30");
scatter(Angle6,MdevP6,'filled','Markerfacecolor','red');
scatter(Angle7,MdevP7,'filled','Markerfacecolor','cyan');
scatter(Angle9,MdevP9,'filled','Markerfacecolor',"blue");
scatter(Angle10,MdevP10,'filled','Markerfacecolor',"#4DBEEE");
scatter(Angle11,MdevP11,'filled','Markerfacecolor',"blue");
scatter(Angle12,MdevP12,'filled','Markerfacecolor',"#A2142F");
%scatter(Angle13,MdevP13,'filled','Markerfacecolor',"magenta");
scatter(Angle14,MdevP14,'filled','Markerfacecolor',"black");
scatter(Angle15,MdevP15,'filled','Markerfacecolor',"#A2142F");
scatter(Angle16,MdevP16,'filled','Markerfacecolor',"magenta");
scatter(Angle17,MdevP17,'filled','Markerfacecolor',"black");
scatter(Angle18,MdevP18,'filled');
scatter(Angle19,MdevP19,'filled');
scatter(Angle20,MdevP20,'filled');

legend('P1','P2','P3','P6','P7','P9','P10','P11','P12','P14','P15','P16','P17','P18','P19','P20','location','northwest');
xlabel('Elbow Flexion Angle (Degrees)')
ylabel('Assistive Moment (Nm)')
grid on
fontsize(24,'points')

figure(2)
hold on
grey = [0.85 0.85 0.85];
fill(xq2,inBetween,grey,'edgecolor','black');
scatter(xq,MdevMeansmooth,'filled','Markerfacecolor','r'); 
xlabel('Elbow Flexion Angle (Degrees)')
ylabel('Assistive Moment (Nm)')
ylim([0 2.5])
xlim([25 120])
grid on
fontsize(24,'points')
