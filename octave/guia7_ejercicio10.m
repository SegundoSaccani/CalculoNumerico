clear all;clc
#{
  F''=-sin(F)

  u1 = F
  u2 = u1'=F'
  u2' = F'' = -sin(u1)
#}
F = @(t,u) [u(2);-sin(u(1))];

inter = [0 20];
L = 64;
#a
f0 = [0.1;0];
[t,a] = rk4(F,inter,f0,L);
#b
f0 = [0.7;0];
[t,b] = rk4(F,inter,f0,L);
#c
f0 = [3;0];
[t,c] = rk4(F,inter,f0,L);
#d
f0 = [3.5;0];
[t,d] = rk4(F,inter,f0,L);

figure(1)
plot(t,a(:,1),t,b(:,1),t,c(:,1),t,d(:,1))
legend("a","b","c","d")
grid minor

#e
f0 = [0;1];
[t,e] = rk4(F,inter,f0,L);
#f
f0 = [0;1.99];
[t,f] = rk4(F,inter,f0,L);
#g
f0 = [0;2];
[t,g] = rk4(F,inter,f0,L);
#h
f0 = [0;2.1];
[t,h] = rk4(F,inter,f0,L);

figure(2)
plot(t,e(:,1),t,f(:,1),t,g(:,1),t,h(:,1))
legend("e","f","g","h")
grid minor
