clear all;clc
n=1000;

A = diag(0.5*ones(1,n-2).*[1:n-2],2)+diag(0.5*ones(1,n-2).*[1+2:n],-2) + diag(0.25*ones(1,n-4).*[1:n-4],4)+diag(0.25*ones(1,n-4).*[1+4:n],-4) + diag(2*ones(1,n).*[1:n],0);

b=ones(n,1)*pi;

#A es estrictamente diagonal dominante ya que 2i > 0.5i+0.5i+0.25i+0.25i = 1.5i para todo i=1,2,3,...,n
#por lo q convergen gs y jacobi

z = (ones(n,1));
A_definida_postiva = z'*A*z > 0 #---> = 1 significa q A es definida positiva por lo q converge SOR con 0<w<2

disp("Jacobi")
tic
[x_j,it_j,rh_j] = jacobi(A,b,ones(n,1),200,10e-5);
it_j
tJ=toc()


disp("GaussSeidel")
tic
[x_gs,it_gs,rh_gs] = gaussseidel(A,b,ones(n,1),200,10e-5);
it_gs
tGS=toc()


disp("SOR")
w = 0.1;
[x_sor,it_sor,rh_sor] = sor(A,b,ones(n,1),200,10e-5,w);

for i=2:19
  w_i = i*0.1;
  [x_i,it_i,rh_i] = sor(A,b,ones(n,1),200,10e-5,w_i);
  if(it_i<it_sor)
    w = w_i;
    it_sor = it_i;
  endif
endfor


disp("El w optimo es")
w

tic
[x_sor,it_sor,rh_sor] = sor(A,b,ones(n,1),200,10e-5,w);
it_sor
tSor = toc()

semilogy(rh_j)
hold on;
semilogy(rh_gs)
semilogy(rh_sor)
