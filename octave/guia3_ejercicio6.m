clear all;clc
A1 = [3 1 1; 1 3 -1; 3 1 -5]
b1 = [5;3;-1]

A2 = A1([1;3;2],:)
b2 = b1([1;3;2])

x0 = zeros(3,1);

[xgs1,itgs1,r_hgs1] = gaussseidel(A1,b1,x0,10000,1e-6);
xgs1
itgs1

[xg1] = gauss(A1,b1)

[xgs2,itgs2,r_hgs2] = gaussseidel(A2,b2,x0,10000,1e-6);
xgs2
itgs2

[xg2] = gauss_p(A2,b2)

D1 = diag(diag(A1));
L1 = tril(A1,-1);
U1 = triu(A1,1);

Tgs1 = -inv(D1 + L1) * U1

radio1 = max(abs(eig(Tgs1)))

D2 = diag(A2);
L2 = tril(A2,-1);
U2 = triu(A2,1);

Tgs2 = -inv(D2 + L2) * U2

radio2 = max(abs(eig(Tgs2)))
