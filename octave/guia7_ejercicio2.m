clear all;clc
format long

dy = @(t,y) -y+sin(t)+cos(t);

y_real = @(t) sin(t);

y0 = 0;
inter = [0 2];
h = 1/5;

disp("H   L   Euler   Rk2   Rk4")
for i = 1 : 8
  h = h/2;
  L = 2/h;

  [t,y_euler] = euler(dy,inter,y0,L);
  [t,y_rk2] = rk2(dy,inter,y0,L);
  [t,y_rk4] = rk4(dy,inter,y0,L);

  plot(t,y_real(t),t,y_euler,t,y_rk2,t,y_rk4)
  legend("Analitico", "Euler", "Rk2", "Rk4")
  title(L)
  pause(1)
  disp([h L y_euler(end) y_rk2(end) y_rk4(end)])
endfor

disp("Valor correcto")
disp(y_real(2))
