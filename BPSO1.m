function [Kbest,Qbest,Tbest,Ebest,Ks] = BPSO1(T,Tnum,~,Ptu,Pcpu,rt,re,Gnum)
%UNTITLED9 此处显示有关此函数的摘要
%   此处显示详细说明
%N = 50;                         % 初始种群个数
%d = 1;                          % 空间维数
ger = Gnum;                      % 最大迭代次数
%w = 0.8;                        % 惯性权重
%c1 = 0.5;                       % 自我学习因子
%c2 = 0.5;                       % 群体学习因子 %
%x = zeros(Tnum,1 );
x = zeros(Tnum,1);

for i = 1:1:Tnum
   if rand() > 0.5
        x( i , 1 ) = 1;
    else
        x( i , 1 ) = 0;
    end
end


v = zeros ( Tnum,1);
for i= 1:1:Tnum
    v( i ,1  ) = 2*rand()-1;
end
s = zeros ( Tnum,1);
pbest = x;
[pbest_rate,tbest,ebest] = KK(T,Tnum,x,Ptu,Pcpu,rt,re);  %初始化pbest


Ks = zeros(ger,1);
for t = 1:1:ger
    charac = x;
    
    [Kval ,tb,eb]= KK(T,Tnum,charac,Ptu,Pcpu,rt,re);
    Ks(t,1)=Kval;
    if Kval < pbest_rate
        pbest = charac;
        pbest_rate = Kval;
        tbest = tb ;
        ebest = eb ;
    end
    
    for i = 1:1:Tnum
        s( i,1  ) = 1/(1+exp( v ( i,1  ) )); %更新位置
        if rand() < s( i,1  )
            x( i , 1 ) = 1;
        else
            x( i, 1 ) = 0;
        end
        v( i,1  )  = s ( i,1  ) ;
        %charac = x;
    end
end
Qbest = pbest ;
Kbest = pbest_rate;
Tbest = tbest;
Ebest = ebest;

end

