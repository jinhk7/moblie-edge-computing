function tplot(result)
%f = @(x) x;

%x = result1(:,1); 
%A = 
%Xn = size(resulte(:,1));
c=0;
n = size(result,1);
Xjg(1,1) = result(2,1)-result(1,1);

Ym = max(max(result(:,[2,3,4,5])));
while Ym>10
    Ym=Ym/10;
    c = c+1; 
end
YM = ceil(Ym);
YM = YM*10^c;

x=result(1,1):Xjg(1,1):n*Xjg;  %x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
e=result(:,2);                %K数据y值
e0=result(:,3);                %K0数据y值
e1 = result(:,4);              %K1数据y值
ebest = result(:,5);
plot(x,e,'-+b',x,e0,'-or',x,e1,'-^k',x,ebest,'-*m'); title('延时-任务')     %线性，颜色，标记
axis([0,n*Xjg+Xjg,0,YM])  %确定x轴与y轴框图大小
set(gca,'XTick',0:Xjg(1,1):n*Xjg+Xjg); %x轴范围，间隔1
set(gca,'YTick',0:YM/20:YM); %y轴范围0-100，间隔5
legend('"一半一半"策略','本地优先策略','云服务器优先策略','优化联合任务迁移策略','Location','northwest');   %右上角标注
xlabel('任务数量')  %x轴坐标描述
ylabel('延时/ms') %y轴坐标描述
end





