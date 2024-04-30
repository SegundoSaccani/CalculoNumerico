clear all;clc

E = @(t) ( (t+(1/3)).^3 + 1/3).* (e.^(-t))
dE = @(t) (-27*e^(-t)*t^3 + 54*e^(-t)*t^2 + 45*e^(-t)*t - e^(-t))/27;

Ea = @(t) (( (t+(1/3)).^3 + 1/3).* (e.^(-t))) -1.5;
tol = 1e-5;

xspace=linspace(-10,100,1000);
plot(xspace,Ea(xspace))

disp("Biseccion")
[xa_b,ha_b,ita_b] = biseccion(Ea,-10,10,100,10^-2)
disp("Newton")
[xa,ha,ita] = newton(Ea,dE,xa_b,100,tol)

#sin terminar

