clear all;clc

Nh = 20 #definir

L = 5;
P= 1.0326e+4;
w = 0.07;
s=0.14;
J=(w*(s^3))/12;
E= 210e+3;
fj=P/(E*J);

h= L/Nh;

b = ones(Nh-3,1)*((h^4)*fj);

A = diag(ones(Nh-3,1)*6) + diag(ones(Nh-4,1)*-4,-1) + diag(ones(Nh-4,1)*-4,1) + diag(ones(Nh-5,1)*1,-2) + diag(ones(Nh-5,1)*1,2);

tol = 1e-8;

[x,it,h] = gaussseidel(A,b,ones(Nh-3,1)*1e3,15000,tol);
it

xfinal = zeros(Nh+1,1);
xfinal(3:Nh-1) =x




