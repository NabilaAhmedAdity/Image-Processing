function[ans] = ApplyFilter(im, mask)
[tr,tc,K] = size(im);
[mr,mc] = size(mask); %mr = mc
sf = mr;

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
                    I = x+(hsf+1);
                    J = y+(hsf+1);
                    if(nr>0 && nr<=tr && nc>0 && nc<=tc)
                        c = c+1;
                        %v = v+(floor(im(nr,nc,k)/ssf))*(mask(I,J));
                        v = v + floor((im(nr,nc,k)/ssf)*mask(I,J));
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