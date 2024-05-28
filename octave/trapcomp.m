function [I] = trapcomp(x,y)
#ESTA FUNCION SUPONE QUE LOS X ESTAN IGUALMENTE ESPACIADOS (si no lo estuvieran toma puntos del polinomio interpolante)
f = @(t) polyval(polyfit(x,y,length(x)-1),t);

L=length(x)-1;

I = intNCcompuesta(f,x(1),x(end),L,2);
endfunction
