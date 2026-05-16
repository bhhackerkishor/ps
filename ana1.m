clear all;
clc;

disp('To determine the economic generation by using Analytical Method');

Pd = input('Enter the system load: ');

a1 = input('Enter Alpha-1 value: ');
b1 = input('Enter Beta-1 value: ');
c1 = input('Enter Gamma-1 value: ');

a2 = input('Enter Alpha-2 value: ');
b2 = input('Enter Beta-2 value: ');
c2 = input('Enter Gamma-2 value: ');

a3 = input('Enter Alpha-3 value: ');
b3 = input('Enter Beta-3 value: ');
c3 = input('Enter Gamma-3 value: ');

Lambda = (Pd + (b1/(2*c1)) + (b2/(2*c2)) + (b3/(2*c3))) / ...
         ((1/(2*c1)) + (1/(2*c2)) + (1/(2*c3)));

P1 = (Lambda - b1) / (2*c1);
P2 = (Lambda - b2) / (2*c2);
P3 = (Lambda - b3) / (2*c3);


if P1 < 150
    P1 = 150;
elseif P1 > 600
    P1 = 600;
elseif P1 >= 150 && P1 <= 600
    disp(P1);
end

if P2 < 100
    P2 = 100;
elseif P2 > 400
    P2 = 400;
elseif P2 >= 100 && P2 <= 400
    
end

if P3 < 50
    P3 = 50;
elseif P3 > 200
    P3 = 200;
elseif P3 >= 50 && P3 <= 200
    disp(P3);
end

% Recalculate remaining power


lambda = ((Pd - P1) + (b2/(2*c2)) + (b3/(2*c3))) / ...
         ((1/(2*c2)) + (1/(2*c3)));

P2 = (lambda - b2) / (2*c2);
P3 = (lambda - b3) / (2*c3);
disp(P1);
disp(lambda);
disp(P2);
disp(P3);