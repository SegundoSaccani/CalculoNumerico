clear all;clc
format long

t1 = [0,1,2];
t2 = [2,3,4];

xx1 = [0,2,6];
xx2 = [6,3,0];

yy1 = [0,4,6];
yy2 = [6,2,0];

[x1,vx1]= funcion_spline(t1,xx1);
[x2,vx2]= funcion_spline(t2,xx2);

[y1,vy1]= funcion_spline(t1,yy1);
[y2,vy2] = funcion_spline(t2,yy2);

tt = linspace(0,4,201);
x = @(t) x1(t).*(t<2) + x2(t) .*(t>=2);
y = @(t) y1(t).*(t<2) + y2(t) .*(t>=2);

vx = @(t) vx1(t).*(t<2) + vx2(t) .*(t>=2);
vy = @(t) vy1(t).*(t<2) + vy2(t) .*(t>=2);

figure(1)
plot(x(tt),y(tt),[0,2,6,3,0],[0,4,6,2,0],'ok')
figure(2)
plot(tt,vx(tt),5.5-4,vx(5.5-4),'ok')
figure(3)
plot(tt,vy(tt),5.5-4,vy(5.5-4),'ok')

V_x = vx(5.5-4)
V_y = vy(5.5-4)

#No me da igual que lo q dice la supuesta resolucion
#pero como el procedimiento para vx y vy fue igual y vy si dio, entiendo q lo q hice esta bien
