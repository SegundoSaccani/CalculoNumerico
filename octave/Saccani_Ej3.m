clear all;clc
format long

P = @(x) 230*x.^4+18*x.^3+9*x.^2-221*x-9;
y = @(x) x;

x = linspace(-1,1.5,401);

figure(1)
plot(x,P(x),'b',x,y(x),'r')
#Puntos fijos en la interseccion entre p e y: 1ro en (-0.5,0.5), 2do en (0.5,1.5)

#Reescribiendo P(p)=p ---> P(p)-p=0

P_puntofijo = @(x) 230*x.^4+18*x.^3+9*x.^2-221*x-9 - x;

figure(2)
plot(x,P_puntofijo(x))
grid on;

[p1] = biseccion(P_puntofijo,-0.5,0.5,100,1e-6)

[p2] = biseccion(P_puntofijo,0.5,1.5,100,1e-6)
