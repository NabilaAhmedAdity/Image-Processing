function[ans] = LUT(x,a)
x = double(x);
a = double(a);
ans = floor(255 / (1+exp(-a*(x-127)/32)));
end