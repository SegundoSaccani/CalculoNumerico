function [x] = factorizacionLU(A,b)
  A = doolittle_vect(A);
  n = length(b);
  L = tril(A,-1)+diag(ones(n,1),n,n);
  U = triu(A);
  y =sust_adelante_vect([L b]);
  x =sust_atras_vect([U y]);
  endfunction
