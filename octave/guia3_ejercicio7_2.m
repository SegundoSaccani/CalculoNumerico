clear all;clc

n=1000;

A= diag([1:n]*2) + diag([3:n]*0.5,-2) + diag([1:n-2]*0.5,2) + diag([5:n]*0.25,-4)+diag([1:n-4]*0.25,4);
b = ones(n,1)*pi;

estrictamente_diagonal_dominante = sum(diag(A)>sum(A(1:n,:),2)-diag(A))==n
#A es estrictamente diagonal dominante -> converge para gaussseidel y jacobi

z = ones(n,1);
definida_positva = z'*A*z>0
#A definida positiva -> converge para SOR

###############################################################################
#Metodos
disp("\nJacobi")
tic
[x_j,it_j,rh_j] = jacobi(A,b,ones(n,1),200,1e-5);
it_j
tJ=toc()


disp("\nGaussSeidel")
tic
[x_gs,it_gs,rh_gs] = gaussseidel(A,b,ones(n,1),2000,1e-5);
it_gs
tGS=toc()

#SOR encontrar w
wOPT = 0.05;
[x_sor,itMIN] = sor(A,b,ones(n,1),2000,1e-5,wOPT);

for w = 0.1:0.05:1.9
  [x_sor,it_for] = sor(A,b,ones(n,1),2000,1e-5,w);
  if(it_for<itMIN)
    itMIN = it_for;
    wOPT = w;
  endif
endfor

disp("\nSOR")
tic
[x_sor,it_sor,rh_sor] = sor(A,b,ones(n,1),2000,1e-5,wOPT);
it_sor
tSOR=toc()

disp("\nEl w optimo es")
wOPT

###############################################################################
#Analisis matriz de iteracion Jacobi, GS, SOR
D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);

Tj =  -inv(D) * (L + U);
Tgs = -inv(D + L) * U;
Tsor =  inv(D + wOPT*L) *  ((1 - wOPT)*D - wOPT*U);

disp("\nRadio espectral:\n Jacobi - Gauss Seidel - SOR (mejor w encontrado)")
rJ = max(abs(eig(Tj)));
rGS = max(abs(eig(Tgs)));
rSOR = max(abs(eig(Tsor)));
disp([rJ, rGS, rSOR])

figure(1)
semilogy(rh_j,'r')
hold on;
semilogy(rh_gs,'g')
semilogy(rh_sor,'b')
title("Comparativa de convergencia entre los tres metodos")
legend("Jacobi","GaussSeidel","SOR")
