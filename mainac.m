clc 
clear all 

% configuration 
E   = [8.55, 9, 9.45]; 
R_1 = [0.9, 1, 1.1];
R_2 = [1.8, 2, 2.2]; 
alpha = 0.435;

% R = R1 + R2
R_sum = fuzarithac(R_1, R_2, alpha, 'sum');

% I = E / R 
I_serial = fuzarithac(E, R_sum, alpha, 'div');

% U2 ( U on R2 ) = I * R2 
U_2 = fuzarithac(R_2, I_serial, alpha, 'prod');

% U1 ( U on R1 ) = I * R1
U_1 = fuzarithac(R_1, I_serial, alpha, 'prod');

% check if U1 + U2 = E 
E_check = fuzarithac(U_2, U_1, alpha, 'sum');


%------------ for ploting ---------------
% configuration of linear space 
min_x = 0;
max_x = 13;
point_n = 1000; 

% space of fuzzy logic 
x = linspace(min_x, max_x, point_n);

% 
E_p = trimf(x, [8.55, 9, 9.45]);
R_1_p =trimf(x, [0.9, 1, 1.1]);
R_2_p =trimf(x, [1.8, 2, 2.2]);
R_sum_p = trimf(x, [R_sum(1), R_sum(2), R_sum(3)]);
I_serial_p = trimf(x, [I_serial(1), I_serial(2), I_serial(3)]);
U_2_p = trimf(x, [U_2(1), U_2(2), U_2(3)]);
U_1_p = trimf(x, [U_1(1), U_1(2), U_1(3)]);
E_check_p = trimf(x, [E_check(1), E_check(2), E_check(3)]);


% plotting 
figure
subplot(3,2,1)
plot(x,R_1_p,'b--',x,R_2_p,'m:',x,R_sum_p,'c')
title('R sum = R_1 + R_2')
legend('R_1','R_2','R sum')

subplot(3,2,2)
plot(x,E_p,'b--',x,R_sum_p,'m:',x,I_serial_p,'c')
title('I serial = E / R sum')
legend('E','R sum','I serial')

subplot(3,2,3)
plot(x,R_2_p,'b--',x,I_serial_p,'m:',x,U_2_p,'c')
title('U_2 = R_2 * I serial')
legend('R_2','I serial','U_2')

subplot(3,2,4)
plot(x,R_1_p,'b--',x,I_serial_p,'m:',x,U_1_p,'c')
title('U_1 = R_1 * I serial')
legend('R_1','I serial','U_1')

subplot(3,2,5)
plot(x,U_2_p,'b--',x,U_1_p,'m:',x,E_check_p,'c')
title('E check = U_1 + U_2')
legend('U_2','U_1','E check')

subplot(3,2,6)
plot(x,E_p,'b--',x,E_check_p,'m:')
title('E ?= E check')
legend('E','E check')