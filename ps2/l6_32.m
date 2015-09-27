load faces.mat;

FigHandle = figure('name','lecture 5 - 25','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 1000, 500]);

[M,N] = size(X);


%taking pca
cov_x = cov(X.');
[U,S,V] = svd(cov_x);
size(U);
PCA_eigen = U;

for i = 1:16
    subplot(4,4,i);
    img = reshape(PCA_eigen(:,i),30,26);
    imagesc(img),colormap(bone);axis off;
end


W = U(:,1:16).';
Z = W*X;
X = Z;
W = rand(16);
D = eye(16);

alpha = 1e-16;
delta = 0.00001;
for i = 1:1000000
    disp(i);
    y = W*X;
    old = W;
    fy = y.^3;
    dW = (D*N - fy*(y.')) * W/N;
    W = W + alpha * dW;
    new = W;
    if(converge(old, new, delta))
        disp('convered');
        break;
    end    
end
op = U(:,1:16)*W;
size(op)
figure
for i = 1:16
   subplot(4,4,i);
   img = reshape(op(:,i),30,26);
   imagesc(img),colormap(bone);axis off;
end


