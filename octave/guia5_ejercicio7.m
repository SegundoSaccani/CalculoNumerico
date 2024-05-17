clear all;clc

t = [0:4]
x = [0 2 6 3 0]
y = [0 4 6 2 0]

x1 = funcion_spline(t(1:3)',x(1:3)');
x2 = funcion_spline(t(3:5)',x(3:5)');

y1 = funcion_spline(t(1:3)',y(1:3)');
y2 = funcion_spline(t(3:5)',y(3:5)');

xx =  @(t) x1(t).*(t<2) + x2(t).*(t>=2)
yy =  @(t) y1(t).*(t<2) + y2(t).*(t>=2)
tt = linspace(0,4,201);

figure(1)
plot(tt,xx(tt),'b',tt,yy(tt),'r')
legend("x(t)","y(t)")

figure(2)
plot(xx(tt),yy(tt),x,y,'*k')
