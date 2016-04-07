function[ans] = MedianFilter(im,sf)

[tr,tc,K] = size(im);

hsf = floor(sf/2);
start = -1*(hsf);
finish = hsf;

ssf = sf*sf;
ini = uint8(zeros(1,ssf));
for i = 1:ssf
    ini(i) = 255;
end;

newim = uint8(zeros(size(im)));

k=1;
while(k<=K)
    i=1;
    while(i<=tr)
        j=1;
        while(j<=tc)
            c=0;
            arr = ini;
            for x = start:finish
                for y = start:finish
                    nr = i+x;
                    nc = j+y;
                    if(nr>0 && nr<=tr && nc>0 && nc<=tc)
                        c = c+1;
                        arr(c) = im(nr,nc,k);
                    end;
                end;
            end;
            arrs = sort(arr);
            mid = floor((c+1)/2);
            r = rem(c,2);
            if(r == 0)
                v = floor(arrs(mid)/2+arrs(mid+1)/2);
            else
                v = arrs(mid);
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