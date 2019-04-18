load resultk.txt

%f = @(x) x;

%x = result1(:,1); 

 x=resultk(1,1):20:120;         %x轴上的数据，第一个值代表数据开始，第二个值代表间隔，第三个值代表终止
 k=resultk(:,2) ;               %K数据y值
 k0=resultk(:,3);               %K0数据y值
 k1 = resultk(:,4);              %K1数据y值
 kbest = resultk(:,5);
 plot(x,k,'-*b',x,k0,'-or',x,k1,'-dk',x,kbest,'-+g'); title('�?�?-任�??')   %线性，颜色，标记
axis([0,120,0,20]) %确定x轴与y轴框图大小
set(gca,'XTick',0:20:120); %x轴范围1-6，间隔1
set(gca,'YTick',0:5:20); %y轴范围0-700，间隔100
legend('随机迁移策略','本地执行','云上执行','联合迁移策略');  %右上角标注
xlabel('任务数量') %x轴坐标描述
ylabel('负载')  %y轴坐标描述
load result1.txt

