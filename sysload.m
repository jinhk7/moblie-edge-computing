function [t,e,tcomp] = sysload(C,L,Ptu,Pcpu)
%UNTITLED17 此处显示有关此函数的摘要
%   此处显示详细说明
if isempty(C)
    tcomp = zeros(0);
    eser = 0;
    tser = 0;
    tloc = sum(L(:,5));
    eloc = tloc * Pcpu;
    t = max(tloc,tser);
    e = eloc + eser ;
elseif isempty(L)
    tloc = sum(C(:,7));
    eloc = tloc * Ptu;
    tcomp=zeros(size(C,1),1);                          %预分配空间 size(C,1)表示矩阵C的行数
    tready=zeros(size(C,1),1);                          %预分配空间
    %计算时间t
    for i = 1:size(C,1)
         if i == 1 
          tready(i,1) = C(i,7);
          tcomp(i,1) = C(i,6) + C(i,7);
         elseif i>1 
          tready(i,1) = C(i,7)+C(i-1,7) ;
          tcomp(i,1) = max(tready(i,1),tcomp(i-1,1)) +C(i,6);
         end
    end
    eser = sum(C(:,7))*Ptu;
    tser = tcomp(size(C,1),1);
    
    t = max(tloc,tser);
    e = eloc + eser ;
    
else
    tcomp=zeros(size(C,1),1);                          %预分配空间 size(C,1)表示矩阵C的行数
    tready=zeros(size(C,1),1);                          %预分配空间
    %计算时间t
    for i = 1:size(C,1)
         if i == 1 
          tready(i,1) = C(i,7);
          tcomp(i,1) = C(i,6) + C(i,7);
         elseif i>1 
          tready(i,1) = C(i,7)+C(i-1,7) ;
          tcomp(i,1) = max(tready(i,1),tcomp(i-1,1)) +C(i,6);
         end
    end
    tloc = sum(L(:,5)) ; %%
    eloc = tloc * Pcpu;
    eser = sum(C(:,7))*Ptu;
    tser = tcomp(size(C,1),1);
    t = max(tloc,tser);
    e = eloc + eser ;
end




end