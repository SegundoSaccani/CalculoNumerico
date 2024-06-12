clear all;clc
format long

f = @(x) 1./(4*x);

xx = [1:3];
y = f(xx);

pL = @(x) polyval(polyfit(xx,y,2),x);

X = linspace(1,3,201);
plot(X,pL(X),xx,y,'ok')

err_real = abs(pL(1.7)-f(1.7))

d3f = @(x) -3./(2*(x.^4));

plot(X,(d3f(X)/factorial(3)))
err_teorico_max = (max(abs(d3f(X)))/factorial(3))*(1.7-1)*(1.7-2)*(1.7-3)
