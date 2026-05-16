clc;
clear all;
pm = input('Generator output power in p.u. Pm=');
E  = input('Generator emf in p.u. E=');
V  = input('Infinite bus bar voltage V=');
X1 = input('Reactance before fault in p.u. X1=');
X2 = input('Reactance during fault in p.u. X2=');
X3 = input('Reactance after fault in p.u. X3=');
H  = input('Inertia constant H=');
pe1max = E*V/X1;
pe2max = E*V/X2;
pe3max = E*V/X3;
do = asin(pm/pe1max);
dmax = pi - asin(pm/pe3max);
cosdc = (pm*(dmax-do) + pe3max*cos(dmax) - pe2max*cos(do)) / (pe3max-pe2max);
dc = acos(cosdc);
do = do*180/pi;
dmax = dmax*180/pi;
dc = dc*180/pi;
dor = do*pi/180;
dcr = dc*pi/180;
tc = sqrt(2*H*(dcr-dor)/(pi*60*pm));
fprintf('\nInitial power angle = %7.3f\n', do);
fprintf('\nMaximum angle swing = %7.3f\n', dmax);
fprintf('\nCritical clearing angle = %7.3f\n', dc);
fprintf('\nCritical clearing time = %f\n\n', tc);

delta = 0:1:180;
deltar = delta*pi/180;

pe1 = pe1max*sin(deltar);
pe2 = pe2max*sin(deltar);
pe3 = pe3max*sin(deltar);

figure

plot(delta,pe1,'b','LineWidth',2)
hold on
plot(delta,pe2,'r','LineWidth',2)
plot(delta,pe3,'g','LineWidth',2)

xlabel('Power Angle (degree)')
ylabel('Electrical Power Pe')
title('Power Angle Curves (Before, During, After Fault)')
legend('Before Fault','During Fault','After Fault')
grid on
hold off