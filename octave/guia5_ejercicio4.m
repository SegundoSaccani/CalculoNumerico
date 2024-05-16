clear all;clc

x = [1 2 3];
y = [0 4 22/3];

x =x';
y = y';

s = funcion_spline(x,y,3,3);

xx=linspace(-1,4,201);
plot(x,y,'*',xx,s(xx),'r')

