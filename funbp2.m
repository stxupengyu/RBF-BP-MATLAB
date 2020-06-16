function [out1,out2,out3] =fun()
%创建训练样本输入集
data=csvread('data.csv',1,1);
%归一化
data1=data';
data=mapminmax(data1,0,1);
data=data';
%建立训练集测试集
x_train=data(:,1:5).';
y_train=data(:,6:end).';
%创建BP神经网络
%创建网络
net=newff(minmax(x_train),[1,3],{'tansig','purelin'},'trainlm');%隐层神经元个数，输出层神经元个数
%设置训练次数
net.trainParam.epochs = 20;
%设置收敛误差
net.trainParam.goal=0.01;
%训练网络
[net,tr]=train(net,x_train,y_train);
%在训练集和测试集上的表现
y_train_predict=sim(net,x_train);

%求出误差 训练集和测试集
err=y_train_predict- y_train;
train_error=(err.*err)/length(y_train);

out1=y_train_predict;
out2=train_error;
out3=y_train;
end