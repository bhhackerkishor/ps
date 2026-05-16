clc;
clear all:
E = input('generator emf in P.U E=');
V = input('infinite bus bar voltage V=');
H= input('inertia constant H=');
X = input('Reactance in p.u. X=');
Pm = input('Generator output power in p.u. Pm=');
dp = input('change in output power in p.u. dp=');
fO = input('initial frequency fO=');
D = input(' damping coefficient D=');
Pmax = E*V/X, dO = asin(Pm/Pmax)
Ps = Pmax*cos(dO)
wn = sqrt(pi*60/H*Ps)
z = D/2*sqrt(pi*60/(H*Ps))
wd=wn*sqrt(1-z^2), fd=wd/(2*pi)
tau =1/(z*wn)
th = acos(z)*180/pi
t=0:0.01:3;
Dd=((180*fO*dp)/(H*wn*wn))*(1-(sqrt(1-z-2)*exp(-z*wn*t).*sin(wd*t+ th)));
d = (dO*180/pi+Dd);
Dw= ((pi*fO*dp)/H*wn*sqrt(1-z-2)*exp(-z*wn*t).*sin(wd*t));
f= fO +Dw/(2*pi);
subplot(2,1,1),plot(t,(real(d)+imag(d))),grid
xlabel('t sec'),ylabel('Delta Degree')
subplot(2,1,2),plot(t,(real(f)+imag(f))),grid
xlabel('t sec'),ylabel('frequency Hz'),subplot(111)
