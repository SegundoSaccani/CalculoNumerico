clear all;clc

t = [4 8 12 16 20 24]
c = [1590 1320 1000 900 650 560]
# c(t) = b * e^(-k*t)  -> ln(c) = -k*t + ln(b) = a*t + d ; (d = ln(b))-> b = e^d; a = -k -> k = -a

cL = polyfit(t,log(c),1)

b=e^cL(2)
k = -cL(1)

c = @(t) b * e.^(-k.*t);

xx=linspace(0,50,201);
figure(1)
plot(xx,c(xx),'r',[4 8 12 16 20 24], [1590 1320 1000 900 650 560] ,'*k')

#c(t)-200 = 0?

c200 = @(t) c(t) -200;
[x] = biseccion(c200,0,100,1000,1e-6)
grid on;
hold on;
plot(x,200,'*m')
