clear all;clc
format long

P = @(x) 230*x.^4+18*x.^3+9*x.^2-221*x-9;
dP = @(x) 920*x.^3+54*x.^2+18*x-221;
Px = @(x) 230*x.^4+18*x.^3+9*x.^2-221*x-9-x;

xl = linspace(-1,1.5,100);

y = @(x) x;
figure(1)
plot(xl,P(xl),xl,y(xl))
grid on;

figure(2)
plot(xl,dP(xl))
grid on;

figure(3)
plot(xl,Px(xl))
grid on;

disp("Raiz 1")
[x1,h1,it1] = biseccion(P,-0.5,0.5,100,1e-6)
disp("\nRaiz 2")
[x2,h2,it2] = biseccion(P,0.5,1,100,1e-6)

disp("\nEl valor minimo se alcanza en")
[xMin,hMin,itMin] = biseccion(dP,0.5,0.7,100,1e-6)
disp("\nEl valor minimo es")
P(xMin)

disp("\nLa funcion P tiene puntos fijos en")
[p1,h1,itp1] = biseccion(Px,-0.5,0.5,100,1e-6)
disp("\n")
[p2,h2,itp2] = biseccion(Px,0.5,1.5,100,1e-6)

#{
p1
P(p1)

p2
P(p2)
#}
