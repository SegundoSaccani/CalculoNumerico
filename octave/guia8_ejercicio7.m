clear all;clc
format long

w1 = 2;
L = 6;
L1 = 4;
D = 0.2;
k = 2.04;
H=6e-3;
ue = 40;
uw=200;

F = @(x)[1./(L-x),(H/k)*(L./(D*w1*(L-x))).*(2*D+(2*w1*(L-x))/L),(-ue)*(H/k)*(L./(D*w1*(L-x))).*(2*D+(2*w1*(L-x))/L)];

inter= [0 L1];
ya = uw;
# -k*u' = H*u - H*ue --->  k*u' + H*u =  H*ue
yb = [k H (H*ue)];

[xx,uu] = dif_fin_rob(F,inter,ya,yb,200);

plot(xx,uu)

A1 =((D*w1)/L)*(L-0);
delta_x = xx(2)-xx(1);

flujo_de_calor_primer_nodo_interno = -((k*A1)/delta_x)*(uu(2)-uw)
