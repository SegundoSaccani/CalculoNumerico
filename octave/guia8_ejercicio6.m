clear all;clc
format long

ya = 6;

k0 = 0.9;
H = 15;
ue = 4;
# −k0 * u'(L) = H * u(L) − H * uE ->  k0 * u'(L) + H * u(L)  =  H * uE
yb= [k0 H (H*ue)];

f = @(x) 5*x.*(5-x);
cr = @(x) 1.05*x+2;

l = 5;

# − u''(x) + cR(x)/k0 * u(x) - f(x)/k0 = 0
                #q              r
F = @(x) [0*x,(cr(x)/k0),(-f(x)/k0)];

L=201;
[xx,uu] = dif_fin_rob(F,[0 l],ya,yb,L);
temp_medio_ant = uu(end/2);
tol = 1e-4;
while(1)
L=L*2+1;
[xx,uu] = dif_fin_rob(F,[0 l],ya,yb,L);
temp_medio = uu(end/2);
if(abs(temp_medio-temp_medio_ant)<tol)
  break
endif
temp_medio_ant=temp_medio;
endwhile

punto_medio = xx(end/2)
temp_medio = uu(end/2)
plot(xx,uu,xx(end/2),uu(end/2),'ko')
