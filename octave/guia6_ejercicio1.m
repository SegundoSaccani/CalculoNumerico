clear all;clc

f = @(x) e.^x - 2*x.^2 +3*x-1;
x0 = 0;

df_x0_real =4;

h = linspace(1e-10,1e-1,500);
df_2=[];
df_3=[];
err_abs_2 = [];
err_abs_3 = [];

it = 1;
while it <= length(h)
  #formula de dos puntos
  df_aux_2 = (f(0+h(it))-f(0))/h(it);
  df_2=[df_2;df_aux_2];

  err_abs_2=[err_abs_2;abs(df_aux_2-df_x0_real)];

  #formula de tres puntos
  df_aux_3 = (f(0+h(it))-f(0-h(it)))/(2*h(it));
  df_3=[df_3;df_aux_3];

  err_abs_3=[err_abs_3;abs(df_aux_3-df_x0_real)];

  it++;
endwhile

figure(1)
loglog(h,err_abs_2,'r',h,err_abs_3,'b') #Ambas escalas logaritmicas
legend("Función dos puntos","Función tres puntos","location","northwest")
xlabel("Incremento h")
ylabel("Error absoluto")
