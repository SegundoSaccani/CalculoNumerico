clear all;clc
Nh=10; #??????????

L = 5;
P= 1.0326e+4;
W=0.07;
S=0.14;
J=(W*(S^3))/12;
E = 210e+3;

fj=(P)/(E*J);

H = L/Nh;

d0 = 6*ones(Nh-3,1);
d1 = -4*ones(Nh-4,1);
d2 = ones(Nh-5,1);
Afull = diag(d0) + diag(d1,1) + diag(d2,2)+diag(d1,-1) + diag(d2,-2);
Afull(1,1)=1;Afull(1,2:Nh-3) = 0;
Afull(Nh-3,Nh-3)=1;Afull(Nh-3,1:Nh-4) = 0;
Afull

b= (H^4*fj)*ones(Nh-3,1)

tol = 1e-8;
it_max = 1000;
#######################################
disp("Gauss")
tic
x_g=gauss(Afull,b);
tG = toc()
disp(" ")

disp("Jacobi")
tic
[x_j,it_j,rh_j] = jacobi(Afull,b,ones(Nh-3,1),it_max,tol);
it_j
tJ=toc()
disp(" ")

disp("GaussSeidel")
tic
[x_gs,it_gs,rh_gs] = gaussseidel(Afull,b,ones(Nh-3,1),it_max,tol);
it_gs
tGS=toc()
disp(" ")

disp("SOR")
w = 0.1;
[x_sor,it_sor,rh_sor] = sor(Afull,b,ones(Nh-3,1),it_max,tol,w);

for i=2:19
  w_i = i*0.1;
  [x_i,it_i,rh_i] = sor(Afull,b,ones(Nh-3,1),it_max,tol,w_i);
  if(it_i<it_sor)
    w = w_i;
    it_sor = it_i;
  endif
endfor


disp("El w optimo es")
w

tic
[x_sor,it_sor,rh_sor] = sor(Afull,b,ones(Nh-3,1),it_max,tol,w);
it_sor
tSor = toc()
disp(" ")
#######################################
#Residuo metodos iterativos
semilogy(rh_j)
hold on;
semilogy(rh_gs)
semilogy(rh_sor)
