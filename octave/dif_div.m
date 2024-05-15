 function [c] = dif_div(x,y)

   n = length(x);
   M = zeros(n,n+1);

   M(:,1) = x;
   M(:,2) = y;
   for j= 3 : n+1
     for i=1 : n-j+2
       M(i,j) = (M(i+1,j-1) - M(i,j-1))/(M(i+(j-2),1) - M(i,1));
     endfor
   endfor

  c = M(1,:);

  M

 endfunction

