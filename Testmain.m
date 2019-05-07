clc;clear;close all

Tnum = 1000;

floc=1  ;      %1Ghz
fser=100 ;     %100 Ghz
Pcpu = 0.5 ;      %0.5W
Ptu = 2 ;         %2W
Rptu = 5 ;        %Mbps
rt = 0.3;         %时间权重
re = 0.7;         %能耗权重
Gnum = 2000;       %迭代次数***


Tasks = load('Task1000');
[T] =  initnewT(Tasks,Tnum,floc,fser,Rptu);

Qrand = T(:,2);             %生成控制序列Q
Qloc = zeros(Tnum,1);     %生成控制序列Q0
Qser = zeros(Tnum,1)+1;   %生成控制序列Q1

%clear;
[Klocal,tlocal,elocal]=KK(T,Tnum,Qloc,Ptu,Pcpu,rt,re);
[K,t,e]=KK(T,Tnum,Qrand,Ptu,Pcpu,rt,re);
[Kcloud,tcloud,ecloud,C,L]=KK(T,Tnum,Qser,Ptu,Pcpu,rt,re);
%% 初始化种群


[Kbest,Qbest,Tbest,Ebest] = BPSO(T,Tnum,Qrand,Ptu,Pcpu,rt,re,Gnum);
%[Kbest,Qbest,tbest,ebest] = BPSO(T,Tnum,Q,Ptu,Pcpu,rt,re);
%result = [Tnum,K,K0,K1];
%dlmwrite('result1.txt',result,'-append');

%result = [Tnum,t,t0,t1,tbest];
%dlmwrite('resulttime.txt',result,'-append');

%result = [Tnum,e,e0,e1,ebest];
%dlmwrite('resulte.txt',result,'-append');

%result = [Tnum,K,K0,K1,Kbest];
%dlmwrite('resultk.txt',result,'-append');