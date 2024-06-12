clear all;clc
format long

f = @(x) 2.5 + x .* cos(2*x);
df = @(x) -2*x.*sin(2*x)+cos(2*x);

integrando = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);
L = 20
integral_L = cuad_gauss_c(integrando,0,3,L,3)

L=100
integral_L = cuad_gauss_c(integrando,0,3,L,3)


