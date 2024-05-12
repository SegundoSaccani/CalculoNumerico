clear all;clc
format long
# Criterio de error (err=norm(b-A*x,inf);)

n=40;

A = diag([1:n]*2) + diag(ones(n-1,1)*-1,-1) + diag(ones(n-1,1)*-1,1);

b = 1.5*[1:n]-6;
b = b';

[x] = gauss(A,b);

disp("El primer valor de la solucion es")
x1 = x(1)

w = 1.1;

tol = 1e-5;
x0 = zeros(n,1);

[_,it_J] = jacobi(A,b,x0,10000,tol);
[_,it_GS] = gaussseidel(A,b,x0,10000,tol);
[_,it_SOR] = sor(A,b,x0,10000,tol,w);

disp("\nIteraciones por metodo")
it_J
it_GS
it_SOR
disp("")

z = ones(n,1);
definida_positiva = z'*A*z>0

D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);
Tj = -inv(D) * (L + U);
radioJ = max(abs(eig(Tj)));

disp("El w optimo para la matriz A (tridiagonal y definida positiva) es")
wOPT = 2/(1+sqrt(1-radioJ^2))

[_,it_SOR_OPT] = sor(A,b,x0,10000,tol,wOPT);
it_SOR_OPT

disp("\nComparacion radio espectral de w y wOPT")
format short
Tw = inv(D + w*L) *  ((1 - w)*D - w*U);
radio_w = max(abs(eig(Tw)))
TwOPT = inv(D + wOPT*L) *  ((1 - wOPT)*D - wOPT*U);
radio_wOPT = max(abs(eig(TwOPT)))
