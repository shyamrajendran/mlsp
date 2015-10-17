clearvars
load('face2.mat');
% pca on the faces

[R,C ] = size(XX);
% taking average face
average_XX = zeros(780,1);
for i = 1:C
    average_XX = average_XX + XX(:,i);
end
average_XX = average_XX / C;
% figure,imagesc(reshape(average_XX,30,26));colormap gray

% subtract from the given face
for i = 1 : C
    XX(:,i) = XX(:,i) - average_XX;
end


[U,S,V] = svd(cov(XX.'));
% taking first two components
W = U(:,1:2).';
% op
op = W * XX;

% seperate out into two labels
ii = 1;
jj = 1;
for i = 1 : C
    if g(i) == 1
        c1(:,ii) = op(:,i); ii = ii + 1;
    else 
        c2(:,jj) = op(:,i); jj = jj + 1;
    end
end
figure,plot(op(1,:),op(2,:),'b.');
figure,plot(c1(1,:),c1(2,:),'r.');
hold on
plot(c2(1,:),c2(2,:),'b.');

mean1x = mean(c1(1,:));
mean1y = mean(c1(2,:));
u1 = [mean1x ; mean1y];
var1 = myRMS(c1);
w1 = u1 ./ var1;
b1 = -(u1.' * u1 / (2 * var1)) + log(0.5);

mean2x = mean(c2(1,:));
mean2y = mean(c2(2,:));
u2 = [mean2x ; mean2y];
var2 = myRMS(c2);
w2 = u2 ./ var2;
b2 = -(u2.' * u2 / (2 * var2)) + log(0.5);

ii = 0; jj = 0;
for i = 1 : size(c2,2)
    l1 = gfunction(c1(:,i),w1,b1,w2,b2);
    l2 = gfunction(c2(:,i),w1,b1,w2,b2);
    if l1 == 1
        ii = ii + 1;
    else
        jj = jj + 1;
    end
    
    if l2 == 1
        ii = ii + 1;
    else
        jj = jj + 1;
    end
end

% now for the boundary plot
f = @(x1,x2) w1(1)*x1 + w1(2)*x2 - w2(1)*x1 - w2(2)*x2 + b1 - b2;
h2 = ezplot(f,[min(op(1,:)) max(op(1,:)) min(op(2,:)) max(op(2,:))]);
h2.Color = 'g'; h2.LineWidth = 1;

% quadratic Boundary
cov1 = cov(c1.');
invcov1 = inv(cov1);
W1 = invcov1 .* (-0.5);
w1 = invcov1 * u1;
b1 = ((u1.' * w1).*(-0.5)) - (0.5 * log(det(cov1))) + log(0.5);
cov2 = cov(c2.');
invcov2 = inv(cov2);
W2 = invcov2 .* (-0.5);
w2 = invcov2 * u2;
b2 = ((u2.' * w2).*(-0.5)) - (0.5 * log(det(cov2))) + log(0.5);

ii = 0; jj = 0;
for i = 1 : size(c2,2)
    l1 = gfunction_quad(c1(:,i),W1,w1,b1,W2,w2,b2);
    l2 = gfunction_quad(c2(:,i),W1,w1,b1,W2,w2,b2);
    if l1 == 1
        ii = ii + 1;
    else
        jj = jj + 1;
    end
    if l2 == 1
        ii = ii + 1;
    else
        jj = jj + 1;
    end 
end
figure,plot(c1(1,:),c1(2,:),'r.');,hold on,plot(c2(1,:),c2(2,:),'b.');
f = @(x1,x2) b1 + w1(1)*x1 + w1(2)*x2 + W1(1,1)*x1.^2 + ...
    (W1(1,2)+W1(2,1))*x1.*x2 + W1(2,2)*x2.^2 - ...
    (b2 + w2(1)*x1 + w2(2)*x2 + W2(1,1)*x1.^2 + ...
    (W2(1,2)+W2(2,1))*x1.*x2 + W2(2,2)*x2.^2);
h3 = ezplot(f,[min(op(1,:)) max(op(1,:)) min(op(2,:)) max(op(2,:))]);
h3.Color = 'g';
h3.LineWidth = 1;

