clear all;clc
p0 = 1.5;
tol= 1e-3;
kmax = 1000;
g1 = @(x) (1/2)*sqrt(10-x^3);
g2 = @(x) sqrt(10/(4+x));

[p1,h_1] = puntofijo(g1,p0,kmax,tol)
[p2,h_2] = puntofijo(g2,p0,kmax,tol)

#Analice los resultados seg´un el teorema correspondiente

#Indique si las cotas de error dadas por el Corolario 2.4 del libro de Burden son v´alidas para
#las funciones g1 y g2 propuestas en el item (b). Si lo fueran, apl´ıquelas para verificar los
#resultados obtenidos num´ericamente.

#{

g(p) = p = 1.3654
|g1| < k <1 (-2.5,1.6)
|g2| < k <1 (-2.5, inf)

Cerca de 1.3654
|g1| < 0.55
|g2| < 0.20
por lo tanto g2 convergera en menos iteraciones

#}

#Cota superior de error para punto fijo en n pasos
n = 10;

cota_sup_g1 = ((0.55^n)/(1-0.55))*abs(g1(p0)-p0)

cota_sup_g2 = ((0.2^n)/(1-0.2))*abs(g2(p0)-p0)

[p11,h_1] = puntofijo(g1,p0,kmax,cota_sup_g1)
[p22,h_2] = puntofijo(g2,p0,kmax,cota_sup_g2)

h_1(rows(h_1))<cota_sup_g1
h_2(rows(h_2))<cota_sup_g2
