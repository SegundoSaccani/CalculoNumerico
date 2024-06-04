clear all;clc

F = @(t,x) [-t.*x(2);t.*x(1)-t.*x(2)];

t0 = [1;-1];
inter = [0 20];

h = 0.05;
L = 20/h;

[t,X] = rk4(F,inter,t0,L);

x1 = X(:,1);
x2 = X(:,2);
plot(x1,x2)


#A partir de q momento la distancia de la particula es menor a (0.01) al atractor (0,0)
for i = 1 : rows(x1)
dist = sqrt( (x1(i))^2+ (x2(i))^2 );

if(dist<0.01)
  momento = t(i);
  break
endif

endfor

disp ("Momento a partir del cual la distancia es menor a 0.1")
disp(momento)

hold on
plot(x1(i),x2(i),'ko')
