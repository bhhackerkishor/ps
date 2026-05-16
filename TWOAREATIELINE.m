clear all;
clc;
pr1=input('Enter the value of Related area capacity-1 in MVA:');
delpd1=input('Enter the value of change in load area 1 in MW:');
D1=input('Enter the value of Damping coefficient-1 in pu:');
R1=input('Enter the value of Speed regulation-1 in pu:');
pr2=input('Enter the value of Related area capacity-2 in MW:');
delpd2=input('Enter the value of change in load-2 area in MW:');
D2=input('Enter the value of Damping Coefficient-2 in pu:');
R2=input('Enter the value of Speed regulation-2 in pu:');
f0=input('Enter the value of frequency in Hz:');
base=input('Enter the common base value in MW:');
delpd1=delpd1/base;
delpd2=delpd2/base;
B1=(D1+(1/R1));
B2=(D2+(1/R2));
a12=(pr1/pr2);
delf=-((a12*delpd1)+delpd2)/((a12*B1)+B2);
delf1=delf*f0;
f=f0+delf1;
delptie=((B1*delpd2)-(B2*delpd1))/(B2+(a12*B1));
delptie=delptie*pr2;
disp('Steady state frequency deviation in pu is');
delf
disp('Steady state frequency deviation in Hz is');
delf1
disp('System frequency');
f
disp('Change in tie line flow');
delptie
