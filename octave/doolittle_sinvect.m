function [A] = doolittle_sinvect(A)
    n = rows(A);
    for k = 1:n-1
      for i = k+1 : n
        m = A(i,k)/A(k,k);
        A(i,k) = m;
        for j = k+1 : n
          A(i,j) = A(i,j) - m * A(k,j);
        endfor
      endfor
    endfor

endfunction
