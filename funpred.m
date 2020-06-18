function [out1,out2,out3] =fun(x)

%归一化和反归一化准备
test=csvread('data.csv',1,1);
test1=test(:,1:5)';
test2=test(:,6:8)';
[B1,PS1]=mapminmax(test1,0,1);
[B2,PS2]=mapminmax(test2,0,1);
A=mapminmax('reverse',B1,PS1);%反归一化准备
A2=mapminmax('reverse',B2,PS2);%反归一化准备
x=mapminmax('apply',x,PS1);%对输入归一化


%创建训练样本输入集
data=csvread('data.csv',1,1);
%归一化
data1=data';
data=mapminmax(data1,0,1);
data=data';
%建立训练集测试集
x_train=data(:,1:5).';
y_train=data(:,6:end).';
%创建、训练网络
net=newrb(x_train,y_train,0.005,1,25,5);

%在测试集上的表现
predict=sim(net,x);
predict=mapminmax('reverse',predict,PS2);%对输出反归一化

out1=predict(1);
out2=predict(2);
out3=predict(3);
end