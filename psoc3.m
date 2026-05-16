n = input('No of Buses: ');
l = input('No of Lines: ');
s = input('Type-1 for Impedance or Type-2 for Admittance: ');
for i = 1:l
    a = input('Starting bus: ');
    b = input('Ending bus: ');
    t = input('Admittance or Impedance value: ');
    if s == 1
        y(a,b) = 1/t;
    else
        y(a,b) = t;
    end
    y(b,a) = y(a,b);
end
ybus = zeros(n,n);
for i = 1:n
    for j = 1:n
        if i == j
            for k = 1:n
                ybus(i,j) = ybus(i,j) + y(i,k);
            end
        else
            ybus(i,j) = -y(i,j);
        end
        ybus(j,i) = ybus(i,j);
    end
end
base = input("Enter the Base Value in MW: ");
v(1) = input("Enter the Magnitude of voltage in the Slack Bus(V1) in p.u: ");
p2 = input("Enter the Real Power of the PQ Bus(P2) in MW: ");
p(2) = -(p2/base);
q2 = input("Enter the Reactive Power of the PQ Bus(Q2) in MVAR: ");
q(2) = -(q2/base)*1j;
p3 = input("Enter the Real Power of the PV Bus(P3) in MW: ");
p(3) = (p3/base);
v(2) = 1 + 0j;
v(3) = input("Enter the Magnitude of voltage in the PV Bus(V3) in p.u: ");
e = 0;
for i = 2
    for k = 1:3
        if i ~= k
            m = ybus(i,k)*v(k);
            e = e + m;
        end
    end
    v(2) = (1/ybus(i,i))*(((p(i)-q(i))/conj(v(i))) - e);
end
magv2 = abs(v(2));
del2 = angle(v(2));
anglev2 = rad2deg(del2);
c = 0;
u = 0;
for i = 3
    for k = 1:i-1
        z = ybus(i,k)*v(k);
        c = c + z;
    end
    for k = i
        f = ybus(i,k)*v(i);
        u = u + f;
    end
    q3 = (v(i)*(c+u));
end
q3 = -imag(q3);
q(3) = q3*1j;
w = 0;
for i = 3
    for k = 1:3
        if i ~= k
            h = ybus(i,k)*v(k);
            w = w + h;
        end
    end
    v(3) = (1/ybus(i,i))*(((p(i)-q(i))/conj(v(i))) - w);
end
v(3);
magv3 = abs(v(3));
del3 = angle(v(3));
anglev3 = rad2deg(del3);
g = 0;
for i = 1
    for k = 1:3
        x = ybus(i,k)*v(k);
        g = g + x;
    end
    power1 = (v(i)*(g));
end
p11 = real(power1);
q11 = -imag(power1);
fprintf("The Real Power in the Slack Bus(P1) = %g in p.u\n", p11);
fprintf("The Reactive Power in the Slack Bus(Q1) = %g in p.u\n", q11);
fprintf("The Magnitude of voltage in PQ Bus(|V2|) = %g in p.u\n", magv2);
fprintf("The Angle of Voltage in the PQ Bus(Del2) = %g in degree\n", anglev2);
fprintf("The Reactive Power in the PV Bus(Q3) = %g in p.u\n", q3);
fprintf("The Angle of Voltage in the PV Bus(Del3) = %g in degree\n", anglev3);