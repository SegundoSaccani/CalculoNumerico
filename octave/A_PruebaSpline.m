clear all;clc
format short

#Prueba segun ejemplo 4 y 2 del capitulo 3.5 del Burden ed.10

x = [0;1;2;3];
y = [1;e^1;e^2;e^3];

#disp("Spline libre")
[an,bn,cn,dn] = cubic_spline_natural(x,y);

#disp("Spline sujeto")
[ac,bc,cc,dc] = cubic_spline_clamped(x,y,1,e^3);

[Sn] = funcion_spline(x,y);
[Sc] = funcion_spline(x,y,1,e^3);
xx=linspace(-1,4,201);
plot(x,y,'*',xx,Sc(xx),'r',xx,e.^xx,'b')


#{
#Lagrange: ejemplo 2  capitulo 3.1
xL = [2 2.75 4];
fL = @(x) 1./x;
yL = fL(xL);

cL = polyfit(xL,yL,2)

pL = @(x) polyval(cL,x)

xx = linspace(0,5,201);

plot(xL,yL,'*',xx,pL(xx),'r')

c = dif_div(xL',yL')

#}
