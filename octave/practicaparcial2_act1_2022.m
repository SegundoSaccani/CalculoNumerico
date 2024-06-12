clear all;clc
format long

x = [0 1 2 3 4 5 6];
y = [432 599 1012 1909 2977 4190 5961];

grado = 4;

cL = polyfit(x,y,grado);
pL = @(x) polyval(cL,x);

xx = linspace(0,10,201);

plot(x,y,'k*',xx,pL(xx),10,pL(10),'r*',10,14900,'b*')

disp("Valor en las 10ma semana")
disp(pL(10))

sem_10 = 14900;
x10 = [x 10];
y10 = [y sem_10];

pol = pL(x10);

err_cuad = norm(pol-y10,2)
err_rel_10 = abs(sem_10-pL(10))/abs(sem_10)
