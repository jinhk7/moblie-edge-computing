function efplot(resulte)
%f = @(x) x;

%x = result1(:,1); 
%A = 
x=resulte(1,1):5:resulte(5,1)+5;  %x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
k=resulte(:,2) ;                %K数据y值
k0=resulte(:,3);                %K0数据y值
k1 = resulte(:,4);              %K1数据y值
kbest = resulte(:,5);
plot(x,k,'-*b',x,k0,'-or',x,k1,'-dk',x,kbest,'-+g'); title('能耗-任务')     %线性，颜色，标记
axis([0,30,0,10])  %确定x轴与y轴框图大小
set(gca,'XTick',0:5:30); %x轴范围，间隔1
set(gca,'YTick',0:1:10); %y轴范围0-100，间隔5
legend('随机迁移策略','本地执行','云上执行','联合迁移策略');   %右上角标注
xlabel('任务数量')  %x轴坐标描述
ylabel('能耗') %y轴坐标描述
end


