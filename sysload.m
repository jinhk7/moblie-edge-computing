function [t,e,eloc,eser,tloc,tser,tcomp] = sysload(C,L,Ptu,Pcpu)
%UNTITLED17 此处显示有关此函数的摘要
%   此处显示详细说明
if isempty(C)
    tcomp = zeros(0);
else
    tcomp=zeros(1,size(C,1));
    for i = 1:size(C,1)
     if i == 1 
      tcomp(i) = C(i,7) + C(i,6);
     else 
      tcomp(i) = max(C(i,7),tcomp(i-1)) +C(i,6);
     end
    end
end

tser = sum(tcomp) ;

if isempty(tcomp)
    eser = 0;
    else
    eser = sum(tcomp(:,7))*Ptu;
end

tloc = sum(L(:,5)) ;
eloc = tloc * Pcpu;

t = max(tloc,tser);
e = eloc + eser ;
end