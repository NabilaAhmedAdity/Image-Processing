im = imread('lena.jpg');

%On color image by average technique
ds1 = uint8(zeros(256,256,3));

for c = 1:3
    i=2;
    while(i<=512)
        j=2;
        while(j<=512)
            v = (im(i-1,j-1,c)+im(i,j-1,c)+im(i-1,j,c)+im(i,j,c))/4;
            I=i/2; J=j/2;
            ds1(I,J,c) = uint8(v);
            j = j+2;
        end;
        i=i+2;
    end;
end;

%On color imgae by median technique
ds2 = uint8(zeros(256,256,3));

for c = 1:3
    i=2;
    while(i<=512)
        j=2;
        while(j<=512)
            arr = [im(i-1,j-1,c),im(i,j-1,c),im(i-1,j,c),im(i,j,c)];
            arr = sort(arr);
            v = (arr(2)+arr(3))/2;
            I=i/2; J=j/2;
            ds2(I,J,c) = uint8(v);
            j = j+2;
        end;
        i=i+2;
    end;
end;

imwrite(ds2,'downsample.jpg');
imshow(ds2);

% Up sampling by the median technique
dr = 256;
dc = 256;
ur = 512;
uc = 512;
us = uint8(zeros(ur,uc,3));

c=1;
while(c<=3)
    i=1;
    while(i<=dr)
        j=1;
        while(j<=dc)
            v = ds2(i,j,c);
            us(2*i-1,2*j-1,c) = v;
            us(2*i-1,2*j,c) = v;
            us(2*i,2*j-1,c) = v;
            us(2*i,2*j,c) = v;
            j = j+1;
        end;
        i=i+1;
    end;
    c = c+1;
end;

imwrite(us,'upsample.jpg');
imshow(us);

% Percentage error between upsample(us) and orginal image
dif = 0;

c=1;
while(c<=3)
    i=1;
    while(i<=ur)
        j=1;
        while(j<=uc)
            if(us(i,j,c) ~= im(i,j,c))
                dif = dif+1;
            end;
            j = j+1;
        end;
        i=i+1;
    end;
    c = c+1;
end;

