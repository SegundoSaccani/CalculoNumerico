clear all;clc
format long

#{
-K*u''(x) = f(x)

-u'' + [-f(x)/k ]= 0
          r(x)
#}

L=3;
k=1;
f = @(x) 20*sin(5.*(x-1));

F = @(x) [0*x 0*x (-1*f(x))/k];
inter = [0 3];
ya = 21;
yb = [-k 0 0]; # -k u' = 0 -> A=-k;B=C=0
l=200;
[xx,y] = dif_fin_rob(F,inter,ya,yb,l); #habria que hacer un loop para ver los 2 decimales exactos

disp("a)")
disp("Temperatura en el extremo derecho")
y(end)

plot(xx,y)

disp("b)")

[temp_max,i_max_temp] = max(y);

temp_max = (temp_max)

h = 3/l;
pos_max_temp = (i_max_temp-1)*h
hold on
plot(pos_max_temp,temp_max,'ok')
