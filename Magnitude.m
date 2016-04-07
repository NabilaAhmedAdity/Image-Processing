function[ans] = Magnitude(IX,IY)

[tr,tc,K] = size(IX);
mag = size(IX);

k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            x = double(IX(i,j,k));
            y = double(IY(i,j,k));
            mag(i,j,k) = sqrt(x*x + y*y);
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = mag;
end