clear all;clc
tol = 1e-10; #con 10 d´ıgitos correctos.???????????????????????????

f= @(x) sin(x)+ cos(1+x^2)-1;
df = @(x) -2*x*sin(x^2+1)+ cos(x);
a = 0;
b = 2.5;
c=5;
kmax = 100;

disp("Primera raiz")
[xb_1,hb1,itb1,tb1] = biseccion(f,a,b,kmax,tol)
disp(' ')
[xn_1,hn1,itn1,tn1] = newton(f,df,1.9,kmax,tol)
disp(' ')
[xs_1,hs1,its1,ts1] = secante(f,1.8,2,kmax,tol)
disp(' ')

disp("Segunda raiz")
[xb_2,hb2,itb2,tb2] = biseccion(f,b,c,kmax,tol)
disp(' ')
[xn_2,hn2,itn2,tn2] = newton(f,df,2.5,kmax,tol)
disp(' ')
[xs_2,hs2,its2,ts2] = secante(f,2.3,2.5,kmax,tol)


#Biseccion es el que mas facil de setear es ya que solo hay que saber un rango en el q exista la raiz, en los q en los extremos la funcion tengan signos contrarios
# sin embargo es el mas lento de los tres

#NewtonRawson es el que mas rapido converge sin embargo hay que establecer un valor inicial cercano a la raiz que no es sencillo establecer sin un metodo grafico

#Secante es mas facil de setear q NewtonRawson pero mas lento, y mas rapido que biseccion,
#sin embargo hay que establecer dos valores iniciales de los que hay q saber q estan cerca de la raiz
