function [x,it,r_h] = sor(A,b,x0,maxit,tol,w)
  n=length(b);
  it=0;
  r_h=[];
  x=x0;
  while(it<maxit)
    it=it+1;
    for i=1:n
      x(i) = (w*((b(i)-A(i,1:i-1)*x(1:i-1)-A(i,i+1:n)*x0(i+1:n))/A(i,i)))+(x0(i)*(1-w)) ;
    endfor
    err=norm(x-x0,inf)/norm(x,inf);
    r_h = [r_h;err];
    if(err<tol)
      break
    endif
    x0=x;
  endwhile

  if it == maxit
    disp("Maximo numero de iteraciones")
  endif
