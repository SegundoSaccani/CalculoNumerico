 function [x,h] = newton(f,df,x0,kmax,tol)
 i=1;
 h=[];

 while(i<kmax)
  x = x0 - f(x0)/df(x0);

  criterio = abs(x-x0);
  if(criterio<tol)
    break
  endif
  h=[h;criterio];

  x0=x;
  i=i+1;
endwhile

if(i == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
