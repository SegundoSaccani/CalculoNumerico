clear all;clc
format long;
#Ecuacion: c * v =  g * m * ( 1 - e^(-(c/m)*t) )
#Ecuacion a:  0 =  g * m * ( 1 - e^(-(c/m)*t) ) - (c * v)
g = 9.8;

#A: 5 cifras exactas
c_a = 17;
t_a = 9;
v_a = 35;

f_a = @(m)  g * m .* ( 1 - e.^(-(c_a./m)*t_a) ) - (c_a * v_a);

figure(1)
m_x = linspace(0,100,101);
plot(m_x,f_a(m_x)) # m entre 60 y 70
grid on;

[m_a] = biseccion(f_a,60,80,100,1e-3)

#B: 5 cifras exactas
t_b = 9;
v_b = 35;
m_b = 73;

f_b = @(c)  g * m_b .* ( 1 - e.^(-(c/m_b)*t_b) ) - (c .* v_b);

figure(2)
c_x = linspace(0,30,101);
plot(c_x,f_b(c_x)) # c entre 15 y 20
grid on;

[c_b] = biseccion(f_b,15,20,100,1e-3)
