function[ans] = ImageSharpening(im)
[tr,tc,K] = size(im);

laplaceMask = [1,1,1;1,-8,1;1,1,1];
nim = uint8(size(im));
nim = ApplyFilter(im,laplaceMask);

nim1 = uint8(size(im));

k=1;
while(k<=K)
    i = 1;
    while(i<=tr)
        j = 1;
        while(j<=tc)
            nim1(i,j,k) = im(i,j,k) + nim(i,j,k);
            j = j+1;
        end;
        i = i+1;
    end;
    k = k+1;
end;

ans = nim1;
end