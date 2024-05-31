clear all;

clf;

### Punto A
x = linspace(0,2.4,11);
f = @(x) (3 .*(x + 0.5) .* (sin((x-2.7)/2) .^4));
df = @(x) (3 .* ((sin((x-2.7)/2) .^4) + (2 .* (sin((x-2.7)/2) .^3) .* cos((x-2.7)/2) .* (x+0.5))));

df1 = df(0);
dfn = df(2.4);

[S,dS,~] = funcion_spline(x',f(x)',df1,dfn);

xx = linspace(0,2.4,101);
figure(1);
plot(x,f(x),'ob');
hold on;
plot(xx,f(xx),'k');
plot(xx,S(xx),'r');
grid on;
grid minor;

rf1 = f(1)
rS1 = S(1)

% Error que se comete de la aproximacion al modelo f(x)
% en el punto x=1
errS1 = norm(rf1-rS1)

### Punto B
f2 = @(x) 2*pi.*S(x).*sqrt((1+(dS(x).^2)));
arCup = cuad_gauss_c(f2,0,2.4,10,5)
