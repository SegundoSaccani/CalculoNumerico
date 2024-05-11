clear all;clc

A = [1 -2 3 0; 3 -6 9 3; 2 1 4 1; 1 -2 2 -2];
n = rows(A);
[Ad,r] = doolittle_p(A);

r
Ad = Ad(r,:)
U = triu(Ad,0)
L = tril(Ad,-1) + diag((ones(n,1)))
P = eye(n,n)(r,:)

disp("\nP*A")
P*A
disp("\nL*U")
L*U
disp("\nIguales?")
sum(sum(P*A==L*U))==n*n
