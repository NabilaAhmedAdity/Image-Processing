function[ans] = ProbabilityDistribution(im)
[tr,tc,K] = size(im);
hist = uint16(zeros(K,256));

i=1;
while(i<=tr)
    j=1;
    while(j<=tc)
        k=1;
        while(k<=K)
           v = im(i,j,k) + 1;
           hist(k,v) = hist(k,v)+1;
           k=k+1;
        end;
        j = j+1;
    end;
    i = i+1;
end;

plot(hist(3,:));

probDensity = size(hist);

i=1;
while(i<=256)
    k=1;
    while(k<=K)
       probDensity(k,i) = double(hist(k,i))/double(tr*tc);
       k = k+1;
    end;
    i=i+1;
end;

probDistribution = size(hist);

k=1;
while(k<=K)
    probDistribution(k,1) = probDensity(k,1);
    i=2;
    while(i<=256)
        probDistribution(k,i) = probDensity(k,i)+probDistribution(k,i-1);
        i=i+1;
    end;
    k=k+1;
end;

ans = size(hist);
ans = probDistribution;
end