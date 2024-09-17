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
P0 = [Peaks_P1(1,1) Peaks_P2(1,1) Peaks_P3(1,1) Peaks_P5(1,1) Peaks_P7(1,1) Peaks_P9(1,1) Peaks_P11(1,1) Peaks_P12(1,1) Peaks_P13(1,1) Peaks_P15(1,1) Peaks_P16(1,1) Peaks_P17(1,1) Peaks_P18(1,1) Peaks_P19(1,1) Peaks_P20(1,1)];
mP0 = mean(P0,'omitnan');
stdP0 = std(P0,'omitnan');
P1 = [Peaks_P1(2,1) Peaks_P2(2,1) Peaks_P3(2,1) Peaks_P5(2,1) Peaks_P7(2,1) Peaks_P9(2,1) Peaks_P11(2,1) Peaks_P12(2,1) Peaks_P13(2,1) Peaks_P15(2,1) Peaks_P16(2,1) Peaks_P17(2,1) Peaks_P18(2,1) Peaks_P19(2,1) Peaks_P20(2,1)];
mP1 = mean(P1,'omitnan');
stdP1 = std(P1,'omitnan');
P2 = [Peaks_P1(3,1) Peaks_P2(3,1) Peaks_P3(3,1) Peaks_P5(3,1) Peaks_P7(3,1) Peaks_P9(3,1) Peaks_P11(3,1) Peaks_P12(3,1) Peaks_P13(3,1) Peaks_P15(3,1) Peaks_P16(3,1) Peaks_P17(3,1) Peaks_P18(3,1) Peaks_P19(3,1) Peaks_P20(3,1)];
mP2 = mean(P2,'omitnan');
stdP2 = std(P2,'omitnan');
T0 = [Totals_P1(1,1) Totals_P2(1,1) Totals_P3(1,1) Totals_P5(1,1) Totals_P7(1,1) Totals_P9(1,1) Totals_P11(1,1) Totals_P12(1,1) Totals_P13(1,1) Totals_P15(1,1) Totals_P16(1,1) Totals_P17(1,1) Totals_P18(1,1) Totals_P19(1,1) Totals_P20(1,1)];
mT0 = mean(T0,'omitnan');
stdT0 = std(T0,'omitnan');
T1 = [Totals_P1(2,1) Totals_P2(2,1) Totals_P3(2,1) Totals_P5(2,1) Totals_P7(2,1) Totals_P9(2,1) Totals_P11(2,1) Totals_P12(2,1) Totals_P13(2,1) Totals_P15(2,1) Totals_P16(2,1) Totals_P17(2,1) Totals_P18(2,1) Totals_P19(2,1) Totals_P20(2,1)];
mT1 = mean(T1,'omitnan');
stdT1 = std(T1,'omitnan');
T2 = [Totals_P1(3,1) Totals_P2(3,1) Totals_P3(3,1) Totals_P5(3,1) Totals_P7(3,1) Totals_P9(3,1) Totals_P11(3,1) Totals_P12(3,1) Totals_P13(3,1) Totals_P13(3,1) Totals_P16(3,1) Totals_P17(3,1) Totals_P18(3,1) Totals_P19(3,1) Totals_P20(3,1)];
mT2 = mean(T2,'omitnan');
stdT2 = std(T2,'omitnan');


%Calculate mean and Standard Deviation of Peaks and Totals
mPT = [mP0;mP1;mP2];
stdPT = [stdP0;stdP1;stdP2];
mTT = [mT0;mT1;mT2];
stdTT = [stdT0;stdT1;stdT2];

%Plot Peaks and Totals
figure(1)
Cats = [1;2;3;4;5;6;7;8];
Empty = zeros([1 15]);
Peak = [P0;Empty;Empty;P1;Empty;Empty;P2;Empty];
Peak2 = rot90(Peak);
Total = [Empty;T0;Empty;Empty;T1;Empty;Empty;T2];
Total2 = rot90(Total);

boxchart(Peak2)
hold on
boxchart(Total2)
legend('Peak','Integrated')
ylabel('Reduction in %EMG between device off and on')
ylim([-20 100])
fontsize(16,'points')
%{
boxplot(Peak2,Cats,'Widths',0.3,'Orientation','horizontal','Boxstyle','outline')
hold on
boxplot(Total2,Cats,'Widths',0.3,'Orientation','horizontal','Boxstyle','outline')
%}
%{
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
%}
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
%anovaPeaks = anova(allpeaks);
alltotals = transpose([T0;T1;T2]);
%anovaTotals = anova(alltotals);

nmbparticipants = 15;
%Conduct 2-way ANOVA on Peaks

allpeaks0 = zeros(15,3,'single');
%anova2peaks = [allpeaks;allpeaks0];
%[~,~,stats] = anova2(anova2peaks,nmbparticipants);

%Conduct 2-way ANOVA on Totals
alltotals0 = zeros(15,3,'single');
anova2totals = [alltotals;alltotals0];
[~,~,stats] = anova2(anova2totals,nmbparticipants);

P0R = [Peaks_P1(1,1);Peaks_P2(1,1);Peaks_P3(1,1);NaN;Peaks_P5(1,1);NaN;Peaks_P7(1,1);NaN;Peaks_P9(1,1);NaN;Peaks_P11(1,1);Peaks_P12(1,1);Peaks_P13(1,1);NaN;Peaks_P15(1,1);Peaks_P16(1,1);Peaks_P17(1,1);Peaks_P18(1,1);Peaks_P19(1,1);Peaks_P20(1,1);mP0;stdP0];
P1R = [Peaks_P1(2,1);Peaks_P2(2,1);Peaks_P3(2,1);NaN;Peaks_P5(2,1);NaN;Peaks_P7(2,1);NaN;Peaks_P9(2,1);NaN;Peaks_P11(2,1);Peaks_P12(2,1);Peaks_P13(2,1);NaN;Peaks_P15(2,1);Peaks_P16(2,1);Peaks_P17(2,1);Peaks_P18(2,1);Peaks_P19(2,1);Peaks_P20(2,1);mP1;stdP1];
P2R = [Peaks_P1(3,1);Peaks_P2(3,1);Peaks_P3(3,1);NaN;Peaks_P5(3,1);NaN;Peaks_P7(3,1);NaN;Peaks_P9(3,1);NaN;Peaks_P11(3,1);Peaks_P12(3,1);Peaks_P13(3,1);NaN;Peaks_P15(3,1);Peaks_P16(3,1);Peaks_P17(3,1);Peaks_P18(3,1);Peaks_P19(3,1);Peaks_P20(3,1);mP2;stdP2];
T0R = [Totals_P1(1,1);Totals_P2(1,1);Totals_P3(1,1);NaN;Totals_P5(1,1);NaN;Totals_P7(1,1);NaN;Totals_P9(1,1);NaN;Totals_P11(1,1);Totals_P12(1,1);Totals_P13(1,1);NaN;Totals_P15(1,1);Totals_P16(1,1);Totals_P17(1,1);Totals_P18(1,1);Totals_P19(1,1);Totals_P20(1,1);mT0;stdT0];
T1R = [Totals_P1(2,1);Totals_P2(2,1);Totals_P3(2,1);NaN;Totals_P5(2,1);NaN;Totals_P7(2,1);NaN;Totals_P9(2,1);NaN;Totals_P11(2,1);Totals_P12(2,1);Totals_P13(2,1);NaN;Totals_P15(2,1);Totals_P16(2,1);Totals_P17(2,1);Totals_P18(2,1);Totals_P19(2,1);Totals_P20(2,1);mT1;stdT1];
T2R = [Totals_P1(3,1);Totals_P2(3,1);Totals_P3(3,1);NaN;Totals_P5(3,1);NaN;Totals_P7(3,1);NaN;Totals_P9(3,1);NaN;Totals_P11(3,1);Totals_P12(3,1);Totals_P13(3,1);NaN;Totals_P13(3,1);Totals_P16(3,1);Totals_P17(3,1);Totals_P18(3,1);Totals_P19(3,1);Totals_P20(3,1);mT2;stdT2];

Participants = ['P.01';'P.02';'P.03';'P.04';'P.05';'P.06';'P.07';'P.08';'P.09';'P.10';'P.11';'P.12';'P.13';'P.14';'P.15';'P.16';'P.17';'P.18';'P.19';'P.20';'Mean';'StDv'];
Results = table(Participants,P0R,P1R,P2R,T0R,T1R,T2R);
