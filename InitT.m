%初始化T
clc;clear;close all;


floc=1000  ;      %1Ghz
fser=100000 ;     %100 Ghz
Tnum = 200;        %任务数量 
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 2 ;       %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
K = 0;            %负载K
%A(i,:)提取矩阵A的第i行 A(:,i)提取矩阵A的第i列

[T] = initTfunc(Tnum,floc,fser,Rptu);


Q = T(:,2);%控制序列
Q0 = zeros(Tnum,1);%控制序列
Q1 = zeros(Tnum,1)+1;%控制序列