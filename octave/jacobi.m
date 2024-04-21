function [x,it,r_h] = jacobi(A,b,x0,maxit,tol)
  n=length(b);
  it=0;
  r_h=[];
  x=x0;
  while(it<itmax)
    it=it+1;
    for i=1:n
      x(i) = (b(i)-A(i,1:i-1)*x0(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i);
    endfor
    err=norm(x-x0,inf)/norm(x,inf);
    r_h = [r_h;err]; %analizar que hace esta linea
    if(err<tol)
      break
    endif
    x0=x;
  endwhile

  if it == maxit
    disp("Maximo numero de iteraciones")
  endif
