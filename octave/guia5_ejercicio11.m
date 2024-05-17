clear all;clc

#n puntos; t en horas;
#crear sistema de ecuaciones lineales a partir de  M(n*4)   *   c(4*1) = v(n*1)
#                                               (Mt(4*n)*M(n*4)) * c(4*1) = (Mt(4*n)*v(n*1))
#                                                     A(4*4) * c(4*1)     = b(4*1)

v =    [ 0.61255;    1.40101;    2.69013;    3.40985;    3.95361;    3.59041; 3.09119;    2.71147;
  2.01397;    1.35229;    1.09930;    1.30715; 1.99290;    3.46081;    5.34487;    7.50176;    9.35324;
  11.22945;   12.76212; 13.99448;   14.41532;   14.47064;   13.91045;   13.01681;   12.18537;   11.26826]

  n = length(v)

  M=zeros(n,4);
  i=1;
  for t=0:(1/5):5

    M(i,1)= sin(2*t);
    M(i,2)= t^2;
    M(i,3)= 2^t;
    M(i,4)= 1;

    i=i+1;
  endfor
M

A = M'*M
b = M'*v
c = gauss(A,b)

vel = @(t) c(1).*sin(2*t) + c(2)*t.^2 + c(3)*2.^t + c(4)

disp("La velocidad segun el modelo en 6 horas es")
disp(vel(6))
#########################################
#Graficacion y comparacion: modelo propuesto vs pol de grad 6
c6 = polyfit([0:(1/5):5],v',6);
p6 = @(x) polyval(c6,x);

hold on;
figure(1)
tt = linspace(0,6.1,201);

plot(tt,vel(tt),'r',tt,p6(tt),'b',0:(1/5):5,v,'*k',6,vel(6),'*b',6,p6(6),'*r')
legend("vel","p6")

err_vel = norm(v-vel(0:(1/5):5)')

err6 = norm(v-p6(0:(1/5):5)')

#Polinimio aprox de gr 24: no es util para predecir las 6 horas
c24 = polyfit([0:(1/5):5],v',24);
p24 = @(x) polyval(c24,x);
figure(2)
plot(tt,p24(tt),'g',6,p24(6),'*')
