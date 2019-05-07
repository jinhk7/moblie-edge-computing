clc;clear;close all
%% 任务数设置
step = 1;          %任务数间隔
Num = 1:1:1000;        %局点个数
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
%Num1 = 1:1:40;
%step1 = 50;
Gnum =2000;       %迭代次数***
%K = 0;            %负载K
%% 保存路径
Tasks = load('Task1000');
%% 数据计算
key = load('matlab');
KKs = zeros(max(Num),2);
KKKbest = zeros(max(Num),2);
for j = Num
    
    
    Tnum = j*step;              %任务数量
    %[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T
    [T] =  initnewT(Tasks,Tnum,floc,fser,Rptu);
    
    Qrand = T(:,2);             %生成控制序列Q
    Qloc = zeros(Tnum,1);     %生成控制序列Q0
    Qser = zeros(Tnum,1)+1;   %生成控制序列Q1
    
    
    [Kbest,Qbest,tbest,ebest,Ks] = BPSO(T,Tnum,Qrand,Ptu,Pcpu,rt,re,Gnum,key.a);
    [Kbest1,Qbest1,tbest1,ebest1,Ks1] = BPSO1(T,Tnum,Qrand,Ptu,Pcpu,rt,re,Gnum);
    KKs(j,1)=max(Ks)-min(Ks);
    KKs(j,2)=max(Ks1)-min(Ks1);
    KKKbest(j,1)=Kbest;
    KKKbest(j,2)=Kbest1;
    %end
    
end