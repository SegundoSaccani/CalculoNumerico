clear all;clc
%La matriz converge para G-S?

A = [3/4 1/6;1/4 1/4];

D = diag(diag(A))
L = tril(A,-1)
U = triu(A,1)

T= -inv(D+L)*(U)
radioE = max(abs(eig(T)))

if(radioE <1)
  disp("La matriz SI converge con G-S")
else
  disp("La matriz NO converge con G-S")
endif

