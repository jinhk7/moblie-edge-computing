load result1.txt

%f = @(x) x;

%x = result1(:,1); 

 x=result1(1,1):20:result1(5,1);  %x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
 k=result1(:,2) ;                %K数据y值
 k0=result1(:,3);                %K0数据y值
 k1 = result1(:,4);              %K1数据y值
 plot(x,k,'-*b',x,k0,'-or',x,k1,'-dk'); title('负载-任务')     %线性，颜色，标记
axis([0,120,0,100])  %确定x轴与y轴框图大小
set(gca,'XTick',0:20:120); %x轴范围1-6，间隔1
set(gca,'YTick',0:5:100); %y轴范围0-700，间隔100
legend('联合迁移策略','本地执行','云上执行');   %右上角标注
xlabel('任务数量')  %x轴坐标描述
ylabel('负载') %y轴坐标描述
