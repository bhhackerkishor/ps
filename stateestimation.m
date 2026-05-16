clc;
clear all;

global nbus;
global nlines;

nbus = input('Enter the number of buses:');
nlines = input('Enter the number of lines:');

X12 = input('Enter the reactance between bus 1 and bus 2:');
X13 = input('Enter the reactance between bus 1 and bus 3:');
X23 = input('Enter the reactance between bus 2 and bus 3:');

% H matrix
H = [5  -5
     2.5  0
     0  -4];

% covariance matrix
R = [0.0001  0       0
     0       0.0001  0
     0       0       0.0001];

z1 = input('Enter the measured value 1 in pu:');
z2 = input('Enter the measured value 2 in pu:');
z3 = input('Enter the measured value 3 in pu:');

% Measurement vector
Z = [z1
     z2
     z3];

Htrans = H'
Y1 = inv(R)

A = Htrans * Y1
B = Z

C = A * B
E = A * H

Y2 = inv(E)

Xestimate = Y2 * C;
disp(Xestimate)

theta1 = Xestimate(1,:);
theta2 = Xestimate(2,:);

f1 = (5 * theta1) - (5 * theta2);
f2 = 2.5 * theta1;
f3 = -4 * theta2;

f = [f1
     f2
     f3]

J = ((z1 - f1)^2 / 0.0001) + ((z2 - f2)^2 / 0.0001) + ((z3 - f3)^2 / 0.0001)