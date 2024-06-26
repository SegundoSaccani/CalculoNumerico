clear all;clc
format short

#{
y'' = algo

u(1) = y
u(2) = u(1)' = y'
y'' = u(2)' = algo
#}

L = 120;
E = 2.1e6;
I=4250;
P=3000;

F = @(x,u) [u(2);((1+(u(2)).^2).^(3/2)).*((P*(L-x))/(E*I))];

y0 = [0;0];
inter = [0 L];
h = 0.5;
subinter = L/h

[tt,y] = rk4(F,inter,y0,subinter);

figure(1)
plot(tt,y(:,1))
disp("El valor maximo es")
disp(max(y(:,1)))
disp("se encuentra en x=")
disp(L)

figure(2)
s = funcion_spline(tt',y(:,2)');
plot(tt,s(tt))

s_b = @(x) s(x)-0.0019;

b = biseccion(s_b,0,L,1000,1e-2)
