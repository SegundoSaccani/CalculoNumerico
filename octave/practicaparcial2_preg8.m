clear all;clc
format long

f = @(x) 1+x+cos(x);
df = @(x) 1-sin(x);

integrando = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);

L = 10
I_inicial = cuad_gauss_c(integrando,0,4,L,3)

disp("\nPrueba para mayores L")
for i=1:6
  L=L*2
  I = cuad_gauss_c(integrando,0,4,L,3)
  err = abs(I_inicial-I)
  disp(" ")
endfor

