function [p,h] = puntofijo(g,p0,kmax,tol)
  h=[];
  i=1;
  while(i<kmax)
  p = g(p0);

  criterio = abs(p-p0);
  if(criterio<tol)
    break
  endif
  h = [h;criterio];

  p0=p;
  i=i+1;
endwhile

if(i == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
