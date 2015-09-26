load faces.mat;
cov_x = cov(X.');
[U,S,V] = svd(cov_x);
figure
for i = 1:36
    subplot(6,6,i);
    img = reshape(U(:,i),M,N);
    imagesc(img),colormap(bone);axis off;
end

    


