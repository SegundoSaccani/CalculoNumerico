function [p,h,it,t] = secante(f,p0,p1,kmax,tol)
 tic();
 it=2;
 h=[];
 q0 = f(p0);
 q1 = f(p1);

 while(it<kmax)
  p = p1 - (q1*(p1-p0))/(q1-q0);

  criterio = abs(p-p1);
  h=[h;criterio];
  if(criterio<tol)
    break
  endif

  p0=p1;
  q0=q1;
  p1=p;
  q1=f(p);
  it=it+1;
 endwhile

 if(it == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
t=toc();
