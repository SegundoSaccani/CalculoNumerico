function [x] = sust_atras_sinvect(A)
  n = rows(A);
  x = zeros(n,1);

  x(n) = A(n,n+1)/A(n,n);

  for i = n-1 : -1: 1
    s = A(i,n+1);
    for j = i+1 : n
      s = s - A(i,j) * x(j);
    endfor
    x(i) = s/A(i,i);
  endfor
  endfunction
