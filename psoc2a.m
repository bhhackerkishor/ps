n=input('Enter number of buses :');
l=input('Number of lines :');
s=input('1.Impedence or 2: Admitance :');
ybus=zeros(n,n);
lc=zeros(n,n);
for i=1:l
a=input('Starting bus :');
b=input('Ending bus :');
t=input('Series line Impedance of line :');
lca=input('Line charging admittance :');
if(s==1)
y(a,b)=1/t;
else
y(a,b)=t;
end
y(b,a)=y(a,b);
lc(a,b)=lca;
lc(b,a)=lc(a,b);
end
for i=1:n
for j=1:n
if i==j
for k=1:n
ybus(i,j)=ybus(i,j)+y(i,k)+lc(i,k)/2;
end
else
ybus(i,j)=-y(i,j);
end
ybus(j,i)=ybus(i,j);
end
end
ybus