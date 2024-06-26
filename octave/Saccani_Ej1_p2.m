clear all;clc
format long
y = [26.1 25.6 23.5 20.3 17.3 13.9 13.4 15 17.1 20.7 22.1 25.2 ];
tam = length(y);
x = [1:tam]; #comienza desde t = 1 =(enero 2019)

#a) f(t)=a t + b + c sin(π/6t)+d cos(π/6t)

M = zeros(tam,4);
for i=1:tam
  M(i,1) = x(i);
  M(i,2) = 1;
  M(i,3) = sin((pi/6)*x(i));
  M(i,4) = cos((pi/6)*x(i));
endfor
#{
    M(12,4)    *     c(4,1) = y(12,1)
[M'(4,12)*M(12,4)] * c(4,1) = [M'(4,12) * y(12,1)]
      A(4,4)       * c(4,1) =  b(4,1)
#}

A = M'*M;
b = M'*y';
C = gauss(A,b);
a = C(1)
b = C(2)
c = C(3)
d = C(4)

f = @(x) a*x + b + c * sin((pi/6)*x) + d * cos((pi/6)*x);
xx = linspace(x(1),x(end)+1,201);
figure(1)
plot(x,y,'ok',xx,f(xx))

#b)
disp("\nError cuadratico")
err_cuad = norm(y-f(x),2)

#c)
disp("\nTemperatura en 2020 enero (mes 13)")
enero_2020 = f(x(end)+1)
hold on
plot(x(end)+1,f(x(end)+1),'*r')
disp("\nEl error relativo con respecto a 27 es")
err_rel = abs(27-enero_2020)/27
