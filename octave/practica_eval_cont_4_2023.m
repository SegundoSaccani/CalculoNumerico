clear all;clc
format long

#{
y'' = 20 * (cos(y))^2 - y' - sin(y)

u(1) = y
u(1)' = u(2) = y'
u(2)' = y'' = 20 * (cos( u(1) ))^2 - u(2) - sin( u(1) )

#}
F = @(t,u) [u(2);20*cos(u(1)).^2-u(2)-sin(u(1))];

#a
inter = [0 3];
y0 = [pi/2; 0];
L=1

[t,Y] = rk4(F,inter,y0,L);
y_ant = Y(end,1)
while(1) #si rk4 no converge entonces es un loop infinito
L = L*2
[t,Y] = rk4(F,inter,y0,L);
y_act = Y(end,1)

if(abs(y_ant-y_act)<1e-4)
  break
endif

y_ant = y_act;
endwhile

disp("\nValor del angulo en t=3")
disp(y_act(end))

figure(1)
plot(t,Y(:,1),3,Y(end,1),'ok')

#b
[tb,Yb] = rk4(F,[0 5],y0,L);
figure(2)
plot(tb,Yb(:,1),5,Yb(end,1),'ok')

#c
[tc,Yc] = rk4(F,[0 20],y0,L*4);
figure(3)
plot(tc,Yc(:,1),tc,1.348,'r') #el angulo al que tiende el pendulo esta entre (1.34,1.36) radianes, aprox (76.77°,77.92°)
grid on;
