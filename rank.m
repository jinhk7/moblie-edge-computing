function [C,L] = rank(Tcloud,Tlocal)
%UNTITLED15 此处显示有关此函数的摘要
%   此处显示详细说明
f=0;g=0;
for i = 1:size(Tcloud,1)
    if Tcloud(i,7) < Tcloud(i,6)
        f=f+1;
    else 
        g=g+1;
    end
end


F=zeros(f,7);
G=zeros(g,7);

n=1;m=1;
for i = 1:size(Tcloud,1)
    if Tcloud(i,7) < Tcloud(i,6)
        F(n,:) =Tcloud(i,:);n=n+1;
    else 
        G(m,:) = Tcloud(i,:);m=m+1;
    end
end
F1 = sortrows(F,7,'ascend');
G1 = sortrows(G,6,'descend');
%C = sortrows(  , [7 6] ,{'ascend' 'descend'}) ;
C = cat(1, F1, G1) ;
L = sortrows(Tlocal,5); %本地执行序列L
end