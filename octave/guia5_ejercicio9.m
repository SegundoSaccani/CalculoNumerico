clear all;clc

# y = -e^pol2 -> ln(-y) = pol2

x = [-1 0 1 2];
y = [-1.1 -0.4 -0.9 -2.7];


cL = polyfit(x,log(-y),length(x)-1)

pL = @(x) polyval(cL,x)

xx = linspace(-1.5,2.5,201);

f = @(x) -e.^pL(x)

plot(x,y,'*',xx,f(xx))
