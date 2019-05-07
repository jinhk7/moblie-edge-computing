clc;clear;close all
%% 任务数设置
step = 1;          %任务数间隔
Num = 1:1:5000;        %局点个数
testT = Num*step;   %任务数集合
%% 参数设置
floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 5 ;        %Mbps
rt = 0.5;         %时间权重
re = 0.5;         %能耗权重
Gnum = 2000;       %迭代次数***
%K = 0;            %负载K
%% 保存路径
now = datestr(now,30); %获取系统时间按20190101T1200的格式输出
Path = '/Users/Johnny/Documents/06Workplace/MATLAB/moblie-edge-computing/Results/';
path = strcat(Path,now,'/');
mkdir(path); %创建存放数据的文件夹
pathdata = strcat(path,'data/');
mkdir(pathdata);
Tasks = load('task5000');
counter1=1;
counter2=1;
counter3=1;
Kbox= zeros(max(Num),5);
for i = Num
    
    Tnum = i;
    [T] =  initnewT(Tasks,Tnum,floc,fser,Rptu);
    Qrand = T(:,2);             %生成控制序列Q
    Qloc = zeros(Tnum,1);     %生成控制序列Q0
    Qser = zeros(Tnum,1)+1;   %生成控制序列Q1

    [K0,t0,e0]=KK(T,Tnum,Qloc,Ptu,Pcpu,rt,re);
    [K,t,e]=KK(T,Tnum,Qrand,Ptu,Pcpu,rt,re);
    [K1,t1,e1]=KK(T,Tnum,Qser,Ptu,Pcpu,rt,re);
    
    
    Kbox(i,1) = i;
    Kbox(i,2) = K0;
    Kbox(i,3) = K;
    Kbox(i,4) = K1;
    if Kbox(i,2)<=Kbox(i,3)&& Kbox(i,2)<=Kbox(i,4)
        Kbox(i,5) = 0;
    elseif Kbox(i,4)<=Kbox(i,3)&& Kbox(i,4)<=Kbox(i,2)
        Kbox(i,5) = 1;
    elseif Kbox(i,3)<=Kbox(i,2)&& Kbox(i,3)<=Kbox(i,4)
        Kbox(i,5) = 2; %rand
    end
    
%     if abs(K0-K1)<=5
%         Tloc_ser(counter1,1)= Tnum;
%         Tloc_ser(counter1,2)= K0;
%         Tloc_ser(counter1,3)= K1;
%         counter1 = counter1 + 1;
%     elseif abs (K0-K)<=5
%         Tloc_rand(counter2,1)= Tnum;
%         Tloc_rand(counter2,2)= K0;
%         Tloc_rand(counter2,3)= K;
%         counter2 = counter2 + 1;
%     elseif abs (K1-K)<=5
%         Tser_rand(counter3,1)= Tnum;
%         Tser_rand(counter3,2)= K1;
%         Tser_rand(counter3,3)= K;
%         counter3 = counter3 + 1;
%     end
        
end

