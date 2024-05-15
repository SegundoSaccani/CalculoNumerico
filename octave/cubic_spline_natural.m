function  [a,b,c,d]=cubic_spline_natural(x,f)

  n = length(x);

  h = x(2:n)-x(1:n-1);
  a = f;

  M = zeros(n,n);
  M(1,1) = 1;
  M(n,n) = 1;
  for i = 2:n-1
    M(i,i) = 2*(h(i-1)+h(i));
    M(i,i+1)= h(i);
    M(i,i-1)= h(i-1);
  endfor

  M;

  B = (3./h((2:length(h)))).*(a(3:length(a))-a(2:length(a)-1))-(3./h((1:length(h)-1))).*(a(2:length(a)-1)-a(1:length(a)-2));
  B = [0;B;0];

  [c] = gauss(M,B);


  b= (1./h).*(a(2:length(a)) - a(1:length(a)-1)) - (h./3).*(2.*c(1:length(c)-1)+ c(2:length(c)));
  d = (c(2:length(c)) - c(1:length(c)-1))./3 .* h;
  a = a(1:n-1);
  c = c(1:n-1);

  endfunction
