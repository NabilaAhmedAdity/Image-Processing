function[ans] = IxIyMask(im, mask)
[tr,tc,K] = size(im);
[mr,mc] = size(mask); %mr = mc
sf = mr;

hsf = floor(sf/2);
start = -1*(hsf);
finish = hsf;


newim = uint8(zeros(size(im)));

k=1;
while(k<=K)
    i=1;
    while(i<=tr)
        j=1;
        while(j<=tc)
            v = 0;
            for x = start:finish
                for y = start:finish
                    nr = i+x;
                    nc = j+y;
                    I = x+(hsf+1);
                    J = y+(hsf+1);
                    if(nr>0 && nr<=tr && nc>0 && nc<=tc)
                        v = v + im(nr,nc,k)*mask(I,J);
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