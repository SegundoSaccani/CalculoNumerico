clear all;clc
format long

f = @(x) log((x.^2)+1)-exp(x/2).*cos(pi*x);

xx = linspace(-5,6,9);

punto = 4.2;

#Aproximacion de derivada porq no tengo ganas de escribir la derivada de f completa
h = 0.00001
d1 = (f(-5+h)-f(-5))/h
d2 = (f(6+h)-f(6))/h
####################################

[s,ds] = funcion_spline(xx',f(xx)',d1,d2);

spline = s(punto)
funcion = f(punto)
disp("\nEl error entre spline y funcion en x=4.2 es")
err = abs(spline-funcion)

x= linspace(-5,6,201);
plot(x,f(x),'b',x,s(x),'r',xx,f(xx),'ok')

figure(2)
plot(x,ds(x))
max = biseccion(ds,4,5,1000,1e-5);

disp("\nEl maximo se encuentra en x=")
disp(max)
disp("cuyo valor es")
disp(s(max))
