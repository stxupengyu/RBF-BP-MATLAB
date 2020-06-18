x=csvread('data.csv',1,1);
x=x(1,1:5)';
[out1,out2,out3]=funpred(x)