%clear;
clc;close all;

T(:,2)=Q;
[Tcloud,Tlocal]=groupT(T,Tnum); %T(:,2)
[C,L] = rank(Tcloud,Tlocal);    %云端执行序列C;本地执行序列L
[t,e,tcomp] = sysload(C,L,Ptu,Pcpu);  %t,e
K = rt*t+re*e;


