function[ans] = DecreaseBrightness(x,g)
if(x-g < 0)
    ans = 0;
else
    ans = x-g;
end;
end