clear all;clc
n=100;
A = zeros(n);
A(1,1) = 1;
A(n,n) = 1;
  for i=2:n-1
    A(i,i)=2;
    A(i,i-1)=-1;
    A(i,i+1)=-1;
  endfor

b=ones(n,1)*(1/n*n);
b(1)=0;
b(n)=0;

