function [x] = factorizacionLU_p(A,b)

    n = length(b);
    [A,r] = doolittle_p(A);

    L = diag(ones(n,1),n,n) + tril(A(r,:),-1);
    U = triu(A(r,:),0);

    y = sust_adelante([L b(r,:)]);
    x = sust_atras([U y]);



  endfunction
