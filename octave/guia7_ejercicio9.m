clear all;clc

#{
a)
y(3) + 4y'' + 5y' + 2y = −4 sen t − 2 cos t

y1 = y
y2 = y1' =y'
y3 = y2' = y''
    y3' = y(3) = −4*sen(t) − 2*cos(t) - 4*y3 -5*y2 -2*y1
#}

y0 = [1;0;-1];

F = @(t,u) [u(2);u(3); -4*sin(t)-2*cos(t)-4*u(3)-5*u(2)-2*u(1)];

#b)
#Busqueda del numero con 6 decimales exactos
L=1
[t,Y] = rk4(F,[0 2.5],y0,L);
y_ant = Y(end,1)
while(1) #si rk4 no converge entonces es un loop infinito
L = L*2
[t,Y] = rk4(F,[0 2.5],y0,L);
y_act = Y(end,1)

if(abs(y_ant-y_act)<1e-6)
  break
endif

y_ant = y_act;
endwhile

disp("\nEl valor de y en t=2.5 con 6 decimales exactos es")
disp(y_act)
#####################

#c)
[t,Y] = rk4(F,[0 15],y0,600);
plot(t,Y(:,1),t,Y(:,2))
legend("y","y'")
grid on
