clear all;
f = @(x) 3*(x+0.5).*sin((x-2.7)/2).^4;
df = @(x) 3*(sin((x-2.7)/2)).^4 + 6*(x+0.5).*(sin((x-2.7)/2)).^3 .* cos((x-2.7)/2);
xx = linspace(0,2.4,11);

fx = f(xx);

df1 = df(0)
df2 = df(2.4)
[S,dS] = funcion_spline(xx',fx',df1,df2);#spline sujeto

plot(xx,f(xx),xx,S(xx))

S_1metro = S(1) #radio segun spline
Y_1metro = f(1)

err = abs(S_1metro-Y_1metro)#error del modelo


integrando = @(x) 2*pi*S(x).*sqrt(1+dS(x).^2);

I_spline = cuad_gauss_c(integrando,0,2.4,10,3)
#I_oct = quad(integrando,0,2.4) #para comparar con el anterior valor
