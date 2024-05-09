clear all;clc
format long
#A)
t1 = 0.02;
z_a = @(a) (0.04* sqrt(a + t1) *(1-t1))- t1 * sqrt(3*a) - t1; %= 0 (punto fijo en t= 0.02 ??)


#########################################
w = @(t) (0.04* sqrt(19 + t) .*(1-t))- t .* sqrt(57);

t = linspace(-0.4,0.2,100);

figure(1)
plot(t,w(t))
title("PUNTO FIJO EN W");
y = @(x) x;
hold on;
grid on;
plot (t,y(t))

[pw] = puntofijo(w,0.02,100,1e-2); #para a = 19 existe un punto fijo en t = 0,019
#######################################

figure(2)
at = linspace(18,22,100);
plot(at,z_a(at))
grid on;
title("RAIZ DE Z(A,T=0,02)=0")

[a,ha,ita] = biseccion(z_a,19,20,100,1e-6)

disp("\nPara el siguiente a existe un punto fijo en t = 0.02:")
a
disp(" ")

#B)
z = @(t) (0.04* sqrt(a + t) .*(1-t))- t .* sqrt(3*a);

figure(3)
bt = linspace(-0.2,0.3,100);
plot(bt,z(bt))
grid on;
title("(RAIZ DE Z(T,A=19.073)=0)")

[b,hb,itb] = biseccion(z,0,0.3,100,1e-6)
disp("La raiz de z(t) se encuentra en")
b
