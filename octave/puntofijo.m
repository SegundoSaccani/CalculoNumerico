function [p,h,it,t] = puntofijo(g,p0,kmax,tol)
  tic();
  h=[];
  it=1;
  while(it<kmax)
  p = g(p0);

  criterio = abs(p-p0);
  h = [h;criterio];
  if(criterio<tol)
    break
  endif

  p0=p;
  it=it+1;
endwhile

if(it == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
t = toc();
