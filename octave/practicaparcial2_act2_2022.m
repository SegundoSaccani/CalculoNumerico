clear all;clc
format long

t = [0.2:0.1:0.8];
I = [3.16 2.38 1.75 1.34 1.00 0.74 0.56];

#I = i0*e^(-a*t)
#ln(I) = - a*t + ln(i0) = A*t+B
#A = -a
#B = ln(io)

cl = polyfit(t,log(I),1)

a = -cl(1)
io = e^cl(2)

pL = @(t) io*e.^(-a*t)
tt = linspace(0.2,0.8,201);
plot(t,I,'o',tt,pL(tt))
