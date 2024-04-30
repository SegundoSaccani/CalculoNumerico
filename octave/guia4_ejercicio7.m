clear all;clc
f = @(x) x.*(log(x+3)-17)-1
df= @(x) (x/(x+3))+(log(x+3))-17

i=1;
while(1)
  if(f(0)*f(i)<0)
    break
  endif
  i=i*2;
endwhile


disp("")
disp("Intervalo:")
[0,i]
disp("")
xs = linspace(0,i,1000);
plot(xs,f(xs))
grid on;

disp("Biseccion")
[xb,hb,itb,tb] = biseccion(f,0,i,1000,1e2)
disp("")
disp("Newton")
[x,h,it,t] = newton(f,df,xb,100,1e-12)

disp("La raiz se encuentra en ")
x
