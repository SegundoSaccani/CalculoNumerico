clear all;clc
format long;
#{
y'' = 20 * (cos(y))^2 - sin(y) - y'

y = u(1)

{y' = u(1)' = u(2)
{y'' = u(2)' = 20*(cos(u(1))).^2 - sin(u(1)) - u(2)
#}

F = @(t,u) [u(2);20*cos(u(1)).^2-sin(u(1))-u(2)];
#a)
y0 = [pi/2;0]; #se suelta desde el reposo
inter= [0 4];

#Hallar el L para un error menor a 1e-4
L=10
[t,Y] = rk4(F,inter,y0,L);
y_ant = Y(end,1)
while(1) #se parte de la suposicion de que rk4 convergerá
L = L*2
[t,Y] = rk4(F,inter,y0,L);
y_act = Y(end,1)

if(abs(y_ant-y_act)<1e-4)
  break
endif

y_ant = y_act;
endwhile
####

#Comprobar de q efectivamente las 4 primeras cifras son verdaderas
#duplicando de nuevo el L
L2 = L*2
[t,Y] = rk4(F,inter,y0,L2);
y_act = Y(end,1)
####

figure(1)
plot(t,Y(:,1),4,Y(end,1),'ko')

####################
#b)
#Se aprecia que la derivada de Y es nula en 5 ocaciones
#por lo que podemos concluir que el pendulo cambia 5 veces de direccion
[tb,Yb] = rk4(F,[0 6],y0,L2);
figure(2)
plot(tb,Yb(:,1),tb,Yb(:,2))
legend("Y","Y'")
grid on

####################
#c)
#Se observa que la Y tiende (aproximadamente) a 1.348 radianes = 77.2° > 45°
[tc,Yc] = rk4(F,[0 20],y0,L2);
figure(3)
plot(tc,Yc(:,1),tc,1.348,'k_')
