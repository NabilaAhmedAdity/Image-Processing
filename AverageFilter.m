function[ans] = AverageFilter(im,sf)

[tr,tc,K] = size(im);

hsf = floor(sf/2);
start = -1*(hsf);
finish = hsf;

ssf = sf*sf;

newim = uint8(zeros(size(im)));

k=1;
while(k<=K)
    i=1;
    while(i<=tr)
        j=1;
        while(j<=tc)
            c=0;
            v = 0;
            for x = start:finish
                for y = start:finish
                    nr = i+x;
                    nc = j+y;
                    if(nr>0 && nr<=tr && nc>0 && nc<=tc)
                        c = c+1;
                        v = v+floor(im(nr,nc,k)/ssf);
                    end;
                end;
            end;
            newim(i,j,k) = v;
            j = j+1;
        end;
        i = i+1;  
    end;
k = k+1;
end;

ans = newim;

end