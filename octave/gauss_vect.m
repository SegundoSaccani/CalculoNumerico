function [x] = gauss_vect(A,b)

  n = length(b);
  A = [A b];

  for k = 1 : n-1
      m = A(k+1:n,k)/A(k,k);
      A(k+1:n,k) = 0;
      A(k+1:n,k+1:n+1) = A(k+1:n,k+1:n+1) - m .* A(k,k+1:n+1);
  endfor

  if (A(n,n) == 0)
    display("No tiene solucion unica")
  endif

  x = sust_atras_vect(A);

endfunction
