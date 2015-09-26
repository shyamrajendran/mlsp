function I = l7_36(s,v)
load('cities.mat');

% in = [1,2,3;4,5,6;7,8,9]
in = D;
[r,c] = size(in);
for i = 1:r
    sum = 0;
    for j = 1:c
        sum = sum + in(i,j);
    end
    avg = sum/c;
    avg
    for j = 1:c
        in(i,j) = in(i,j)-avg; 
    end
    avg = 0;
end

for j = 1:c
    sum = 0;
    for i = 1:r
        sum = sum + in(i,j);
    end
    avg = sum/r;
    for i = 1:r
        in(i,j) = in(i,j)-avg; 
    end
end
in

[U,S,V] = svd(cov(in));
% taking only top 3 components 
U = U(:,1:3);
Z = U.'*in;
X1 = Z(1,:);
Y1 = Z(2,:);
Z1 = Z(3,:);
size(Z1)
% scatter3(X1,Y1,Z1);
% figure,
% labels = rand(18);
plot3(Y1,Z1,X1,'ro');
% celldata = cellstr(labels)
% text(X1,Y1,Z1,labels)


% size(S)
% size(U)
% size(V)
% 
% 
% 
end