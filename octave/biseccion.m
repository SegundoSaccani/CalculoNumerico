function [x,h,it,t] = biseccion(f,a,b,kmax,tol)
tic();
if(f(a)*f(b)>0)
  error("f(a) y f(b) no tienen signos opuestos")
endif

h=[];

it = 1;
while(it<kmax)

  x = a +((b-a)/2);

  criterio= abs(x-a);
  #(b-a)/2
  h = [h;criterio];
  if(criterio<tol)
    break
  endif

  if(f(a)*f(x)>0)
    a = x;
  else
    b = x;
  endif
  it=it+1;

endwhile

if(it == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
t=toc();
