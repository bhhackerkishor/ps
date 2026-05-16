clear all:
disp('Calculation of Inductance of 3 phase double circuit:');
r=2.5
radius=r*10^(-2);
d=4
r1=radius*0.7788;
L=10^(-7)*reallog((3)^(.5)*d/(2*r1));
C=(4*pi*8.854*10^(-12))/reallog((3)^(0.5)*d/(2*radius));
disp('Inductance in H/m:');
disp(L)
disp('Capacitance in F/m:');
disp(C)