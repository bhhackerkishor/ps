clc;

zpositive=input('Enter the value of the positive sequence impedance:');
znegative=input('Enter the value of the negative sequence impedance:');
zzero=input('Enter the value of the zero sequence impedance:');
zf=input('Enter the fault impedance value');
v=input('Enter the bus voltage');

j=sqrt(-1);

% one line fault
Ifl1=(v/(j*zpositive+j*znegative+j*zf));
disp('line to line fault current')
Ifl1

% double line to ground fault
% positive sequence current
disp('doubleline to ground fault')
I1=((v)/(j*zpositive+((j*zpositive*(j*zzero+3*j*zf))/(j*zpositive+j*zzero+j*3*zf))));
disp('positive sequence fault current')
I1

% negative sequence current
I2=(((v)-(j*zpositive*I1))/(j*znegative));
disp('negative sequence fault current')
I2

% zero sequence current
I0=(((v)-(j*zpositive*I1))/(j*zzero+j*3*zf));
disp('zero sequence fault current')
I0