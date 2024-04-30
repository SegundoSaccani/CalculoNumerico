 function [x,h,it,t] = newton(f,df,x0,kmax,tol)
 tic();
 it=1;
 h=[];

 while(it<kmax)
  x = x0 - f(x0)/df(x0);

  criterio = abs(x-x0)/abs(x);
  #abs(x-x0)/abs(x)
  #abs(x-x0)
  h=[h;criterio];
  if(criterio<tol)
    break
  endif

  x0=x;
  it=it+1;
endwhile

if(it == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
t=toc();
