load faces.mat;
%%% finding mean face
[H,V] = size(X);
mean_face_vector = sum(X,2) / V;
mean_face = reshape(mean_face_vector,M,N);
% figure,imagesc(mean_face),colormap(bone);

for i = 1:V
    X(:,i) = X(:,i) - mean_face_vector;
end


cov_x = cov(X.');
[U,S,V] = svd(cov_x);



%%% for k =  50
k = 50;
U50 = U(:,1:k);
U50T = U50.';
size(U50T)
W = U50T*X;
figure
recoveredFaces = U50T.' * W;
size(recoveredFaces)
approxFace = reshape(recoveredFaces(:,11),M,N);
subplot(1,6,3)
figure,imagesc(approxFace+mean_face),colormap(bone)

%%% for k =  10
k = 10;
U = U(:,1:k);
U = U.';
size(U)
W = U*X;


recoveredFaces = U.' * W;
size(recoveredFaces)
approxFace = reshape(recoveredFaces(:,11),M,N);
% subplot(1,6,6)
figure,imagesc(approxFace+mean_face),colormap(bone)


