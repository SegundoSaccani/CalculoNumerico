clear all;clc
format long g

n=41;

h = 1/(n-1);

A = diag(ones(n-2,1)) * 2 + diag(ones(n-3,1),-1) * -1 + diag(ones(n-3,1),1) * -1;

b = (h^2)*20.*e.^(-10.* ( [1:n-2]*h -0.7).^2) ;

b(1) = (h^2).*20.*e.^(-10.* (h-0.7)^2)  +5;
b(n-2) = (h^2).*20.*e.^(-10.* (1-h-0.7)^2 ) +6;
b = b';

[x,it] = gaussseidel(A,b,zeros(n-2,1),2000,1e-6);
it
x(20)

