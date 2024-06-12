clear all;clc
format long

f =  @(x) 5./x;

x = [1:3]
y = f(x)

[a,b,c,d] = cubic_spline_natural(x,y)

s = funcion_spline(x,y);

xx = linspace(1,3,201);

plot(xx,s(xx),xx,f(xx),x,y,'ok')
