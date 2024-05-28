function [I] = simpsoncomp(x,y)
#ESTA FUNCION SUPONE QUE LOS X ESTAN IGUALMENTE ESPACIADOS (si no lo estuvieran toma puntos del polinomio interpolante)
#Y QUE HAY NRO IMPAR DE PTOS Y PAR DE INTERVALOS
if mod(length(x),2) == 0
  error("Cantidad par de puntos")
endif

f = @(t) polyval(polyfit(x,y,length(x)-1),t);

L=length(x)-1;

I = intNCcompuesta(f,x(1),x(end),L,3);
endfunction
