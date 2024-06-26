clear all;clc
format long

#-u'' +5*u + (-1)*100*x*(1-x) = 0

F = @(x) [0*x 5+0*x -100*x.*(1-x)];
inter = [0 1];
yc = [0 0];

N = 41; #Cantidad de puntos del intervalo (incluyendo extremos)
L = (N-1);

[xx,yy] = dif_fin_dir(F,inter,yc,L)
cant_ptos = rows(xx)

plot(xx,yy,xx(((end-1)/2)+1),yy(((end-1)/2)+1),'ok')
disp("\nTemp en pto medio")
disp(yy(((end-1)/2)+1))
