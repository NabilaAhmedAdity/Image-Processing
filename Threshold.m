function[ans] = Threshold(norm, kk)

[tr,tc,K] = size(norm);
thres = uint8(size(norm));

k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            if(norm(i,j,k) >= kk)
                thres(i,j,k) = 0;
            else
                thres(i,j,k) = 255;
            end;
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = thres;

end