function[ans] = Ix(im,t)

[tr,tc,K] = size(im);
nim = im;

k = 1;
while(k<=K)
    i = 2;
    while(i<tr)
        j = 1;
        while(j<=tc)
            if(t==0)
               nim(i,j,k) = im(i+1,j,k) - im(i,j,k);
            end;
            if(t==1)
               nim(i,j,k) = floor((im(i+1,j,k) + im(i-1,j,k))/2);
            end;
            if(t==2)
               nim(i,j,k) = im(i,j,k) - im(i-1,j,k);
            end;
            j=j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = nim;
end