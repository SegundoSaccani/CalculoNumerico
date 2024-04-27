n=40;
d0=(ones(n,1)*2);
d1=(ones(n-1,1)*-1);

A=diag(d0,0)+diag(d1,-1)+diag(d1,1)

b=1.5*[1:n] -6;
b=b'

x_gauss = gauss(A,b)
disp("El valor de x20 con el metodo de gauss es")
x_20=x_gauss(20)

tol=1e-5; #!!!!!!!!!!!!!!!!!!

max_it=2000; #Jacobi y Gauss convergen porque A es estrictamente diagonal dominante
#y SOR converge porque A es definida positiva (se comprueba haciendo z'Az>0, siendo z vector de Rn)
w=1.85;
x0=zeros(n,1);

[x_j,it_j,rh_j] = jacobi(A,b,x0,max_it,tol);
[x_gs,it_gs,rh_gs] = gaussseidel(A,b,x0,max_it,tol);
[x_sor,it_sor,rh_sor] = sor(A,b,x0,max_it,tol,w);

disp("Iteraciones:")
it_j
it_gs
it_sor
