clear all;clc
format long

x = [0:0.2:2];
y = [4.24 4.44 4.91 5.44 5.65 5.33 3.91 1.86 0.07 -1.16 -1.94];

tam = length(x);

M=zeros(length(x),3);
for i=1:length(x)
  M(i,1) = 1;
  M(i,2) = cos((pi/2)*x(i));
  M(i,3) = cos((pi/2)*x(i))^2;
endfor

#M(11,3)*a(3,1) = y(11,1)
#[Mt(3,11)*M(11,3)] * a(3,1) = [Mt(3,11) * y(11,1)]
#        A(3,3)     * a(3,1) =        b(3,1)

A = M'*M;
b = M'*y';

a = A\b

f = @(x) a(1)+a(2)*cos((pi/2)*x)+a(3)*cos((pi/2)*x).^2;
xx = linspace(0,2,201);
plot(xx,f(xx),x,y,'ok')

err_x_1 = abs(f(1)-5.33)
