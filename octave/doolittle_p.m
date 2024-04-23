function [A,r] = doolittle_p(A)
    n = rows(A);
    r=[1:n]';
    epsilon = 1e-9;


    for k = 1:n
      [pmax,p] = max(abs(A(r(k:n),k)));
      if(pmax < epsilon)
        disp("Los posibles pivots son CERO")
        break
      endif
      p=p(1)+k-1;
      if(p~=k)
        r([p k]) = r([k p]);
      endif

        m= A(r(k+1:n),k)/A(r(k),k);
        A(r(k+1:n),k) = m;
        A(r(k+1:n),k+1:n) = A(r(k+1:n),k+1:n) - m * A(r(k),k+1:n);
    endfor

endfunction
#para utilizar A en la factorizacionLU_p antes tengo que reordenarla segun el vector r
