P0 = readmatrix('P0.txt');
P1 = readmatrix('P1.txt');
P2 = readmatrix('P2.txt');

T0 = readmatrix('T0.txt');
T1 = readmatrix('T1.txt');
T2 = readmatrix('T2.txt');


[h0,p0] = ttest(P0);
[h1,p1] = ttest(P1);
[h2,p2] = ttest(P2);

[h4,p4] = ttest(T0);
[h5,p5] = ttest(T1);
[h6,p6] = ttest(T2);

HResult = [h0 h1 h2 h4 h5 h6]
PValues = [p0 p1 p2 p4 p5 p6]