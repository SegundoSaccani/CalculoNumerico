clear all;clc

f1 = @(x) sin(pi*x);
f2 = @(x) 1./(1+x.^2);

int_f1 = 2/pi;
int_f2 = 2*atan(5);

xx1 = linspace(0,5,201);
xx2 = linspace(-5,5,201);

err1 = [inf];
err2 = [inf];

for n=2:13
  Q1 = intNCcompuesta(f1,0,5,1,n);
  Q2 = intNCcompuesta(f2,-5,5,1,n);

  err1 = [err1;abs(int_f1-Q1)];
  err2 = [err2;abs(int_f2-Q2)];


  x1=linspace(0,5,n);
  x2=linspace(-5,5,n);

  c1 = polyfit(x1,f1(x1),n-1);
  c2 = polyfit(x2,f2(x2),n-1);

  figure(1)
  plot(xx1,polyval(c1,xx1),xx1,f1(xx1));
  legend("Pol.Interp.","F1")
  figure(2)
  plot(xx2,polyval(c2,xx2),xx2,f2(xx2))
  legend("Pol.Interp.","F2")
  pause(4);
  endfor

figure(1)
plot(err1)
title("Evolucion error absoluto")
figure(2)
plot(err2)
title("Evolucion error absoluto")
