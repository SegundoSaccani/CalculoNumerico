clear all;clc
format long

#EV.CONT.1
n = 40;
A = diag(ones(n,1)*2) + diag(ones(n-1,1)*-1,1) + diag(ones(n-1,1)*-1,-1);
b = 1.5*[1:n]'-6;

x = factorizacionLU(A,b);

ec1_a = x(20)

x0 = zeros(n,1);
w = 1.85;
tol = 1e-5;
maxit = 10000;
#[~,ec1_b_it_j] = jacobi(A,b,x0,maxit,tol)
#[~,ec1_b_it_gs] = gaussseidel(A,b,x0,maxit,tol)
#[~,ec1_b_it_s] = sor(A,b,x0,maxit,tol,w)

#EV.CONT.2
pt = 3.7;
k = 0.04;
tol = 1e-8;
f = @(x) (x./(1-x)).*(sqrt((2*pt)./(2+x)))-k;
xx=linspace(0,10,201);
figure(1)
plot(xx,f(xx))
ec2_a = biseccion(f,0,0.4,maxit,tol)

x0 = 0.02;
f = @(p) (x0./(1-x0)).*(sqrt((2*p)./(2+x0)))-k;
xx=linspace(0,10,201);
figure(2)
plot(xx,f(xx))
ec2_a = biseccion(f,2,5,maxit,tol)

#EV.CONT.3
f = @(x) 3*(x+0.5).*sin((x-2.7)/2).^4;
h = 0.000001;
df1 = (f(0+h)-f(0-h))/(2*h);
df2 = (f(2.4+h)-f(2.4-h))/(2*h);
x_spline = linspace(0,2.4,11);
[s,ds] = funcion_spline(x_spline',f(x_spline)',df1,df2);
figure(3)
xx = linspace(0,2.4,111);
plot(xx,s(xx),xx,f(xx))

integrando = @(x) 2*pi*s(x).*sqrt(1+ds(x).^2);

ec3_a_1 = s(1)
ec3_a_2 = abs(s(1)-f(1))
L=10;
I_ant = cuad_gauss_c(integrando,0,2.4,L,3);
while(1)
L=L*2;
I = cuad_gauss_c(integrando,0,2.4,L,3);
if(abs(I-I_ant)<1e-6)
  break;
endif
I_ant =I;
endwhile
ec3_b = I

#EV.CONT.4
#y'' = 20*cos(y)^2 - sin(y) - y'
#{
u1 = y
u2 = y' = u1'
     y'' = u2'
#}

F = @(x,u) [u(2);20*cos(u(1)).^2 - sin(u(1)) - u(2)];
y0 = [pi/2 0];
L=10;
[tt,yy_ant] = rk4(F,[0 4],y0,L);

while(1)
L=L*2;
[tt,yy] = rk4(F,[0 4],y0,L);
if(abs(yy(end,1)-yy_ant(end,1))<1e-4)
  break;
endif
yy_ant = yy;
endwhile

ec4_a = yy(end,1)

[tt,yy] = rk4(F,[0 6],y0,L);
figure(4)
plot(tt,yy(:,1))
