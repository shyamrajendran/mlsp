function [output] = fourierMatrix(n)
sqrtn = sqrt(n);
output = zeros(n);
for j = 1:n
    for k = 1:n
           t = j*k*2*pi/n;
           output(i,j) = cos(t)+1j*sin(t))/sqrtn;
    end
end


end