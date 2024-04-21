n=1000;

v0=2i;
v2=0.5i;
v4=0.25i;


A = diag(ones(1,n-2)*v2,2)+diag(ones(1,n-2)*v2,-2) + diag(ones(1,n-4)*v4,4)+diag(ones(1,n-4)*v4,-4) + diag(ones(1,n)*v0,0);

b=ones(n,1)*pi;
