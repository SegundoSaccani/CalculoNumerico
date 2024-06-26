clear all;clc
format long

#a)  La longitud de la elipse (x^2)/(1)+ (y^2)/(3^2)= 1 ?

X = @(t) 1 * cos(t);
Y = @(t) 3 * sin(t);

dX = @(t) -1*sin(t);
dY = @(t) 3*cos(t);

tt = linspace(0,2*pi,201);
figure(1)
plot(X(tt),Y(tt),X(0),Y(0),'ok',X(2*pi),Y(2*pi),'*r')

#t1 = 0 -> X(0) = cos(0) = 1; Y(0) = 3*sin(0) = 0;
#t2 = ? -> X(t2)= cos(t2)= 1; Y(0) = 3*sin(t2) = 0 -> t2 = m*2pi (m = 1 "vuelta")
integrando = @(t) sqrt(dX(t).^2+dY(t).^2);

L=30
Int_ant = cuad_gauss_c(integrando,0,2*pi,L,3)
tol = 1e-10;
while(1)
L=2*L
Int = cuad_gauss_c(integrando,0,2*pi,L,3)
err = abs(Int_ant-Int)
if(err<tol)
  break
endif
Int_ant = Int;
endwhile

disp("\nEl valor de la longitud de la elipse es")
Int
Ejb = cuad_gauss_c(integrando,0,2*pi,7,2)
err_abs_b = abs(Int-Ejb)
