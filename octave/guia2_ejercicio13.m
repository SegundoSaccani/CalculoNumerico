clear all;clc
disp("Ejercicio 7 - Guia 2")
n=10;
disp("n =")
disp(n)
disp("------------------------------------")

A = zeros(n);
A(1,1) = 1;
A(n,n) = 1;

  for i=2:n-1
    A(i,i)=2;
    A(i,i-1)=-1;
    A(i,i+1)=-1;
  endfor

  disp("A=")
  disp(A)
disp("------------------------------------")
disp("Cada columna es un vector correspondiente a un k = al nro de columna")
  kmax=10;
  b = ones(n,kmax);
  for k=1:kmax
    b(1:n,k) =(1/n^k);
    b(1,k)=0;
    b(n,k)=0;
  endfor

  disp("b=")
  disp(b)
disp("------------------------------------")
disp("Cada columna es un vector correspondiente a un k = al nro de columna")
  X_k=ones(n,kmax);
  for(i=1:kmax)
    X_k(1:n,i) = factorizacionLU(A,b(1:n,i));
  endfor

  disp("x=")
  disp(X_k)
disp("------------------------------------")

  maximos=ones(1,kmax);
  for(i=1:kmax)
    maximos(i) = max(abs(X_k(1:n,i)));
  endfor

  disp("maximos=")
  disp(maximos)

semilogy(maximos)
