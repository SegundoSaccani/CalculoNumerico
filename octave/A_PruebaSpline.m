clear all;clc
format short

#Prueba segun ejemplo 4 y 2 del capitulo 3.5 del Burden ed.10

x = [0;1;2;3];
y = [1;e^1;e^2;e^3];

disp("Spline libre")
[an,bn,cn,dn] = cubic_spline_natural(x,y)

disp("Spline sujeto")
[ac,bc,cc,dc] = cubic_spline_clamped(x,y,[1;e^3])


