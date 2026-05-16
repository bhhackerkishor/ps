clear;
l=250
z=0.05+0.7i
y=7i*10^-6
Z1=z*l;
Y1=y*l;
m=input('Enter the type of network: 1.Nominal T 2.Nominal Pi ');
switch m
    case {1}
        A=1+(Z1*Y1/2);
        B=Z1*(1+(Z1*Y1/4));
        C=Y1;
        D=A;
    otherwise
        A=1+(Z1*Y1/2);
        B=Z1;
        C=Y1*(1+(Z1*Y1/4));
        D=A;
end
n=abs(A);
m=rad2deg(angle(A));
o=abs(B);
p=rad2deg(angle(B));
q=abs(C);
r=rad2deg(angle(C));
fprintf('A = %g at %g degree \n',n,m);
fprintf('B = %g at %g degree \n',o,p);
fprintf('C=%g at %g degree \n',q,r);
fprintf('D=%g at %g degree \n',n,m);