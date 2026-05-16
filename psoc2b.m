zprimary=[1 1 0 0.2
          2 2 1 0.8
          3 1 3 0.4
          4 2 0 0.4
          5 2 3 0.4];
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