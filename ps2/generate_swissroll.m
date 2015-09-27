
% function [o] = generate_swissroll(N, data)
N = 1000;
t = rand(1,N);
t = sort(4*pi*sqrt(t))'; 
z = 8*pi*rand(N,1); % random heights
x = (t+.1).*cos(t);
y = (t+.1).*sin(t);
data = [x,y,z];

cmap = jet(N);
scatter3(x,y,z,20,cmap);
title('Original data');


W = zeros(N);
sigma = 100;
for i = 1:N
    for j = 1:N
        d1 = (x(i)-x(j)).^2;
        d2 = (y(i)-y(j)).^2;
        d3 = (z(i)-z(j)).^2;
        d = d1+d2+d3;
        e = exp((-1*d)/sigma);
        W(i,j) = e;    
    end
end
imagesc(W);colormap gray;
tw = zeros(N);
for i = 1:N
    [sort_data, sort_index] = sort(W(i,:),'descend');
    max_index1 = sort_index(1,2);
    max_index2 = sort_index(1,3);
    tw(i,max_index1) = sort_data(1,2);
    tw(i,max_index2) = sort_data(1,3);
end
figure,
imagesc(tw);


onet = ones(N,1).';
rs = onet*tw;
D = diag(rs);
L = tw - D;
for i = 1:N
    if (rs(1,i) ~= 0) 
        rs(1,i) = rs(1,i).^(-0.5);
    end
end

D1 = diag(rs);
Lchandra = (D1*L*D1);
figure,imagesc(Lchandra);
[v,d] = eigs(Lchandra);

% end