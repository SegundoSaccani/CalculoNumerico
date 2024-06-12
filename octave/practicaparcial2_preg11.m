clear all;clc
format long

#{
y''' = -4*sin(t)-2*cos(t)-4*y''-5*y'-2*y

u(1) = y
u(2) = u(1)' = y'
u(3) = u(2)' = y''
       u(3)' = -4*sin(t)-2*cos(t)-4*u(3)-5*u(2)-2*u(1)
#}

F = @(t,u) [u(2);u(3);-4*sin(t)-2*cos(t)-4*u(3)-5*u(2)-2*u(1)];

y0 = [1;0;-1];
inter = [0 5];
L = 200;

[tt,y] = rk4(F,inter,y0,L);

plot(tt,y(:,1),'b',tt,y(:,3),'r')
grid on

y2 = funcion_spline(tt',y(:,3)');

hold on;
plot(tt,y2(tt))

punto_inflexion_1 = biseccion(y2,1,2,1000,1e-3)
punto_inflexion_2 = biseccion(y2,4,5,1000,1e-3)
