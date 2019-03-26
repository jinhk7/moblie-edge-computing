
function K=KK(T,Tnum,Q,Ptu,Pcpu,rt,re)
T(:,2)=Q;
[Tcloud,Tlocal]=groupT(T,Tnum); %T(:,2)
[C,L] = rank(Tcloud,Tlocal);    %云端执行序列C;本地执行序列L
[t,e] = sysload(C,L,Ptu,Pcpu);  %t,e
K=rt*t+re*e;
disp(K);
return 

end