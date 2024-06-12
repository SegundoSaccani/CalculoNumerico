clear all;clc

I=10
disp(" ")

dy= @(t,y) (t.*e.^(3*t)) - 2*y;
d2y = @(t,y) e.^(3*t)+3*t.*e.^(3*t) -2* dy(t,y);

y_real = @(t,y) (t.* e.^(3*t))/5 -  (e.^(3*t))/25 +  (e.^(-2*t))/25;

y0 = 0;
inter = [0 1];
err_euler_vect = [];
err_CN_vect = [];
err_pred_vect = [];
err_rk4_vect = [];
h_v = [];

h = 0.4;
for i = 1:I
  h = h/2
  h_v = [h_v;h];
  L = 1/h
  [t,y_euler] = euler(dy,inter,y0,L);
  [t,y_cn] = CN_newton(dy,d2y,0,1,y0,L);
  [t,y_rk4] = rk4(dy,inter,y0,L);
  [t,y_pred] = PredictorCorrectorAdams(dy,inter(1),inter(2),y0,L);

  disp("     Real      Euler    CN    Predictor   rk4")
  disp([y_real(1) y_euler(end) y_cn(end) y_pred(end) y_rk4(end)])

  err_euler = abs(y_real(1)-y_euler(end))
  err_euler_vect = [err_euler_vect;err_euler];

  err_CN = abs(y_real(1)-y_cn(end))
  err_CN_vect = [err_CN_vect;err_CN];

  err_pred = abs(y_real(1)-y_pred(end))
  err_pred_vect = [err_pred_vect; err_pred];

  err_rk4 = abs(y_real(1)-y_rk4(end))
  err_rk4_vect = [err_rk4_vect; err_rk4];
  disp("-------------------------------------------------")
endfor

loglog(h_v,err_euler_vect,h_v,err_CN_vect,h_v,err_pred_vect,h_v,err_rk4_vect)
title("h vs error absoluto")
xlabel("Tamaño de los intervalos (h)")
ylabel("Error absoluto")
legend("euler","cn","predictor","rk4")
