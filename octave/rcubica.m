function [x] =rcubica(a)
f = @(x) x^3 - a;
limite = 1+ abs(a);
x = biseccion(f,-limite,limite,100,1e-12);
endfunction
