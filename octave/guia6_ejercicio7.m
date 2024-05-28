clear all;clc

xx = [0:0.2:1.2]' #cm /1000
p = [4;3.95;3.89;3.80;3.60;3.41;3.30] #g/cm^3
A = [100;103;106;110;120;133;149.6] #cm^2

integrando = p.*A #g/cm

disp("\nTrapezoidal")
It = trapcomp(xx,integrando) #en kg

disp("\nSimpson")
Is = simpsoncomp(xx,integrando) #en kg
