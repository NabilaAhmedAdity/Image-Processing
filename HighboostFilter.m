function[ans] = HighboostFilter(im,kk)
[tr,tc,K] = size(im);

gausMask = GaussianMask(3);

blurrim = uint8(size(im));
blurrim = ApplyFilter(im,gausMask);

unsharpMask = size(im);
k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            unsharpMask(i,j,k) = im(i,j,k) - blurrim(i,j,k);
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

highboostim = uint8(size(im));
k = 1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            highboostim(i,j,k) = im(i,j,k) + (kk*unsharpMask(i,j,k));
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = highboostim;
end
