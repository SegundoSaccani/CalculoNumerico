clear all;clc
tol = 1e-4;

d = @(x) sqrt((x-1)^2+x^4);

deriv = @(x) (-1+ x + 2.*x.^3)./(sqrt( (x-1).^2 + x.^4));
deriv2 = @(x) (2*x.^6 + 3*x.^4 - 8*x.^3 + 6*x.^2)./( ((x-1).^2 + x.^4) .* sqrt((x-1).^2 + x.^4) );

xl = linspace(-7,7,100);
plot(xl,deriv(xl)) #x = 0.6 y = 0.6^2 = 0.36
grid on;

[x,h,it,t] = newton(deriv,deriv2,0.6,100,tol)

disp(" ")
disp("El punto de y=x^2 mas cercano a (1,0) es")
y = x^2;
[x,y]
