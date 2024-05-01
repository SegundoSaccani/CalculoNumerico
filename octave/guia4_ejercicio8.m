clear all;clc


E = @(t) (((t+1/3).^3) + 1/3).* (e.^-t);
dE = @(t) (-27*e.^(-t).*t.^3 + 54*e.^(-t).*t.^2 + 45*e.^(-t).*t - e.^(-t))/27;
d2E = @(t) (27*e^(-t)*t^3 -135*e^(-t)*t^2 + 63*e^(-t)*t + 46*e^(-t))/27;
d3E = @(t) (-27*e^(-t)*t^3 + 216*e^(-t)*t^2 + -333*e^(-t)*t +17* e^(-t))/27;

Ea = @(t) (( (t+(1/3)).^3 + (1/3)).* (e.^(-t))) -1.5;
tol = 1e-5;

figure(1)
xspace=linspace(0,10,2000);
plot(xspace,E(xspace))
grid on;

figure(2)
plot(xspace,dE(xspace))
grid on;

disp("a)")############################################
disp("\nRaiz 1")
disp("Biseccion")
[xa1_b,ha1_b,ita1_b] = biseccion(Ea,1,2,100,10^-2);
xa1_b
ita1_b
disp("Newton")
[xa1,ha1,ita1] = newton(Ea,dE,xa1_b,100,tol);
xa1
ita1
disp("")

disp("\nRaiz 2")
disp("Biseccion")
[xa2_b,ha2_b,ita2_b] = biseccion(Ea,3,6,100,10^-2);
xa2_b
ita2_b

disp("Newton")
[xa2,ha2,ita2] = newton(Ea,dE,xa2_b,100,tol);
xa2
ita2
disp("")

disp("La Energia es igual a 1.5 en los puntos")
[xa1;xa2]

disp("b)")############################################
disp("Newton")
[xb,hb,itb] = newton(dE,d2E,2.5,100,tol)
disp("\nEl maximo de energia se encuentra en")
xb


disp("\nc)")############################################
disp("Biseccion")
[x3_b,h3_b,it3_b] = biseccion(d2E,0,4,100,10^-2);
x3_b
it3_b

disp("Newton")
[x3,h3,it3] = newton(d2E,d3E,x3_b,100,tol);
x3
it3
disp("")

disp("\nLa tasa de crecimiento maxima esta en")
x3
