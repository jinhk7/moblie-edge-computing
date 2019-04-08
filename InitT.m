%初始化T
clc;clear;close all;


floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Tnum = 20;        %任务数量 
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 2 ;        %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
K = 0;            %负载K

[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T

Q = T(:,2);             %生成控制序列Q
Q0 = zeros(Tnum,1);     %生成控制序列Q0
Q1 = zeros(Tnum,1)+1;   %生成控制序列Q1