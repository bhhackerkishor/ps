clear all;
r=input('Resistance in per ohm/Km :');
L=input('Inductances in per H/Km :');
C=input('Capacitance in per F/Km :');
pf=input('powerfactor of the receving end :');
pr=input('power to the receving end :');
f=input('the line frequency :');
vr=input('voltage at receving end :');
l=input('length of the transmission line:');
R=r*l;
X1=(2*pi*f*L*l);
Yc=(2*pi*f*C*l);
Z=(R+(X1*j));
Ir=(pr/((3)^(1/2)*vr*pf));
vrp=(vr/(3)^(1/2));
VR=vrp;
d=sin(acos(pf));
IR=Ir*(pf-(d*j));
abs(IR);
IC1=vrp*((Yc/2)*j);
IL=IR+IC1;
VS=vrp+(IL*Z);
Vm=abs(VS);
Vp=rad2deg(angle(VS));
IC2=(VS*((Yc/2)*j));
IS=IL+IC2;
Ip=rad2deg(angle(IS));
Is=abs(IS);
pfs=Vp-Ip;
Ps=3*Vm*Is*cosd(pfs);
reg=(((Vm-vrp)/vrp)*100);
eff=((pr/Ps)*100);
Vm
Is 
reg 
eff
Ps