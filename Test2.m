clc;clear;close all
%% 任务数设置
step = 50;          %任务数间隔
Num = 1:1:20;        %局点个数
testT = Num*step;   %任务数集合
%% 参数设置
floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 5 ;        %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
%%迭代次数
Num1 = 1:1:40;  
step1 = 50;  
Gnum =Num1*step1;       %迭代次数***
%K = 0;            %负载K
%% 保存路径
Tasks = load('Task1000');
%% 数据计算

KKs = zeros(max(Num1),2);
for j = Num1
    Gnum = Num1*step1;
%for i = testT
Tnum = 80;              %任务数量 
%[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T
[T] =  initnewT(Tasks,Tnum,floc,fser,Rptu);

Qrand = T(:,2);             %生成控制序列Q


[Kbest,Qbest,tbest,ebest,Ks] = BPSO(T,Tnum,Qrand,Ptu,Pcpu,rt,re,Gnum(1,j));
[Kbest1,Qbest1,tbest1,ebest1,Ks1] = BPSO1(T,Tnum,Qrand,Ptu,Pcpu,rt,re,Gnum(1,j));
KKs(j,1)=max(Ks)-min(Ks);
KKs(j,2)=max(Ks1)-min(Ks1);
%end

end