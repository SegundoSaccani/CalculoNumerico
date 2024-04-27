function [x,h] = biseccion(f,a,b,kmax,tol)

if(f(a)*f(b)>0)
  disp("f(a) y f(b) no tienen signos opuestos")
endif

h=[]; ###################

i = 1;
while(i<kmax)
  x = a +((b-a)/2);

  criterio=(b-a)/2;
  if(criterio<tol)
    break
  endif
  i=i+1;
  if(f(a)*f(x)>0)
    a = x;
  else
    b = x;
  endif

  h = [h;criterio]; #me pide esto cuando me dice q calcule la convergencia?

endwhile

if(i == kmax)
  disp("Se llego al maximo numero de iteraciones")
endif
