function[ans] = ContrastStretch(x, mi, Mi, mj, Mj)
ans = (Mj-mj)*((x-mi)/(Mi-mi))+mj;
end