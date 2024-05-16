clear all;clc
sem = [0:6]
cant = [432 599 1012 1909 2977 4190 5961]

c6 = polyfit(sem,cant,6);
p6 = @(x) polyval(c6,x);

c1 = polyfit(sem,cant,1);
p1 = @(x) polyval(c1,x);

c2 = polyfit(sem,cant,2);
p2 = @(x) polyval(c2,x);

figure(1)
x1 = linspace(0,6,201);
plot(x1,p6(x1),'r',x1,p2(x1),'g',x1,p1(x1),'b',sem,cant,'*k')
grid on;

#d) Error cuadratico:
err6 = norm(cant - polyval(c6,sem))
err2 = norm(cant - polyval(c2,sem))
err1 = norm(cant - polyval(c1,sem))

#e) prediccion x=10
figure(2)
x2 = linspace(0,11,201);
plot(x2,p6(x2),'r',x2,p2(x2),'g',x2,p1(x2),'b',sem,cant,'*k')
grid on;

disp("\nValores en x=10")
p6(10)
p2(10)
p1(10)
disp("")
#f) error relativo si f(10) = 14900
err6_10 = (abs(14900 - p6(10))/14900)*100
err2_10 = (abs(14900 - p2(10))/14900)*100
err1_10 = (abs(14900 - p1(10))/14900)*100

