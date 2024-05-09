clear all;clc
format long;

f = @(x) sin(x) + cos(1+x.^2) - 1

o1 = linspace(8,8,10);
o2 = linspace(-1,1,10);
x = linspace(7,9,101);
plot(x,f(x),o1,o2)
grid on;

[r1,h1,it1] = biseccion(f,7.8,8,100,1e-9)

disp("La raiz de f mas cercana a 8 es")
r1
