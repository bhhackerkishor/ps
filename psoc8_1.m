clc;
clear all;
E =1.35;
V = 1;
H = 9.94;
X = 0.65;
Pm =0.6;
dp =0.2;
fO =60;
D =0.138;

Pmax = E*V/X, dO = asin(Pm/Pmax) % Max. power
Ps = Pmax*cos(dO) % Synchronizing power coefficient
wn = sqrt(pi*60/H*Ps) % Undamped frequency of oscillation
z = D/2*sqrt(pi*60/(H*Ps)) % Damping ratio
wd=wn*sqrt(1-z^2), fd=wd/(2*pi) %Damped frequency oscillation
tau =1/(z*wn) % Time constant
th = acos(z)*180/pi % Phase angle theta

t=0:0.01:3;

Dd=((180*fO*dp)/(H*wn^2))*(1-(exp(-z*wn*t)/sqrt(1-z^2)).*sin(wd*t+th*pi/180));
d = (dO*180/pi+Dd);

Dw = (pi*fO*dp)/((H*wn)*sqrt(1-z^2))*exp(-z*wn*t).*sin(wd*t);
f = fO + Dw/(2*pi);
subplot(2,1,1),plot(t,(real(d)+imag(d))),grid
xlabel('t sec'),ylabel('Delta Degree')

subplot(2,1,2),plot(t,(real(f)+imag(f))),grid
xlabel('t sec'),ylabel('frequency Hz')