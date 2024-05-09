clear all;clc

p = 3.7;
K = 0.04;

f = @(x) (((x)./(1-x)).*sqrt((2*p)./(2+x))) - K

x = linspace(-3,3,500);

figure(1)
plot(x,f(x));
grid on;

[x_a,h_a,it_a] = biseccion(f,-1,0.9,100,1e-8)

disp("\n El valor de la fraccion molar x de H2O que se disocia es")
disp(x_a)
disp("\n")
####################################

xb = 0.02;
g = @(pb) (((xb)/(1-xb))*sqrt((2*pb)./(2+xb))) - K

pb = linspace(-3,20,103);

figure(2)
plot(pb,g(pb));
grid on;

[p_b,h_b,it_b] = biseccion(g,2,5,100,1e-2)

disp("\n La presion total de la mezcla necesaria para disociar una fraccion molar x=0.02")
disp(p_b)
disp("\n")
