clear all;
zprimary=[1 1 0 0.05
          2 2 1 0.75
          3 1 3 0.3
          4 2 0 0.075
          5 2 3 0.45];
[elements columns]=size(zprimary); 
zbus=[];
currentbusno=0
for count=1:elements
    [rows cols]=size(zbus);
    from=zprimary(count,2);
    to=zprimary(count,3);
    value=zprimary(count,4);
    p=min(from,to);
    q=max(from,to);
    if q>currentbusno && p==0
        zbus=[zbus zeros(rows,1) 
            zeros(1,cols) value]
        currentbusno=q;
        continue
    end
    if q>currentbusno&&p~=0 
        zbus=[zbus zbus(:,p)
            zbus(p,:) value+zbus(p,p)] 
        currentbusno=q;
        continue
    end
    if q<=currentbusno&&p==0 
        zbus=zbus-1/(zbus(q,q)+value)*zbus(:,q)*zbus(q,:) 
        continue
    end
    if q<=currentbusno &&p~=0 
        zbus=zbus-1/(zbus(p,p)+value+zbus(q,q)-2*zbus(p,q))* ((zbus(:,q)-zbus(:,p))*((zbus(q,:)-zbus(p,:))))
        continue
    end
end
Z = zbus

f = input('Enter the fault bus No : ');
Zf = input('Enter the value of fault Bus impedance : ');
Vpf = 1;
for i = 1:3   % fault current
    If(i) = Vpf / (Z(i,i) + Zf);
    fprintf('The Magnitude of current in Bus %g = %g in pu \n', f, abs(If(i)));
end
for i = 1:3
    V(i) = Vpf - (If(i)*(Z(i,f) + Zf));
    fprintf('The Magnitude of voltage in Bus %g = %g in pu \n', i, V(i));
end
% Ifb = imag(If);
% fprintf('The value of fault line current in Bus %g = %g \n', f, If(i));