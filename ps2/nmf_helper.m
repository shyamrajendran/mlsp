function [output,W,H,N] = nmf_helper(X,W,H,N,errorrate)
[rW, cW] = size(W);
[rH, cH] = size(H);
for loop = 1:N
    WH = W*H;
    old = WH;
    for i = 1:rW
        for j = 1:cW
            sum = 0;
            for k = 1:cH
                sum = sum + (X(i,k)+1)/(WH(i,k)+1)*H(j,k);
            end
            W(i,j) = W(i,j) * sum;
        end
    end
    for j = 1:rH
        for k = 1:cH
            sum = 0;
            for i = 1:rW
                sum = sum + W(i,j)*((X(i,k)+1)/(WH(i,k)+1));
            end
            H(j,k) = H(j,k) * sum;
        end
    end
    new = W*H;
    converge(old,new,errorrate)
    if (converge(old,new,errorrate) == 1)
        break
    end
end
output = WH;
W;
H;
end