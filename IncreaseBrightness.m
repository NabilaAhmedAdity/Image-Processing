function[ans] = IncreaseBrightness(x,g)
if(x+g < 256)
    ans = x+g;
else if(x+g > 255)
    ans = 255;
end;
end