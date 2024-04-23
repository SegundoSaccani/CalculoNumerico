function [x] = sust_adelante_vect(A)
  n = rows(A);
  x = zeros(n,1);

  x(1) = A(1,n+1)/A(1,1);

  for i = 2:n
    x(i) = ( A(i,n+1) - (  A(i,1 : i-1) * x(1 : i-1)) )/A(i,i);
  endfor
  endfunction
