clear all;clc
format long

#{
  F''= -(g/L)*sin(F)

  u1 = F
  u2 = u1'=F'
  u2' = F'' = -(g/L)*sin(u1)
#}
g = 9.81;
l=2;
F = @(t,u) [u(2);-(g/l)*sin(u(1))];
inter = [0 10];
L = 1000;
f0 = [0;1];

[tt,y] = rk4(F,inter,f0,L);

plot(tt,y(:,1))

y(end,1)
