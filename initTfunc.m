function [T] = initTfunc(Tnum,floc,fser,Rptu)
%UNTITLED10 此处显示有关此函数的摘要
%   此处显示详细说明
T = zeros(Tnum,7); 
for i = 1:Tnum
    
    T (i,1)=i;                  %任务ID
    T (i,3)=rand()*2;           %任务计算量 M 
    T (i,4)=rand();             %任务数据量 MB
    T (i,5)=T(i,3)/floc;             %本地执行时间 单位秒s
    T (i,6)=T(i,3)/fser;             %云端执行时间 单位秒s
    T (i,7)=T(i,4)/Rptu;        %任务上传时间 单位秒s

    % 初始化任务是否迁移（随机初始化）
    if rand()>=0.5 %%任务是否迁移
        T (i,2)=1;
    else
        T(i,2)=0;
    end

end
end

