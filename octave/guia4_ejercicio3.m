clear all;clc

g1 = @(x)(3 + x - 2*x^2)^(1/4)
g2 = @(x) ( (x + 3)/(x^2 + 2))^(1/2)
g4 = @(x) (3*x^4 + 2*x^2 + 3) / (4*x^3 + 4*x - 1)
g3 = @(x)((x + 3 - x^4)/( 2))^(1/2)

[p4,h4,it4] = puntofijo(g4,1,100,1e-6)

[p2,h2,it2] = puntofijo(g2,1,100,1e-6)

[p1,h1,it1] = puntofijo(g1,1,100,1e-6)

[p3,h3,it3] = puntofijo(g3,1,100,1e-6)

#"La derivada de g4 pasa practicamente por el puntofijo, la de g2 y g3 cumplen que su valor absoluto sea menor q 1 pero la de g2 tiene un valor menor lo q conlleva q
# tenga mayor rapidez, y la derivada de g3 tiene un valor absoluto mayor de 1 en el punto fijo por lo q el teorema no concluye entonces puede o no converger, en este caso no)"
