clear all;clc

f = @(x) 20*x-((x.^3)/5);
df = @(x) 20-(3/5)*(x.^2);

integrando = @(x) 2*pi*f(x).*sqrt(1+df(x).^2);

Int_gauss_3n_1L = cuad_gauss_c(integrando,0,2,1,3)

Int_simp_1L = intNCcompuesta(integrando,0,2,1,3)

Int_simp_5L = intNCcompuesta(integrando,0,2,5,3)

Int_trapz_5L = intNCcompuesta(integrando,0,2,5,2)

Int_gauss_octave = quad(integrando,0,2)
