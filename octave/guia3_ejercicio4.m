%a) ¿SOR converge para la siguiente matriz?
%b) ¿Cual es el valor optimo de w?
%c) Comparar SOR con G-S
clear all;clc
A = [10 5 0 0; 5 10 -4 0; 0 -4 8 -1; 0 0 -1 5]
b= [ 6;25;-11;-11]

z = ones(4,1);
if(z'*A*z > 0)
  disp("Sor converge para A con 0<w<2 porque A es definida positiva")
else
  disp("Habria q analizar el radioE de la matriz de iteracion con sor porque el teorema anterior no concluye");
endif

#Como A es definida positiva y tridiagonal entonces se puede aplicar el teorema para hallar el W optimo
D = diag(diag(A));
L = tril(A,-1);
U = triu(A,1);

TJ = -inv(D)*(L+U);
radioE_J = max(abs(eig(TJ)))

wOPT= 2/(1+sqrt(1-(radioE_J)^2))

radioE_SOR = wOPT -1

TGS = -inv(D+L)*U;
radioE_GS = max(abs(eig(TGS)))

#comparacion SOR Y GS
tic
[xSor,itSor,r_hsor] = sor(A,b,[1;1;1;1],100,10e-5,wOPT)
tSor = toc()

tic
[xGS,itGS,r_hGS] = gaussseidel(A,b,[1;1;1;1],100,10e-5)
tGS = toc()

disp("SOR con w optimizado es")
t = (tGS-tSor)*100/tGS
disp("porciento mas rapido que GS")

semilogy(r_hsor)
hold on;
semilogy(r_hGS)

