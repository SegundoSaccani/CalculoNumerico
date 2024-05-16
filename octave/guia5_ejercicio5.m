clear all;clc

#Funcion normal
f= @(x) sin(2*pi*x);

x = linspace(-1,1,21);

cL = polyfit(x,f(x),20);

pL = @(x) polyval(cL,x)

s = funcion_spline(x',f(x'))

xx = linspace(-1,1,201);

plot(xx,f(xx),'k',xx,pL(xx),'r',xx,s(xx),'b')


#Funcion perturbada
f1 = ones(1,21);
for i = 1 : 21
  f1(i) = f(x(i))+ ((-1)^(i+1))*e-4;
endfor


cL1 = polyfit(x,f1,20)

pL1 = @(x) polyval(cL1,x)


s1 = funcion_spline(x',f1')

xx = linspace(-1,1,201);

figure(2)
plot(x,f1,'*k',xx,pL1(xx),'r',xx,s1(xx),'b')


