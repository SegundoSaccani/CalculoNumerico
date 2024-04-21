function [r1,r2] = baskara(a,b,c)
  r1 = (-b + sqrt(b^2-4*a*c))/(2*a);
  r2 = (-b - sqrt(b^2-4*a*c))/(2*a);
  endfunction
