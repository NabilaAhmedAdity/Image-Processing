function[ans] = GaussianMask(sf)
sigma=1;
fsize=sf;
H = zeros(fsize);

for i = 1:fsize
    for j = 1: fsize
        H(i,j)=(double(1)/(2*pi*sigma))*exp(-((i-ceil(fsize/2))^2+(j-ceil(fsize/2))^2)/(2*sigma^2));
    
    end;
end;

ans = H;

end