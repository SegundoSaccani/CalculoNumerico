function [p,h] = secante(f,p0,p1,kmax,tol)
 i=2;
 h=[];
 q0 = f(p0);
 q1 = f(p1);

 while(i<kmax)
  p = p1 - (q1*(p1-p0))/(q1-q0);

  criterio = abs(p-p1);
  if(criterio<tol)
    break
  endif
  h=[h;criterio];

  p0=p1;
  q0=q1;
  p1=p;
  q1=f(p);

  i=i+1;
 endwhile

 if(i == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
