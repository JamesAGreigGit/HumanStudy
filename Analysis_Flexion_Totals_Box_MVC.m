Peaks_P1 = readmatrix('Peak_MVCP1.txt');
Peaks_P2 = readmatrix('Peak_MVCP2.txt');
Peaks_P3 = readmatrix('Peak_MVCP3.txt');
%Peaks_P4 = readmatrix('Peak_MVCP4.txt');
Peaks_P5 = readmatrix('Peak_MVCP5.txt');
%Peaks_P6 = readmatrix('Peak_MVCP6.txt');
Peaks_P7 = readmatrix('Peak_MVCP7.txt');
%Peaks_P8 = readmatrix('Peak_MVCP8.txt');
Peaks_P9 = readmatrix('Peak_MVCP9.txt');
%Peaks_P10 = readmatrix('Peak_MVCP10.txt');
Peaks_P11 = readmatrix('Peak_MVCP11.txt');
Peaks_P12 = readmatrix('Peak_MVCP12.txt');
Peaks_P13 = readmatrix('Peak_MVCP13.txt');
%Peaks_P14 = readmatrix('Peak_MVCP14.txt');
Peaks_P15 = readmatrix('Peak_MVCP15.txt');
Peaks_P16 = readmatrix('Peak_MVCP16.txt');
Peaks_P17 = readmatrix('Peak_MVCP17.txt');
Peaks_P18 = readmatrix('Peak_MVCP18.txt');
Peaks_P19= readmatrix('Peak_MVCP19.txt');
Peaks_P20 = readmatrix('Peak_MVCP20.txt');

Totals_P1 = readmatrix('Total_MVCP1.txt');
Totals_P2 = readmatrix('Total_MVCP2.txt');
Totals_P3 = readmatrix('Total_MVCP3.txt');
%Totals_P4 = readmatrix('Total_MVCP4.txt');
Totals_P5 = readmatrix('Total_MVCP5.txt');
%Totals_P6 = readmatrix('Total_MVCP6.txt');
Totals_P7 = readmatrix('Total_MVCP7.txt');
%Totals_P8 = readmatrix('Total_MVCP8.txt');
Totals_P9 = readmatrix('Total_MVCP9.txt');
%Totals_P10 = readmatrix('Total_MVCP10.txt');
Totals_P11 = readmatrix('Total_MVCP11.txt');
Totals_P12 = readmatrix('Total_MVCP12.txt');
Totals_P13 = readmatrix('Total_MVCP13.txt');
%Totals_P14 = readmatrix('Total_MVCP14.txt');
Totals_P15 = readmatrix('Total_MVCP15.txt');
Totals_P16 = readmatrix('Total_MVCP16.txt');
Totals_P17 = readmatrix('Total_MVCP17.txt');
Totals_P18 = readmatrix('Total_MVCP18.txt');
Totals_P19= readmatrix('Total_MVCP19.txt');
Totals_P20 = readmatrix('Total_MVCP20.txt');

%Create arrays for Peaks and Totals at 0, 1, & 2 kg 
P0 = [Peaks_P1(1) Peaks_P2(1) Peaks_P3(1) Peaks_P5(1) Peaks_P7(1) Peaks_P9(1) Peaks_P11(1) Peaks_P12(1) Peaks_P13(1) Peaks_P15(1) Peaks_P16(1) Peaks_P17(1) Peaks_P18(1) Peaks_P19(1) Peaks_P20(1)];

P1 = [Peaks_P1(2) Peaks_P2(2) Peaks_P3(2) Peaks_P5(2) Peaks_P7(2) Peaks_P9(2) Peaks_P11(2) Peaks_P12(2) Peaks_P13(2) Peaks_P15(2) Peaks_P16(2) Peaks_P17(2) Peaks_P18(2) Peaks_P19(2) Peaks_P20(2)];

P2 = [Peaks_P1(3) Peaks_P2(3) Peaks_P3(3) Peaks_P5(3) Peaks_P7(3) Peaks_P9(3) Peaks_P11(3) Peaks_P12(3) Peaks_P13(3) Peaks_P15(3) Peaks_P16(3) Peaks_P17(3) Peaks_P18(3) Peaks_P19(3) Peaks_P20(3)];

T0 = [Totals_P1(1) Totals_P2(1) Totals_P3(1) Totals_P5(1) Totals_P7(1) Totals_P9(1) Totals_P11(1) Totals_P12(1) Totals_P13(1) Totals_P15(1) Totals_P16(1) Totals_P17(1) Totals_P18(1) Totals_P19(1) Totals_P20(1)];

T1 = [Totals_P1(2) Totals_P2(2) Totals_P3(2) Totals_P5(2) Totals_P7(2) Totals_P9(2) Totals_P11(2) Totals_P12(2) Totals_P13(2) Totals_P15(2) Totals_P16(2) Totals_P17(2) Totals_P18(2) Totals_P19(2) Totals_P20(2)];

T2 = [Totals_P1(3) Totals_P2(3) Totals_P3(3) Totals_P5(3) Totals_P7(3) Totals_P9(3) Totals_P11(3) Totals_P12(3) Totals_P13(3) Totals_P13(3) Totals_P16(3) Totals_P17(3) Totals_P18(3) Totals_P19(3) Totals_P20(3)];

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