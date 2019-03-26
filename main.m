%clear;
K0=KK(T,Tnum,Q0,Ptu,Pcpu,rt,re);
%K=KK(T,Tnum,Q,Ptu,Pcpu,rt,re);
K1=KK(T,Tnum,Q1,Ptu,Pcpu,rt,re);
%% 初始化种群



[Kbest,Qbest] = BPSO(T,Tnum,Q,Ptu,Pcpu,rt,re)
%result = [Tnum,K,K0,K1];
%dlmwrite('result1.txt',result,'-append');

