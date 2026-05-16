P1=0.2;
Ki=7;
num=[0.1 0.7 1 0];
den=[1 7.08 10.56 20.8 Ki];
t=0:0.02:12;
c=-P1*step(num,den,t);
plot(t,c),grid
xlabel('t,sec'),ylabel('Pu')
title('frequency deviation step response');