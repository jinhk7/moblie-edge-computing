function cplot(result)
%f = @(x) x;

%x = result1(:,1); 
%A = 
%Xn = size(resulte(:,1));

n = size(result,1);
Xjg(1,1) = result(2,1)-result(1,1);


x=result(1,1):Xjg(1,1):n*Xjg;  %x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止

c=zeros(n,4);

for i = 1:1:n       
    c(i,1)=result(i,2)/result(i,1);                %crand数据y值
    c(i,2)=result(i,3)/result(i,1);                %cloc数据y值
    c(i,3) = result(i,4)/result(i,1);              %cser数据y值
    c(i,4) = result(i,5)/result(i,1);              %cbest
end

plot(x,c(:,1),'-+b',x,c(:,2),'-or',x,c(:,3),'-^k',x,c(:,4),'-*m'); title('任务迁移比例-任务')     %线性，颜色，标记
axis([0,n*Xjg+Xjg,0,1])  %确定x轴与y轴框图大小
set(gca,'XTick',0:Xjg(1,1):n*Xjg+Xjg); %x轴范围，间隔1
set(gca,'YTick',0:0.05:1); %y轴范围0-100，间隔5
legend('"一半一半"策略','本地优先策略','云服务器优先策略','优化联合任务迁移策略','Location','northwest');   %右上角标注
xlabel('任务数量')  %x轴坐标描述
ylabel('任务迁移比例') %y轴坐标描述
end



