A = [1,2,3;4,5,6;7,8,9];
A(:,:,2) = [11,22,33;44,55,66;77,88,99];
A(:,:,3) = [111,222,333;444,555,666;777,888,999];
[H,V,P] = size(A);
diagI = diag([1,0,1]);
kronValue = kron(kron(diagI,eye(H)),eye(V));
% size(kronValue);
vecA = A(:);
% size(vecA);
final_vec = double(kronValue)*double(vecA);
final_A = reshape(final_vec,H,V,P);
A
final_A