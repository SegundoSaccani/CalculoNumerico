clear all;clc
format long

#CONSTANTES DEL PROBLEMA
g = 9.81;
l = 12;
m1 = 3;
m2 = 1;
k = 5;

#{
const(i) = (m(i)*g)/l

m1 x1'' = - const1*x1 - k x1 +k x2 = -(const + k) * x1 + k * x2
x1'' = [-(const1+k)/m1]* x1 + (k/m1) * x2

m2 x2'' = - const2*x2 + k x1 -k x2 = -(const + k) * x2 + k * x1
x2'' = [-(const2+k)/m2]* x2 + (k/m2) * x1

x1 = u1
x2 = u2

{x1' = u1' = u3
{x2' = u2' = u4
{x1''= u3' = [-(const1+k)/m1]* u1 + (k/m1) * u2
{x2''= u4' = [-(const2+k)/m2]* u2 + (k/m2) * u1
#}

F = @(t,u) [u(3);u(4);(-(((m1*g)/l)+k)/m1)*u(1)+(k/m1)*u(2);(-(((m2*g)/l)+k)/m2)*u(2)+(k/m2)*u(1)];

#{
Sabiendo que el primer objeto parte de la posición de 0.75m
a la derecha de su posición de equilibrio,
mientras que el segundo objeto lo hace a una distancia de 0.25m
también a la derecha, y que ambos objetos parten desde el reposo
#}
y0 = [0.75;0.25;0;0];
inter = [0 10];

#Hallar valor con 6 cifras decimales exactas
L = 40;
[tt,X_ini] = rk4(F,inter,y0,L);

tol = 1e-6;
while(1)
L=L*2
[tt,X] = rk4(F,inter,y0,L);
err = abs(X_ini(end,1)-X(end,1))
if(err<tol)
  break
endif
X_ini = X;
endwhile

figure(1)
plot(tt,X(:,1),tt,X(:,2))
legend("x1","x2")

disp("\nLa posicion de la masa 1 en t=10 es")
disp(X(end,1))
disp("\nLa posicion de la masa 2 en t=10 es")
disp(X(end,2))

#Analisis de la direccion del movimiento
[tt,X] = rk4(F,[0 15],y0,L);
figure(2)
plot(tt,X(:,1),tt,X(:,3))
title("Masa 1")
legend("x1","x1'")
grid on;

figure(3)
plot(tt,X(:,2),tt,X(:,4))
title("Masa 2")
legend("x2","x2'")
grid on;

#x1' es negativa en t=10 -> el mov va en la direccion de derecha a izquierda
#x2' es positiva en t=10 -> el mov va en la direccion de izquierda a derecha
