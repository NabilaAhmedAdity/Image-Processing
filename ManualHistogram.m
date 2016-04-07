im = imread('lena.jpg');
img = rgb2gray(im);

hist = uint16(zeros(1,256));

tr = 512;
tc = 512;

i=1;
while(i<=tr)
    j=1;
    while(j<=tc)
        v = img(i,j) + 1;
        hist(v) = hist(v)+1;
        j = j+1;
    end;
    i = i+1;
end;

plot(hist);

% parcentage error
hist1 = imhist(img);
dif = 0;

i=1;
while(i<=256)
    dif = dif+abs(hist(i)-hist1(i));
    i = i+1;
end;

% Image where only a peticular pixel is highlighted.
im1 = uint8(zeros(size(img)));
tr = 512;
tc = 512;

i=1;
while(i<=tr)
    j=1;
    while(j<=tc)
        if(img(i,j) == 156)
            im1(i,j) = 0;
        else
            im1(i,j) = 255;
        end;
        j = j+1;
    end;
    i = i+1;
end;
imshow(im1);

