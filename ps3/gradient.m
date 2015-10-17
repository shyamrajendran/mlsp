function [output] = gradient(one)
[R, C] = size(one);
output = zeros(R,C);
for i = 2: (R - 1)
    for j = 2 : (C - 1)
        ydifference = one(i-1, j) - one(i+1, j);
        diffy = ydifference.^2;
        xdifference = one(i, j-1) - one(i, j+1);
        diffx = xdifference.^2;
        output(i,j) = sqrt(diffy + diffx);
    end
end
end
