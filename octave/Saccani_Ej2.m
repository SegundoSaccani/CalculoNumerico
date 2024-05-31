clear all;clc
format long

A = [2 2 -1 0 2;-2 2 -1 0 2;1 -2 3 -1 1;0 1 -2 3 -2;0 -1 -1 -1 3]
b = [-2;0;-1;4;-1]

#Resolucion con gauss
[x] = gauss(A,b)

#Analisis del radio espectral de A con jacobi y gs
D = diag(diag(A));
U = triu(A,1);
L = tril(A,-1);

Tj = -inv(D) * (L + U);

Tgs = -inv(D + L) * U;

radioJ = max(abs(eig(Tj))) #< 1 -> J converge

radioGS = max(abs(eig(Tgs))) #> 1 -> GS no converge
############################################
#Resolucion con metodos iterativos
[x_j,it_j] = jacobi(A,b,zeros(5,1),10000,1e-4);

#[x_gs,it_gs] = gaussseidel(A,b,zeros(5,1),10000,1e-4); no converge gs

disp("\nSolucion e iteraciones de jacobi:")
x_j
it_j

disp("\n Error de jacobi respecto de la de gauss")
err = norm(x-x_j,inf)/norm(x,inf)
