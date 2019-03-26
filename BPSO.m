function [Kbest,Qbest] = BPSO(T,Tnum,~,Ptu,Pcpu,rt,re)
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
N = 50;                         % 初始种群个数
d = 1;                          % 空间维数
ger = 100;                      % 最大迭代次数   
w = 0.8;                        % 惯性权重
c1 = 0.5;                       % 自我学习因子
c2 = 0.5;                       % 群体学习因子 
x = zeros(1, Tnum );
for i = 1:1:Tnum
    if rand() > 0.5
        x( 1 , i ) = 1;
    else
        x( 1 , i ) = 0;
    end
end
v = zeros (1 ,Tnum);
for i = 1:1:Tnum
    v( 1 , i ) = rand();
end
s = zeros (1, Tnum);
pbest = x; 
pbest_rate = 0; 
for t = 1:1:ger
    charac = x;
    Kval = KK(T,Tnum,charac,Ptu,Pcpu,rt,re);
    if Kval > pbest_rate
        pbest = charac;
        pbest_rate = Kval;
    end
    for i = 1:1:Tnum
        s( 1 , i ) = 1/(1+exp( v (1 , i )));
        if rand() < s( 1 , i )
            x( 1 , i ) = 1;
        else
            x( 1, i ) = 0;
        end
        v( 1 , i ) = s ( 1, i );
    end
end
Qbest = pbest ;
Kbest = pbest_rate;
end

