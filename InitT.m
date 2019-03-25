%初始化T
clc;clear;close all;


floc=1000  ;      %1Ghz
fser=100000 ;     %100 Ghz
Tnum = 40;        %任务数量 
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 2 ;       %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
K = 0;            %负载K
T = zeros(Tnum,7);           %A(i,:)提取矩阵A的第i行 A(:,i)提取矩阵A的第i列

for i = 1:Tnum
    
    T (i,1)=i;      %任务ID
    T (i,3)=rand()*2000;   %任务计算量 M
    T (i,4)=rand();   %任务数据量 MB
    T(i,5)=T(i,3)/floc; %本地执行时间
    T(i,6)=T(i,3)/fser; %云端执行时间
    T(i,7)=T(i,4)/Rptu; % 任务上传时间
% 初始化任务是否迁移（随机初始化）
    if rand()>=0.5 %%任务是否迁移
        T (i,2)=1;
    else
        T(i,2)=0;
    end

end

Q = T(:,2);%控制序列
Q0 = zeros(Tnum,1);%控制序列
Q1 = zeros(Tnum,1)+1;%控制序列