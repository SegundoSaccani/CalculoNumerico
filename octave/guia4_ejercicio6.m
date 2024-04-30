clear all; clc
a = 0.401;
b = 42.7e-6;
N = 1000;
T = 300;
p = 3.5e+7;
k = 1.3806503e-23;

f= @(V) (p + a*(N./V ).^2).*(V-N*b) - k*N*T
df= @(V) ((2*(a^2)*(N^3)*b)/V^3) - ((a^2)*(N^2)- 2*p*a*(N^2)*b)/V^2 + p^2

vspace = linspace(-10,10,1000);
plot(vspace,f(vspace))
grid on;

[xp,hb,itb] = biseccion(f,-1,1,100,1e-5)
[V,h,it,t] = newton(f,df,xp,100,1e-12)

disp("El volumen que ocupan es ")
V
