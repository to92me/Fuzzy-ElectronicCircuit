clc
clear all 

% configuration of linear space 
min_x = 0;
max_x = 13;
point_n = 1000; 

% space of fuzzy logic 
x = linspace(min_x, max_x, point_n); 

% given paramteres of circuit
E = trimf(x, [8.55, 9, 9.45]);
R_1=trimf(x, [0.9, 1, 1.1]);
R_2=trimf(x, [1.8, 2, 2.2]);

% R = R1 + R2
R_sum = fuzarith(x,R_1, R_2, 'sum');

% I = E / R 
I_serial = fuzarith(x, E, R_sum, 'div');

% U2 ( U on R2 ) = I * R2 
U_2 = fuzarith(x,R_2, I_serial, 'prod');

% U1 ( U on R1 ) = I * R1
U_1 = fuzarith(x,R_1, I_serial, 'prod');

% check if U1 + U2 = E 
E_check = fuzarith(x,U_2, U_1, 'sum');

% plotting 
figure
subplot(3,2,1)
plot(x,R_1,'b--',x,R_2,'m:',x,R_sum,'c')
title('R sum = R_1 + R_2')
legend('R_1','R_2','R sum')

subplot(3,2,2)
plot(x,E,'b--',x,R_sum,'m:',x,I_serial,'c')
title('I serial = E / R sum')
legend('E','R sum','I serial')

subplot(3,2,3)
plot(x,R_2,'b--',x,I_serial,'m:',x,U_2,'c')
title('U_2 = R_2*I serial')
legend('R_2','I serial','U_2')

subplot(3,2,4)
plot(x,R_1,'b--',x,I_serial,'m:',x,U_1,'c')
title('U_1 = R_1*I serial')
legend('R_1','I serial','U_1')

subplot(3,2,5)
plot(x,U_2,'b--',x,U_1,'m:',x,E_check,'c')
title('E_check = U_1 + U_2')
legend('U_2','U_1','E check')

subplot(3,2,6)
plot(x,E,'b--',x,E_check,'m:')
title('E ?= E check')
legend('E','E check')
