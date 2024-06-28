clear all;
format long

a = 0.01;
l = 2;
c = 0.217;
p=2.7;
k0=0.57;

f  = @(x) 12*cos(2*x);
cr = @(x) 5*(x-2);

# − u''(x) + cR(x)/k0 * u(x) - f(x)/k0 = 0
F = @(x) [0*x cr(x)/k0 -f(x)/k0];

#{
cond fronteras
u(0) = 6
k0*u'(2)=40 -> Au'+Bu = C -> A=k0 B=0 C=40
#}
ya = 6;
yb = [k0 0 40];

L=40;
[xx,yy] = dif_fin_rob(F,[0 l],ya,yb,L);
y_ant = yy(end);

while(1)
L=L*2;
[xx,yy] = dif_fin_rob(F,[0 l],ya,yb,L);
if(abs(y_ant-yy(end))<1e-4)
  break
endif
y_ant=yy(end);
endwhile


#flujo en x=0
du_0 = (yy(2)-yy(1))/abs(xx(2)-xx(1))
flujo = -k0*du_0
#b
i = trapcomp(xx,yy);
E = a*c*p*i

#c
#u'(0) = 20/k0
#u(0) = 6

F = @(x,u) [u(2);(cr(x)/k0)*u(1)-(f(x)/k0)];
L=40;
[xx,yy] = rk4(F,[0 l],[6;20/k0],L);
y_ant = yy(end,1);

while(1)
L=L*2;
[xx,yy] = rk4(F,[0 l],[6;20/k0],L);
if(abs(y_ant-yy(end,1))<1e-6)
  break
endif
y_ant=yy(end,1);
endwhile
plot(xx,yy(:,1))

temp_ext_der_c = yy(end,1)
deriv_der = yy(end,2)
flujo_der = -k0*deriv_der
