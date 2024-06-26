clear all;clc
format long

f = @(x) 2+cos(pi*x);
df = @(x) -pi*sin(pi*x);
n = 3;
L = 40
integrando = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);

Int_act = cuad_gauss_c(integrando,0,2,L,n)

for i=1:6
  L=L*2
  Int_ref = cuad_gauss_c(integrando,0,2,L,n)
  err = abs(Int_act-Int_ref)
endfor
