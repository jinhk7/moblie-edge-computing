%初始化T
clc;clear;close all;


floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Tnum = 5000;        %任务数量 
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 5 ;        %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重

[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T

