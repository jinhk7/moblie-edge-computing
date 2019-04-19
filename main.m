clc;clear;close all
%% 任务数设置
step = 20;          %任务数间隔
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
Gnum = 2000;       %迭代次数***
%K = 0;            %负载K
%% 保存路径
now = datestr(now,30);
Path = '/Users/Johnny/Documents/06Workplace/MATLAB/moblie-edge-computing/Results/';
path = strcat(Path,now,'/');
mkdir(path);
pathdata = strcat(path,'data/');
mkdir(pathdata);
Tasks = load('Task1000');
%% 数据计算
for i = testT
Tnum = i;              %任务数量 
%[T] = initTfunc(Tnum,floc,fser,Rptu); %初始化任务集T
[T] =  initnewT(Tasks,Tnum,floc,fser,Rptu);

Q = T(:,2);             %生成控制序列Q
Q0 = zeros(Tnum,1);     %生成控制序列Q0
Q1 = zeros(Tnum,1)+1;   %生成控制序列Q1


[K0,t0,e0]=KK(T,Tnum,Q0,Ptu,Pcpu,rt,re);
[K,t,e]=KK(T,Tnum,Q,Ptu,Pcpu,rt,re);
[K1,t1,e1]=KK(T,Tnum,Q1,Ptu,Pcpu,rt,re);
[Kbest,Qbest,tbest,ebest] = BPSO(T,Tnum,Q1,Ptu,Pcpu,rt,re,Gnum);


%result = [Tnum,K,K0,K1];
%dlmwrite('result1.txt',result,'-append');

resulte = [Tnum,e,e0,e1,ebest];
resultename = strcat(now,'能耗');
dlmwrite(strcat(pathdata,resultename),resulte,'-append');

resultk = [Tnum,K,K0,K1,Kbest];
resultkname = strcat(now,'负载'); 
dlmwrite(strcat(pathdata,resultkname),resultk,'-append');

resulttime = [Tnum,t,t0,t1,tbest];
resulttimename = strcat(now,'延时');
dlmwrite(strcat(pathdata,resulttimename),resulttime,'-append');

end
%% 绘图
resulte = load(strcat(pathdata,resultename));
figure(1);set(gcf, 'position', [0 0 1000 500]);eplot(resulte);
saveas(1,strcat(path,resultename),'png');

resultk = load(strcat(pathdata,resultkname));
figure(2);set(gcf, 'position', [0 0 1000 500]);kplot(resultk);
saveas(2,strcat(path,resultkname),'png');

resulttime = load(strcat(pathdata,resulttimename));
figure(3);set(gcf, 'position', [0 0 1000 500]);tplot(resulttime);
saveas(3,strcat(path,resulttimename),'png');

