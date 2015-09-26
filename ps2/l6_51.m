clearvars;
FigHandle = figure('name','lecture 5 - 25','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 1000, 500]);
file = 'hands.mp4';
v = VideoReader(file);
i = 1;

while hasFrame(v)
    frame = readFrame(v);
    video(:,i) = frame(:);
    i = i + 1;
end

% taking PCA 
X = double(video);
size(video)
[U,D] = eigs(cov(X.'));

size(X)
U = U(:,1:3);
UT = U.';
Z = UT*X;



subplot(2,3,1)
ut = reshape(U(:,1),60,80,3);
imagesc(ut*240),colormap bone

subplot(2,3,2)
ut = reshape(U(:,2),60,80,3);
imagesc(ut*240),colormap bone

subplot(2,3,3)
ut = reshape(U(:,3),60,80,3);
imagesc(ut*240),colormap bone

figure
plot(Z(1,:))
hold on
plot(Z(2,:))
hold on
plot(Z(3,:))
hold off


