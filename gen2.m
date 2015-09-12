function I = gen2(s)
I = zeros(s);
n = s;
for m = 1:s
    I(m,n) = 1;
    n = n-1;
end
I;
end
        