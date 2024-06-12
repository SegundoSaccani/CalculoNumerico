clear all;clc
format long

x = [1:0.2:2.4];
y = [0.678 0.512 0.387 0.293 0.221 0.167 0.126 0.096];

# y = a e^b*x -> ln y =  b * x + (ln a)

coef = polyfit(x,log(y),1)

b = coef(1)
a = e^coef(2)

f = @(x) a*e.^(b*x);
df =@(x) a*b*e.^(b*x);

xx=linspace(1,2.4,201);
plot(xx,f(xx),x,y,'ok')

ejer_a = f(1.9)
disp("")

integrando = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);

tol = 1e-5;

L = 1
int_ant = cuad_gauss_c(integrando,1,2.4,L,3)

while(1)
L = L*2
int_act = cuad_gauss_c(integrando,1,2.4,L,3)

if(abs(int_act-int_ant)<tol)
  break
endif

int_ant = int_act;
endwhile

ejer_b = int_act
