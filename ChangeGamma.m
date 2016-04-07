% For increase gamma g>1.0 && For decrease gamma g<1.0
function[ans] = ChangeGamma(x, g)
x = double(x);
g = double(g);
ans = 255*((x/255)^(1/g));
end