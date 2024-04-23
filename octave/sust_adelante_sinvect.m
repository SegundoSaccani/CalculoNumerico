function [x] = sust_adelante_sinvect(A)

  n = rows(A);
  x = zeros(n,1);

  x(1) = A(1,n+1)/A(1,1);

  for i = 2 : n
    s = A(i,n+1);
    for j = 1 : i-1
      s = s - A(i,j) * x(j);
    endfor
    x(i) = s/A(i,i);
  endfor

  endfunction
