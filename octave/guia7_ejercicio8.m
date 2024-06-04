clear all;clc;clf

f = @(t,x) [x(1)*(3-0.002*x(2)); -x(2)*(0.5-0.0006*x(1))];

x0 = [1600; 800];
inter = [0 24];
L = inter(2)*10;

[t,x_a] = rk4(f,inter,x0,L);

x1=x_a(:,1);
x2=x_a(:,2);

figure(1)
plot(t,x1,t,x2)
legend("Presa","Predador")

figure(2)
plot(x1,x2,1600,800,'ko')
title("Presas vs Predadores")
xlabel("Presas")
ylabel("Predadores")

#Momento estable??? (x1' = x2' = 0)
x2_estable = 3/0.002;
x1_estable = 0.5/0.0006;
hold on
plot(x2_estable,x1_estable,'ro')
