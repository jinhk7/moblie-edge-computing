%clear;
[Klocal,tlocal,elocal]=KK(T,Tnum,Q0,Ptu,Pcpu,rt,re);
[K,t,e,C,L]=KK(T,Tnum,Q,Ptu,Pcpu,rt,re);
[Kcloud,tcloud,ecloud]=KK(T,Tnum,Q1,Ptu,Pcpu,rt,re);
%% 初始化种群


%[Kbest,Qbest] = BPSO(T,Tnum,Q,Ptu,Pcpu,rt,re);
[Kbest,Qbest,tbest,ebest] = BPSO(T,Tnum,Q,Ptu,Pcpu,rt,re);
%result = [Tnum,K,K0,K1];
%dlmwrite('result1.txt',result,'-append');

%result = [Tnum,t,t0,t1,tbest];
%dlmwrite('resulttime.txt',result,'-append');

%result = [Tnum,e,e0,e1,ebest];
%dlmwrite('resulte.txt',result,'-append');

%result = [Tnum,K,K0,K1,Kbest];
%dlmwrite('resultk.txt',result,'-append');