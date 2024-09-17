Peaks_P1 = readmatrix('PeaksP1.txt');
Peaks_P2 = readmatrix('PeaksP2.txt');
Peaks_P3 = readmatrix('PeaksP3.txt');
%Peaks_P4 = readmatrix('PeaksP4.txt');
Peaks_P5 = readmatrix('PeaksP5.txt');
%Peaks_P6 = readmatrix('PeaksP6.txt');
Peaks_P7 = readmatrix('PeaksP7.txt');
%Peaks_P8 = readmatrix('PeaksP8.txt');
Peaks_P9 = readmatrix('PeaksP9.txt');
%Peaks_P10 = readmatrix('PeaksP10.txt');
Peaks_P11 = readmatrix('PeaksP11.txt');
Peaks_P12 = readmatrix('PeaksP12.txt');
Peaks_P13 = readmatrix('PeaksP13.txt');
%Peaks_P14 = readmatrix('PeaksP14.txt');
Peaks_P15 = readmatrix('PeaksP15.txt');
Peaks_P16 = readmatrix('PeaksP16.txt');
Peaks_P17 = readmatrix('PeaksP17.txt');
Peaks_P18 = readmatrix('PeaksP18.txt');
Peaks_P19= readmatrix('PeaksP19.txt');
Peaks_P20 = readmatrix('PeaksP20.txt');

Totals_P1 = readmatrix('TotalsP1.txt');
Totals_P2 = readmatrix('TotalsP2.txt');
Totals_P3 = readmatrix('TotalsP3.txt');
%Totals_P4 = readmatrix('TotalsP4.txt');
Totals_P5 = readmatrix('TotalsP5.txt');
%Totals_P6 = readmatrix('TotalsP6.txt');
Totals_P7 = readmatrix('TotalsP7.txt');
%Totals_P8 = readmatrix('TotalsP8.txt');
Totals_P9 = readmatrix('TotalsP9.txt');
%Totals_P10 = readmatrix('TotalsP10.txt');
Totals_P11 = readmatrix('TotalsP11.txt');
Totals_P12 = readmatrix('TotalsP12.txt');
Totals_P13 = readmatrix('TotalsP13.txt');
%Totals_P14 = readmatrix('TotalsP14.txt');
Totals_P15 = readmatrix('TotalsP15.txt');
Totals_P16 = readmatrix('TotalsP16.txt');
Totals_P17 = readmatrix('TotalsP17.txt');
Totals_P18 = readmatrix('TotalsP18.txt');
Totals_P19= readmatrix('TotalsP19.txt');
Totals_P20 = readmatrix('TotalsP20.txt');

%Create arrays for Peaks and Totals at 0, 1, & 2 kg 
P0 = [Peaks_P1(1,1) Peaks_P2(1,1) Peaks_P3(1,1) Peaks_P5(1,1) Peaks_P7(1,1) Peaks_P9(1,1) Peaks_P11(1,1) Peaks_P12(1,1) Peaks_P13(1,1) Peaks_P15(1,1) Peaks_P16(1,1) Peaks_P17(1,1) Peaks_P18(1,1) Peaks_P19(1,1) Peaks_P20(1,3)];
mP0 = mean(P0,'omitnan');
stdP0 = std(P0,'omitnan');
P1 = [Peaks_P1(2,3) Peaks_P2(2,1) Peaks_P3(2,1) Peaks_P5(2,1) Peaks_P7(2,1) Peaks_P9(2,1) Peaks_P11(2,1) Peaks_P12(2,1) Peaks_P13(2,1) Peaks_P15(2,1) Peaks_P16(2,1) Peaks_P17(2,1) Peaks_P18(2,1) Peaks_P19(2,1) Peaks_P20(2,1)];
mP1 = mean(P1,'omitnan');
stdP1 = std(P1,'omitnan');
P2 = [Peaks_P1(3,3) Peaks_P2(3,1) Peaks_P3(3,1) Peaks_P5(3,1) Peaks_P7(3,1) Peaks_P9(2,1) Peaks_P11(3,1) Peaks_P12(3,1) Peaks_P13(3,1) Peaks_P15(2,1) Peaks_P16(3,1) Peaks_P17(3,1) Peaks_P18(3,1) Peaks_P19(3,1) Peaks_P20(3,1)];
mP2 = mean(P2,'omitnan');
stdP2 = std(P2,'omitnan');
T0 = [Totals_P1(1,1) Totals_P2(1,1) Totals_P3(1,1) Totals_P5(1,1) Totals_P7(1,1) Totals_P9(1,1) Totals_P11(1,1) Totals_P12(1,1) Totals_P13(1,1) Totals_P15(1,1) Totals_P16(1,1) Totals_P17(1,1) Totals_P18(1,1) Totals_P19(1,1) Totals_P20(1,3)];
mT0 = mean(T0,'omitnan');
stdT0 = std(T0,'omitnan');
T1 = [Totals_P1(2,3) Totals_P2(2,1) Totals_P3(2,1) Totals_P5(2,1) Totals_P7(2,1) Totals_P9(2,1) Totals_P11(2,1) Totals_P12(2,1) Totals_P13(2,1) Totals_P15(2,1) Totals_P16(2,1) Totals_P17(2,1) Totals_P18(2,1) Totals_P19(2,1) Totals_P20(2,1)];
mT1 = mean(T1,'omitnan');
stdT1 = std(T1,'omitnan');
T2 = [Totals_P1(3,3) Totals_P2(3,1) Totals_P3(3,1) Totals_P5(3,1) Totals_P7(3,1) Totals_P9(3,1) Totals_P11(3,1) Totals_P12(3,1) Totals_P13(3,1) Totals_P13(3,1) Totals_P16(3,1) Totals_P17(3,1) Totals_P18(3,1) Totals_P19(3,1) Totals_P20(3,1)];
mT2 = mean(T2,'omitnan');
stdT2 = std(T2,'omitnan');

%Conduct T-Test on Peaks and Totals
[h0,p0] = ttest(P0);
[h1,p1] = ttest(P1);
[h2,p2] = ttest(P2);

[h4,p4] = ttest(T0);
[h5,p5] = ttest(T1);
[h6,p6] = ttest(T2);

HResult = [h0 h1 h2 h4 h5 h6];
PValues = [p0 p1 p2 p4 p5 p6];

%Conduct ANOVA test on Peaks and Totals

allpeaks = transpose([P0;P1;P2]);
anovaPeaks = anova(allpeaks);
alltotals = transpose([T0;T1;T2]);
anovaTotals = anova(alltotals);

nmbparticipants = 15;
%Conduct 2-way ANOVA on Peaks
%{
allpeaks0 = zeros(15,3,'single');
anova2peaks = [allpeaks;allpeaks0];

[~,~,stats] = anova2(anova2peaks,nmbparticipants);
%}
%Conduct 2-way ANOVA on Totals

alltotals0 = zeros(15,3,'single');
anova2totals = [alltotals;alltotals0];
[~,~,stats] = anova2(anova2totals,nmbparticipants);


%Calculate mean and Standard Deviation of Peaks and Totals
mPT = [mP0;mP1;mP2];
stdPT = [stdP0;stdP1;stdP2];
mTT = [mT0;mT1;mT2];
stdTT = [stdT0;stdT1;stdT2];

%Plot Peaks and Totals
figure(2)
X = categorical({'0 kg'; '1 kg';'2 kg'});
X = reordercats(X,{'0 kg'; '1 kg';'2 kg'});
%X = [0 1 2];
%XT = [-0.02 0.98 1.98];
%XP = [0.02 1.02 2.02];

bar(X,mTT,'stacked','FaceColor',"#EDB120",'EdgeColor',"#EDB120",'FaceAlpha',0.5','linewidth',1)
hold on
errorbar(X,mTT,stdTT,'.','linewidth',5,'color',"#EDB120",'CapSize',18);
sz = 100;
scatter(X,mPT,sz,'filled','Markerfacecolor',"#7E2F8E");
errorbar(X,mPT,stdPT(:,1),'.','linewidth',2,'color',"#7E2F8E",'Capsize',10);
legend('Integrated EMG','Integrated EMG Error','Peak EMG','Peak EMG Error')
hold off
fontsize(16,'points')
ylabel('Reduction in EMG between device off and on (%)')
ylim([-10 80])


PBIC0 = [Peaks_P1(1,2) Peaks_P2(1,2) Peaks_P3(1,2) Peaks_P5(1,2) Peaks_P7(1,2) Peaks_P11(1,2) Peaks_P12(1,2) Peaks_P13(1,2) Peaks_P15(1,2) Peaks_P16(1,2) Peaks_P17(1,2) Peaks_P18(1,2) Peaks_P19(1,2) Peaks_P20(1,2)];
mPBIC0 = mean(PBIC0);
stdPBIC0 = std(PBIC0);
PBIC1 = [Peaks_P1(2,2) Peaks_P2(2,2) Peaks_P3(2,2) Peaks_P5(2,2) Peaks_P7(2,2) Peaks_P11(2,2) Peaks_P12(2,2) Peaks_P13(2,2) Peaks_P15(2,2) Peaks_P16(2,2) Peaks_P17(2,2) Peaks_P18(2,2) Peaks_P19(2,2) Peaks_P20(2,2)];
mPBIC1 = mean(PBIC1);
stdPBIC1 = std(PBIC1);
PBIC2 = [Peaks_P1(3,2) Peaks_P2(3,2) Peaks_P3(3,2) Peaks_P5(3,2) Peaks_P7(3,2) Peaks_P11(3,2) Peaks_P12(3,2) Peaks_P13(3,2) Peaks_P15(3,2) Peaks_P16(3,2) Peaks_P17(3,2) Peaks_P18(3,2) Peaks_P19(3,2) Peaks_P20(3,2)];
mPBIC2 = mean(PBIC2);
stdPBIC2 = std(PBIC2);
PBRD0 = [Peaks_P1(1,3) Peaks_P2(1,3) Peaks_P3(1,3) Peaks_P5(1,3) Peaks_P7(1,3) Peaks_P11(1,3) Peaks_P12(1,3) Peaks_P13(1,3) Peaks_P15(1,3) Peaks_P16(1,3) Peaks_P17(1,3) Peaks_P18(1,3) Peaks_P19(1,3) Peaks_P20(1,3)];
mPBRD0 = mean(PBRD0);
stdPBRD0 = std(PBRD0);
PBRD1 = [Peaks_P1(2,3) Peaks_P2(2,3) Peaks_P3(2,3) Peaks_P5(2,3) Peaks_P7(2,3) Peaks_P11(2,3) Peaks_P12(2,3) Peaks_P13(2,3) Peaks_P15(2,3) Peaks_P16(2,3) Peaks_P17(2,3) Peaks_P18(2,3) Peaks_P19(2,3) Peaks_P20(2,3)];
mPBRD1 = mean(PBRD1);
stdPBRD1 = std(PBRD1);
PBRD2 = [Peaks_P1(3,3) Peaks_P2(3,3) Peaks_P3(3,3) Peaks_P5(3,3) Peaks_P7(3,3) Peaks_P11(3,3) Peaks_P12(3,3) Peaks_P13(3,3) Peaks_P15(3,3) Peaks_P16(3,3) Peaks_P17(3,3) Peaks_P18(3,3) Peaks_P19(3,3) Peaks_P20(3,3)];
mPBRD2 = mean(PBRD2);
stdPBRD2 = std(PBRD2);

mPeaks = [mPBIC0 mPBRD0;mPBIC1 mPBRD1;mPBIC2 mPBRD2];
stdPeaks = [stdPBIC0 stdPBRD0;stdPBIC1 stdPBRD1;stdPBIC2 stdPBRD2];
y = [mPBIC0 (mPBIC0+mPBRD0);mPBIC1 (mPBIC1+mPBRD1);mPBIC2 (mPBIC2+mPBRD2)];

%{
figure(1)
X = categorical({'0 kg BIC' '0kg BRD'; '1 kg BIC' '1 kg BRD';'2 kg BIC' '2 kg BRD'});
X = reordercats(X,{'0 kg BIC' '0kg BRD'; '1 kg BIC' '1 kg BRD';'2 kg BIC' '2 kg BRD'});
%X = categorical({'0 kg';'1 kg';'2kg'});
%X = reordercats(X,{'0 kg';'1 kg';'2kg'});
bar(X,mPeaks,'stacked')
hold on
errorbar(X,mPeaks,stdPeaks,'.','linewidth',1,'color','black');
hold off
%legend({'Biceps','Brachioradialis'},'Location','northeast')
fontsize(16,'points')
%title('Peak Reductions')
ylabel('% MVC Reduction')
%}
TBIC0 = [Totals_P1(1,2) Totals_P2(1,2) Totals_P3(1,2) Totals_P5(1,2) Totals_P7(1,2) Totals_P11(1,2) Totals_P12(1,2) Totals_P13(1,2) Totals_P15(1,2) Totals_P16(1,2) Totals_P17(1,2) Totals_P18(1,2) Totals_P19(1,2) Totals_P20(1,2)];
mTBIC0 = mean(TBIC0,'omitnan');
stdTBIC0 = std(TBIC0,'omitnan');
TBIC1 = [Totals_P1(2,2) Totals_P2(2,2) Totals_P3(2,2) Totals_P5(2,2) Totals_P7(2,2) Totals_P11(2,2) Totals_P12(2,2) Totals_P13(2,2) Totals_P15(2,2) Totals_P16(2,2) Totals_P17(2,2) Totals_P18(2,2) Totals_P19(2,2) Totals_P20(2,2)];
mTBIC1 = mean(TBIC1,'omitnan');
stdTBIC1 = std(TBIC1,'omitnan');
TBIC2 = [Totals_P1(3,2) Totals_P2(3,2) Totals_P3(3,2) Totals_P5(3,2) Totals_P7(3,2) Totals_P11(3,2) Totals_P12(3,2) Totals_P13(3,2) Totals_P15(3,2) Totals_P16(3,2) Totals_P17(3,2) Totals_P18(3,2) Totals_P19(3,2) Totals_P20(3,2)];
mTBIC2 = mean(TBIC2,'omitnan');
stdTBIC2 = std(PBIC2,'omitnan');
TBRD0 = [Totals_P1(1,3) Totals_P2(1,3) Totals_P3(1,3) Totals_P5(1,3) Totals_P7(1,3) Totals_P11(1,3) Totals_P12(1,3) Totals_P13(1,3) Totals_P15(1,3) Totals_P16(1,3) Totals_P17(1,3) Totals_P18(1,3) Totals_P19(1,3) Totals_P20(1,3)];
mTBRD0 = mean(TBRD0,'omitnan');
stdTBRD0 = std(TBRD0,'omitnan');
TBRD1 = [Totals_P1(2,3) Totals_P2(2,3) Totals_P3(2,3) Totals_P5(2,3) Totals_P7(2,3) Totals_P11(2,3) Totals_P12(2,3) Totals_P13(2,3) Totals_P15(2,3) Totals_P16(2,3) Totals_P17(2,3) Totals_P18(2,3) Totals_P19(2,3) Totals_P20(2,3)];
mTBRD1 = mean(TBRD1,'omitnan');
stdTBRD1 = std(TBRD1,'omitnan');
TBRD2 = [Totals_P1(3,3) Totals_P2(3,3) Totals_P3(3,3) Totals_P5(3,3) Totals_P7(3,3) Totals_P11(3,3) Totals_P12(3,3) Totals_P13(3,3) Totals_P15(3,3) Totals_P16(3,3) Totals_P17(3,3) Totals_P18(3,3) Totals_P19(3,3) Totals_P20(3,3)];
mTBRD2 = mean(TBRD2,'omitnan');
stdTBRD2 = std(TBRD2,'omitnan');



mTotals = [mTBIC0 mTBRD0;mTBIC1 mTBRD1;mTBIC2 mTBRD2];
stdTotals = [stdTBIC0 stdTBRD0;stdTBIC1 stdTBRD1;stdTBIC2 stdTBRD2];

figure(3)
X = categorical({'0 kg Bicep' '0kg Brachioradialis'; '1 kg Bicep' '1 kg Brachioradialis';'2 kg Bicep' '2 kg Brachioradialis'});
X = reordercats(X,{'0 kg Bicep' '0kg Brachioradialis'; '1 kg Bicep' '1 kg Brachioradialis';'2 kg Bicep' '2 kg Brachioradialis'});
bar(X(1:3),mTotals(:,1),'stacked','FaceColor',[0 0.4470 0.7410],'EdgeColor',[0 0.4470 0.7410],'FaceAlpha',0.5','linewidth',1)
hold on
bar(X(4:6),mTotals(:,2),'stacked','FaceColor',[0.8500 0.3250 0.0980],'EdgeColor',[0.8500 0.3250 0.0980],'FaceAlpha',0.5,'LineWidth',1)
errorbar(X(1:3),mTotals(:,1),stdTotals(:,1),'.','linewidth',5,'color','b','Capsize',18);
errorbar(X(4:6),mTotals(:,2),stdTotals(:,2),'.','linewidth',5,'color','r','Capsize',18);

sz = 100;
scatter(X(1:3),mPeaks(:,1),sz,'filled','Markerfacecolor',"#7E2F8E");
scatter(X(4:6),mPeaks(:,2),sz,'filled','Markerfacecolor',"#7E2F8E");
a = errorbar(X(1:3),mPeaks(:,1),stdPeaks(:,1),'.','linewidth',2,'color',"#7E2F8E",'Capsize',10);
errorbar(X(4:6),mPeaks(:,2),stdPeaks(:,2),'.','linewidth',2,'color',"#7E2F8E",'Capsize',10)
hold off
fontsize(16,'points')
ylabel('Reduction in EMG from device (%)')
%{
figure(2)
X = categorical({'0 kg BIC' '0kg BRD'; '1 kg BIC' '1 kg BRD';'2 kg BIC' '2 kg BRD'});
X = reordercats(X,{'0 kg BIC' '0kg BRD'; '1 kg BIC' '1 kg BRD';'2 kg BIC' '2 kg BRD'});
bar(X,mTotals)
hold on
er = errorbar(X,mTotals,stdTotals);
hold off
legend({'Biceps','Brachioradialis'},'Location','northeast')
fontsize(16,'points')
title('Integrated Reductions')
%}



%Participants = ['P.01';'P.02';'P.03';'P.04';'P.05';'P.06';'P.07';'Mean'];
%Peaks =
%table(Participants,Peak_Total_0kg,Peak_BIC_0kg,Peak_BRD_0kg,Peak_Total_1kg,Peak_BIC_1kg,Peak_BRD_1kg,Peak_Total_2kg,Peak_BIC_2kg,Peak_BRD_2kg)

xbox = categorical({'0 kg'; '1 kg';'2 kg'});
box = [xbox,mTT];
figure(4)
boxplot(box)
