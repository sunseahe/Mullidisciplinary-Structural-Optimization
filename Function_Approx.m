 
clear all
clc

%% Function Approx gL, gR

r=2780, g=9.81
L = [0.800000000000000,0.800000000000000,0.800000000000000,0.800000000000000,0.800000000000000,0.894427190999916,1.60000000000000,1.62185079461706,0.899777750336160,0.632455532033676,1.05830052442584,0.692820323027551,1.05830052442584,0.480000000000000,0.800000000000000,1.13137084989848,1.20000000000000];
s = [-1 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]
A = [0.00125714285714286,0.00125714285714286,0.00125714285714286,0.00125714285714286,0.00125714285714286,0.000707142857142857,0.00181028571428571,0.00181028571428571,0.00181028571428571,0.000707142857142857,0.000707142857142857,0.000707142857142857,0.000707142857142857,0.000707142857142857,0.000707142857142857,0.000707142857142857,0.000707142857142857];
alpha = -1:0.1:1;
x1 = A(1) + alpha*s(1);
x2 = A(2) + alpha*s(2);
x3 = A(3) + alpha*s(3);
x4 = A(4) + alpha*s(4);
x5 = A(5) + alpha*s(5);
x6 = A(6) + alpha*s(6);
x7 = A(7) + alpha*s(7);
x8 = A(8) + alpha*s(8);
x9 = A(9) + alpha*s(9);
x10 = A(10) + alpha*s(10);
x11 = A(11) + alpha*s(11);
x12= A(12) + alpha*s(12);
x13 = A(13) + alpha*s(13);
x14= A(14) + alpha*s(14);
x15 = A(15) + alpha*s(15);
x16 = A(16) + alpha*s(16);
x17 = A(17) + alpha*s(17);

g = r*g*(x1*L(1)+x2*L(2)+x3*L(3)+x4*L(4)+x5*L(5)+x6*L(6)+x7*L(7)+x8*L(8)+x9*L(9)+x10*L(10)+x11*L(11)+x12*L(12)+x13*L(13)+x14*L(14)+x15*L(15)+x16*L(16)+x17*L(17))

g_x0 = g(1);

dg_x1 = r*g.*x1*L(1);             
dg_x2 = r*g.*x2*L(2);              
dg_x3 = r*g.*x3*L(3);               
dg_x4 = r*g.*x4*L(4);             
dg_x5 = r*g.*x5*L(5);              
dg_x6 = r*g.*x6*L(6);
dg_x7 = r*g.*x7*L(7);             
dg_x8 = r*g.*x8*L(8);           
dg_x9 = r*g.*x9*L(9);
dg_x10 = r*g.*x10*L(10);             
dg_x11 = r*g.*x11*L(11);              
dg_x12 = r*g.*x12*L(12);
dg_x13 = r*g.*x13*L(13);             
dg_x14 = r*g.*x14*L(14);              
dg_x15 = r*g.*x15*L(15);
dg_x16 = r*g.*x16*L(16);             
dg_x17 = r*g.*x17*L(17);             
%% Linear Approximation

gL = g_x0 + (x1 - A(1)).*dg_x1 + (x2 - A(2)).*dg_x2 + (x3 - A(3)).*dg_x3+(x4 - A(4)).*dg_x4 + (x5 - A(5)).*dg_x5 + (x6 - A(6)).*dg_x6+(x7 - A(7)).*dg_x7 + (x8 - A(8)).*dg_x8 + (x9 - A(9)).*dg_x9+(x10 - A(10)).*dg_x10 + (x11 - A(11)).*dg_x11 + (x12 - A(12)).*dg_x12+(x13 - A(13)).*dg_x13 + (x14 - A(14)).*dg_x14 + (x15 - A(15)).*dg_x15+(x16 - A(16)).*dg_x16 + (x17 - A(17)).*dg_x17

%% Reciprocal Approximaiton

gR = g_x0 + (x1 - A(1)).*(A(1)./x1).*dg_x1 + (x2 - A(2)).*(A(2)./x2).*dg_x2 + (x3 - A(3)).*(A(3)./x3).*dg_x3 +	(x4 - A(4)).*(A(4)./x4).*dg_x4 + (x5 - A(5)).*(A(5)./x5).*dg_x5 + (x6 - A(6)).*(A(6)./x6).*dg_x6 + (x7 - A(7)).*(A(7)./x7).*dg_x7 + (x8 - A(8)).*(A(8)./x8).*dg_x8 + (x9 - A(9)).*(A(9)./x9).*dg_x9 + (x10 - A(10)).*(A(10)./x10).*dg_x10 + (x11 - A(11)).*(A(11)./x11).*dg_x11 + (x12 - A(12)).*(A(12)./x12).*dg_x12 + (x13 - A(13)).*(A(13)./x13).*dg_x13 + (x14 - A(14)).*(A(14)./x14).*dg_x14 + (x15 - A(15)).*(A(15)./x15).*dg_x15 +(x16 - A(16)).*(A(16)./x16).*dg_x16 + (x17 - A(17)).*(A(17)./x17).*dg_x17 

figure; hold on
plot(alpha, g,'k')
plot(alpha, gL,'r--*')
plot(alpha, gR,'m-*')
legend('S','g','gL')
title('Approximations')
xlabel('step size - alpha')
ylabel('Function value')

figure; hold on
plot(alpha,(gL-g)./g*100,'b')
plot(alpha,(gR-g)./g*100,'r--*')
legend('S','gL-g', 'gR-g')
title('Percent Error')
xlabel('step size - alpha')
ylabel('Relative Error Percentage')
























