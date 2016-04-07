function[ans] = IncreaseContrast(x,a)  % a>1.0
T = a*abs(x-127)+127;
if(T < 0)
    ans = 0;
else if(T <= 255)
    ans = T;
else
    ans = 255
end;
end