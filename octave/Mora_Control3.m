function Mora_Control3
f=@(x) 3.*(x+0.5).*((sin((x-2.7)/2)).^4);
df=@(x) 3.*((sin((x-2.7)/2)).^4)+6.*(x+0.5).*((sin((x-2.7)/2)).^3).*cos((x-2.7)/2);
xx=linspace(0,2.4,11);
df(0)
df(2.4)
[S,ds]=funcion_spline(xx',f(xx)',df(0),df(2.4));
format long;
disp("Radio")
S(1)
disp("Error absoluto")
err=abs(f(1)-S(1))

g=@(x)2*pi.*S(x).*sqrt(1+ds(x).^2);
disp("Area por cuad")
I=cuad_gauss_c(g,0,2.4,2000,3)
disp("Area por octave")
I1=quad(g,0,2.4,1e-7)

