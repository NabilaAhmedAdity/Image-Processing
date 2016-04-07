im = imread('Board.tif');

maskI = [-1,0,1; -2,0,2; -1,0,1];
maskY = [-1,-2,-1; 0 0 0; 1,2,1];

[tr,tc,K] = size(im);
IX = uint8(size(im));
IY = uint8(size(im));
mag = size(im);
tan = size(im);
norm = size(im);
thres = uint8(size(im));

IX = Ix(im,2);
IY = Iy(im,2);
mag = Magnitude(IX,IY);
tan = Tangent(IX,IY);
norm = Normalize(mag,150);
thres = Threshold(norm,0.6);
imshow(thres);



