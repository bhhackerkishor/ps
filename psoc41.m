disp(' Newton - Raphson Method ');
clear;
clear all;

n=input('No of buses:');
l=input('No of lines:');
s=input('Enter Impedance 1 or Admittance 2:');

for i=1:l
a=input('Starting bus:');
b=input('Ending bus:');
t=input('Impedance/Admittance value:');
if s==1
y(a,b)=1/t;
else
y(a,b)=t;
end
y(b,a)=y(a,b);
end

ybus=zeros(n,n);
for i=1:n
for j=1:n
if i==j
for k=1:n
ybus(i,j)=ybus(i,j)+y(i,k);
end
else
ybus(i,j)=-y(i,j);
end
ybus(j,i)=ybus(i,j);
end
end

disp(ybus);

y=abs(ybus);t=angle(ybus);
iter=0;
d=[0;0;0];
v=[1.05;1.0;1.04];
ps=[-4;2];
qs=-2.5
pwracur=0.000025;%power accuracy
dc=10;%set the maximum power residual to a high value

while max(abs(dc))>pwracur
iter=iter+1

p=[v(2)*v(1)*y(2,1)*cos(t(2,1)-d(2)+d(1))+v(2)^2*y(2,2)*cos(t(2,2))+v(2)*v(3)*y(2,3)*cos(t(2,3)-d(2)+d(3));
  v(3)*v(1)*y(3,1)*cos(t(3,1)-d(3)+d(1))+v(3)^2*y(3,3)*cos(t(3,3))+v(3)*v(2)*y(3,2)*cos(t(3,2)-d(3)+d(2))];

q=-v(2)*v(1)*y(2,1)*sin(t(2,1)-d(2)+d(1))-(v(2)^2)*y(2,2)*sin(t(2,2))-v(2)*v(3)*y(2,3)*sin(t(2,3)-d(2)+d(3));

j(1,1)=v(2)*v(1)*y(2,1)*sin(t(2,1)-d(2)+d(1))+v(2)*v(3)*y(2,3)*sin(t(2,3)-d(2)+d(3));
j(1,2)=-v(2)*v(3)*y(2,3)*sin(t(2,3)-d(2)+d(3));
j(1,3)=v(1)*y(2,1)*cos(t(2,1)-d(2)+d(1))+2*v(2)*y(2,2)*cos(t(2,2))+v(3)*y(2,3)*cos(t(2,3)-d(2)+d(3));

j(2,1)=-v(3)*v(2)*y(3,2)*sin(t(3,2)-d(3)+d(2));
j(2,2)=v(3)*v(1)*y(3,1)*sin(t(3,1)-d(3)+d(1))+v(3)*v(2)*y(3,2)*sin(t(3,2)-d(3)+d(2));
j(2,3)=v(3)*y(2,3)*cos(t(3,2)-d(3)+d(2));

j(3,1)=v(2)*v(1)*y(2,1)*cos(t(2,1)-d(2)+d(1))+v(2)*v(3)*y(2,3)*cos(t(2,3)-d(2)+d(3));
j(3,2)=-v(2)*v(3)*y(2,3)*cos(t(3,2)-d(2)+d(3));
j(3,3)=-v(1)*y(2,1)*sin(t(2,1)-d(2)+d(1))-2*v(2)*y(2,2)*sin(t(2,2))-v(3)*y(2,3)*sin(t(2,3)-d(2)+d(3));

dp=ps-p;
dq=qs-q;

dc=[dp;dq]
j
dx=j\dc

d(2)=d(2)+dx(1);
d(3)=d(3)+dx(2);
v(2)=v(2)+dx(3);

v,d*(180/3.14)

end

pl=[(v(1)^2)*y(1,1)*cos(t(1,1))+v(1)*v(2)*y(1,2)*cos(t(1,2)-d(1)+d(2))+v(1)*v(3)*y(1,3)*cos(t(1,3)-d(1)+d(3))];
q1=-(v(1)^2)*y(1,1)*sin(t(1,1))-v(1)*v(2)*y(1,2)*sin(t(1,2)-d(1)+d(2))-v(1)*v(3)*y(1,3)*sin(t(1,3)-d(1)+d(3));
q3=-v(3)*v(1)*y(3,1)*sin(t(3,1)-d(3)+d(1))-v(3)*v(2)*y(3,2)*sin(t(3,2)-d(3)+d(2))-v(3)^2*y(3,3)*sin(t(3,3));

pl
q1
q3