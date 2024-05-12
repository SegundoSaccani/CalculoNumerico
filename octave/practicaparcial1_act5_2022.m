clear all;clc

A = [1 2 -2; 1 1 1; 2 2 1]
b = [7;2;5]

D = diag(diag(A))
U = triu(A,1)
L = tril(A,-1)

Tj = -inv(D) * (L + U)

Tgs = -inv(D + L) * U

radioJ = max(abs(eig(Tj)))

radioGS = max(abs(eig(Tgs)))

disp("")
vect = [];

for w= 0.05:0.05:1.95
  w
  Tw = inv(D + w*L) *  ((1 - w)* D - w*U);
  radioW = max(abs(eig(Tw)))
  vect = [vect,radioW];
  endfor

w= [0.05:0.05:1];
plot(w,vect(1:size(w)(2)),w,1,'.r')
grid minor

[x,itj] = jacobi(A,b,zeros(3,1),100,1e-12);
[x,itw] = sor(A,b,zeros(3,1),1000,1e-12,0.25);

itj
itw
