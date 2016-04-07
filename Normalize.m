function[ans] = Normalize(mag, kk)

[tr,tc,K] = size(mag);
norm = size(mag);

k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            norm(i,j,k) = mag(i,j,k)/kk;
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = norm;

end