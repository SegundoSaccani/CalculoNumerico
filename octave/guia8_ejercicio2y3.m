clear all;clc
format long

F = @(x) [-2./x 2./(x.^2) sin(log(x))./(x.^2)];
inter = [1 2];
yc = [1 2];

c2 = (1/70)*(8-12*sin(log(2))-4*cos(log(2)));
c1 = (11/10)-c2;
y = @(x) c1.*x + c2./x.^2 - (3/10).*sin(log(x))-(1/10).*cos(log(x));
h_v = [];
err_d_v = [];
err_dif_v = [];
td = [];
tdif = [];
L=5;
for i = 1:10
  L = L*2
  h = 1/L
  tic()
  [xx,yy] = disparo_lineal(F,inter,yc,L);
  t1 = toc();
  err_cuad_d = norm(y(xx)-yy,2)
  tic()
  [xx,yy] = dif_fin_dir(F,inter,yc,L);
  err_cuad_dif = norm(y(xx)-yy,2)
  t2 = toc();
  h_v = [h_v; h];
  err_d_v = [err_d_v;err_cuad_d];
  err_dif_v = [err_dif_v;err_cuad_dif];
  td = [td;t1];
  tdif = [tdif;t2];
  disp("")
endfor
figure(1)
loglog(h_v,err_d_v,h_v,err_dif_v)
xlabel("h")
ylabel("Error cuadratico")
legend("Disparo","Diferencias finitas")
figure(2)
loglog(h_v,td,h_v,tdif)
xlabel("h")
ylabel("Tiempo")
legend("Disparo","Diferencias finitas")
