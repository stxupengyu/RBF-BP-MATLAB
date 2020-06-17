clear
clc
num=2;
%创建训练样本输入集
data=csvread('data.csv',1,1);
%归一化
data1=data';
data1=data1(6:8,:);
[B,PS]=mapminmax(data1,0,1);%反归一化
A=mapminmax('reverse',B,PS);

[y_train_predict,train_error,y_train]=funrbf2();
y_train_predict=mapminmax('reverse',y_train_predict,PS);
y_train=mapminmax('reverse',y_train,PS);
[y_train_predict2,train_error2,y_train2]=funbp2();
y_train_predict2=mapminmax('reverse',y_train_predict2,PS);

%图1
figure(1)
plot(1:length(train_error),train_error(num,:),'r-',1:length(train_error2),train_error2(num,:),'b-.')
title('mse')
hold on
grid
legend('rbf','bp');
%图2
%过程中会出现
%图3
figure(2)
plot(1:length(y_train_predict),y_train_predict(num,:),'r-',1:length(y_train_predict2),y_train_predict2(num,:),'b-.',1:length(y_train),y_train(num,:),'k')
title('compare')
hold on
grid
legend('rbf','bp','real');
