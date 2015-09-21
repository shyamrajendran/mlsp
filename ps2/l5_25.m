N = 1000;
randX = randn(1,N);
x1 = normrnd(randX,1);
y1 = normrnd(randX,1);
X = [x1;y1]

% xscalemin = min(XV)-1;
% xscalemax = max(XV)+1;
% yscalemax = max(YV)+5;
% yscalemin = min(YV)-5;
% h=scatter(XV,YV);axis([xscalemin xscalemax yscalemin yscalemax]);
% subplot(1,2,1);



% Xt = transpose(X);
cov_x = cov(X.');
 
[U,S,V] = svd(cov_x);

R = U*X;
x_plot = R(1,:);
y_plot = R(2,:);
% subplot(1,2,2);


figure,scatter(x1,y1);
hold on 
plot(U(:,1));
plot(U(:,2));
hold off;
figure,scatter(x_plot,y_plot);
