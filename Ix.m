%t=0 forward difference
%t=1 center difference
%t=2 backword difference
function[ans] = Ix(im, t)

[tr,tc,K] = size(im);
nim = im;

k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 2;
        while(j<tc)
            if(t == 0)
               nim(i,j,k) = im(i,j+1,k) - im(i,j,k);
            end;
            if(t == 1)
               nim(i,j,k) = floor((im(i,j+1,k) + im(i,j-1,k))/2);
            end;
            if(t == 2)
               nim(i,j,k) = im(i,j,k) - im(i,j-1,k);
            end;
            j=j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = nim;
end