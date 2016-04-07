function[ans] = Tangent(IX,IY)

[tr,tc,K] = size(IX);
tan = size(IX);

k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            x = double(IX(i,j,k));
            y = double(IY(i,j,k));
            tan(i,j,k) = atan(y/x);
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = tan;
end