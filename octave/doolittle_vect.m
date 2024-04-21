function [A] = doolittle_vect(A)
    n = rows(A);
    for k = 1:n-1
        m = A(k+1:n,k)/A(k,k);
        A(k+1:n,k) = m;
        A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - m * A(k,k+1:n);
    endfor

endfunction
