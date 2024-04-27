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

