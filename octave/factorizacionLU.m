function [x] = factorizacionLU(A,b)
  A = doolittle(A);
  n = length(b);
  L = tril(A,-1)+diag(ones(n,1),n,n);
  U = triu(A);
  y =sust_adelante([L b]);
  x =sust_atras([U y]);
  endfunction
