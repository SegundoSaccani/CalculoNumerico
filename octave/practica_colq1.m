clear all;clc
format long

a = 0.01;
c = 0.217;
p=2.7;
k0=0.57;
H = 15;
ue = 4;
ya = 6;
yb = [k0 H H*ue]; #ley enfriamiento de newton −K0u'(L) - H*u(L) = − H*uE
f = @(x) 2*x.*(2-x);
cr = @(x) 0.1*x.^3+2.5;
l=2;

#−u''(x) + cR(x)u(x)/k0 - f(x)/k0 = 0
F = @(x) [0*x cr(x)/k0 -f(x)/k0];

L=201;
[xx,uu] = dif_fin_rob(F,[0 l],ya,yb,L);
temp_ant = uu(end);
tol = 1e-4;
while(1)
L=L*2+1;
[xx,uu] = dif_fin_rob(F,[0 l],ya,yb,L);
temp_ext = uu(end);
if(abs(temp_ext-temp_ant)<tol)
  break
endif
temp_ant=temp_ext;
endwhile

L=L*100;
[xx,uu] = dif_fin_rob(F,[0 l],ya,yb,L);
A = uu(end)

du_ext = (uu(end)-uu(end-1))/(abs(xx(end)-xx(end-1)));
flujo_ext = -k0*du_ext;
B=flujo_ext

I = trapcomp_2(xx,uu);
C = a*I*c*p

plot(xx,uu)
