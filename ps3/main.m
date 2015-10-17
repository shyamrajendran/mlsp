%% lecture 8 - slide 30
clearvars
shot = 'shot.wav';
[shotSamples, shotRate] = audioread(shot);
t=[1/shotRate:1/shotRate:length(shotSamples)/shotRate];
% plot(t,shotSamples);
[shotSamplesRow, x] = size(shotSamples);
shotSamplesT = shotSamples.';
[x, shotSamplesTCol] = size(shotSamplesT);

pa = 'pa.wav';
[paSamples, paRate] = audioread(pa);
t=[1/paRate:1/paRate:length(paSamples)/paRate];
% FigHandle = figure('name','lecture 8 slide 30','numbertitle','off');
% set(FigHandle, 'Position', [50, 50, 1200, 400]);
% plot(t,paSamples);
op = conv(paSamples,flipud(shotSamples));
op = abs(op);
% points = size(shotSamples,1);
points = 3000;
points = ones(1,points)/ points;
op1 = filter(points, 1, op);
figure,
plot(paSamples, 'b');hold on; plot(op1./10, 'r')
title('shot detection')


%% lecture 8 - slide 46
clearvars;
load('one.mat')  
% one template
[R, C ] = size(one);
oneg = gradient(one);
template_flipped = fliplr(flipud(oneg));
input = zeros(40,60);
starti = 10;
startj = 15;
for i = 1:R
    for j = 1:C
        input(starti,startj) = one(i,j);
        startj = startj + 1;
    end
    starti = starti + 1;
    startj = 15;
end
inputg = gradient(input);
input_rev = imcomplement(input);
input_revg = gradient(input_rev);
figure
subplot(3,3,1);
colormap gray,imagesc(one), title('one template');

subplot(3,3,2)
imagesc(input), colormap gray, title('input'); 

input_rev = imcomplement(input);
subplot(3,3,3)
imagesc(input_rev), colormap gray, title('input'); 


subplot(3,3,4);
imagesc(oneg), colormap gray,title('one gradient'); 

subplot(3,3,5)
imagesc(inputg), colormap gray, title('input gradient'); 

subplot(3,3,6)
imagesc(input_revg), colormap gray, title('input gradient'); 


convop = conv2(inputg, template_flipped);
subplot(3,3,8);
imagesc(convop), colormap gray, title('matched filter output');

convop2 = conv2(input_revg, template_flipped);
subplot(3,3,9);
imagesc(convop2), colormap gray, title('matched filter output');


%% lecture 9 - slide 32 33 34
clearvars;
% generating the scatter plot norm distributed first
% normal random data
Adata = randn(100, 2);
Bdata = randn(100, 2)+2; %% for stretch
X = [Adata;Bdata];
figure,scatter(Adata(:,1),Adata(:,2), 'or');
hold on;scatter(Bdata(:,1),Bdata(:,2), 'ob');

c1 = Adata.';
c2 = Bdata.';

% get variance of the two classes
mean_x_classA = mean(c1(1,:));
mean_y_classA = mean(c1(2,:));
mA = [mean_x_classA ; mean_y_classA];

% saving variance of class
vA = 0;
for i = 1:size(c1,1)
    vA =  vA + (c1(1,i) - mA(1)).^2 + (c1(2,i) - mA(2)).^2;
end
vA = vA/size(c1,1);

mean_x_classB = mean(c2(1,:));
mean_y_classB = mean(c2(2,:));
mB = [mean_x_classB ;mean_y_classB];


% save variance of B class
vB = 0;
for i = 1:size(c2,1)
    vB =  vB + (c2(1,i) - mB(1)).^2 + (c2(2,i) - mB(2)).^2;
end
vB = vB / length(c2);

WA = mA ./ vA;
WB = mB ./ vB;
b_classA = (-1 * (mA.' * mA) /  (2* vA)) + log(0.5); b_classB = (-1 * (mB.' * mB) /  (2* vB)) + log(0.5);

[op1, op2] = meshgrid(min(X(:,1)):0.05:max(X(:,1)),min(X(:,2)):0.05:max(X(:,2)));
s = size(op1);
op = zeros(s);
for j = 1: length(op1(:))
    t = [op1(j);op2(j)];
    a = WA.' * t + b_classA;
    b = WB.' * t + b_classB;
    if (a > b)
        op(j) = 1;
    else
        op(j) = -1;
    end
end
% plot 
contour(op1, op2, op, 2, 'o'); title('lecture 9 - slide 32');
clearvars
% both parts of the lecture 9 slide 34 and slide 33 combined loop
for count = 1:3
    theta = 130;
    if count == 3
        dataB = 7 *randn(100,2);
        dataA = randn(100,2) + 3;
    else
        y1 = 4 * randn(100,1);
        y2 = 0.5 * randn(100,1);
        rotation = [cosd(theta) -sind(theta); sind(theta) cosd(theta)];
        Y = [y1 y2] * rotation;
        y1 = Y(:,1);
        y2 = Y(:,2);
        dataA = [y1 y2];
        mean_offset = 0;
        if count == 1
            mean_offset = 7;
        else
            mean_offset = 3;
        end
        dataB = randn(100,2) + mean_offset;
        X = [dataA;dataB];
    end
  
    figure,scatter(dataA(:,1),dataA(:,2), 'ob');
    hold on
    scatter(dataB(:,1),dataB(:,2), 'or');title('lecture 9');
    c1 = dataA.';
    c2 = dataB.';
    mA_x = mean(c1(1,:));
    mA_y = mean(c1(2,:));
    mA = [mA_x ; mA_y];
    covA = cov(c1.');
    invcovA = inv(covA);
    WA = invcovA .* (-0.5);
    wA = invcovA * mA;
    bA = ((mA.' * wA).*(-0.5)) - (0.5 * log(det(covA))) + log(0.5);
    mB_x = mean(c2(1,:));
    mB_y = mean(c2(2,:));
    mB = [mB_x ; mB_y];
    covB = cov(c2.');
    inv_cov_b = inv(covB);
    WB = inv_cov_b .* (-0.5);
    wB = inv_cov_b * mB;
    bB = ((mB.' * wB).*(-0.5)) - (0.5 * log(det(covB))) + log(0.5);
    [op1, op2] = meshgrid(min(X(:,1)):0.1:max(X(:,1)),min(X(:,2)):0.1:max(X(:,2)));
    op = zeros(size(op1));
    for j = 1: size(op1(:),1)
        t = [op1(j);op2(j)];
        a = t.' * WA * t + wA.' * t + bA;
        b = t.' * WB * t + wB.' * t + bB;
        if (a > b)
            op(j) = 1;
        else
            op(j) = -1;
        end
    end
    contour(op1, op2, op, 2, 'k');title('lecture 9')
end

%% lecture 9 - slide 53
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

%% lecture 10 - slide 39
clearvars
X = [randn(100, 2);randn(100, 2)+ 6];
Y = [repmat(1,100,1);repmat(-1,100,1)];
% classify into class
[classA, classB] = clasifyGroup(X, 200, Y);
figure,plot(classA(:,1), classA(:,2), 'ob')
hold on
plot(classB(:,1), classB(:,2), 'or')

H = [eye(2) zeros(2,1);zeros(1, 2+1)];
f = zeros(2 + 1,1);
A = -diag(Y) * [X ones(200,1)];
c = -ones(200,1);
OP = quadprog(H,f,A,c);
W = [OP(1);OP(2)];
w0 = OP(3);
x1 = min(X(:,1)): max(X(:,1));
x2 = (- W(1) * x1 - w0 ) / W(2);
plot(x1,x2)
x3 = (1 - W(1) * x1 - w0) / W(2);
plot(x1,x3, '-.r');
x4 = (-1 - W(1) * x1 - w0) / W(2);
plot(x1,x4, '-.b');
dv = zeros(200,1);
for i =1:200
    dv(i,1) = (W.' * X(i,:).' + w0) / norm(W);
end
figure, bar(dv, 'b'), title('lecture 10 - slide 39');



%% lecture 10 - slide 42
clearvars
C = 10;
X = [randn(100, 2) + 1;randn(100, 2)+ 3];
Y = [repmat(1,100,1);repmat(-1,100,1)];
H = [eye(2) zeros(2, 200 + 1);zeros(200 + 1, 200 + 1 + 2)];
f = C * [zeros(2 + 1,1);ones(200,1)];
Aeq = [];
beq = [];
% calculating bounds for slack variable
lb = [-inf * ones(2 + 1,1);zeros(200,1)];
ub = inf * ones(2 + 1 + 200,1);
A = zeros(200, 2);
A(:,1) = Y .* X(:,1);
A(:,2) = Y .* X(:,2);
A = [-A -Y -eye(200)];
b = -ones(200,1);
op = quadprog(H,f,A,b,Aeq,beq,lb,ub);
% clasify into classes now
[ classA, classB ] = clasifyGroup(X, 200, Y);
figure, plot(classA(:,1), classA(:,2), 'or')
hold on
plot(classB(:,1), classB(:,2), 'ob'),title('lecture 10 - slide 42')
W = [op(1);op(2)];
w0 = op(3);
x1 = min(X(:,1)): max(X(:,1));
x2 = (- W(1) * x1 - w0 ) / W(2);
plot(x1,x2)
x3 = (1 - W(1) * x1 - w0) / W(2);
plot(x1,x3, '-.b');
x4 = (-1 - W(1) * x1 - w0) / W(2);
plot(x1,x4, '-.r');
dv = zeros(200,1);
for i =1:200
    dv(i,1) = (W.' * X(i,:).' + w0) / norm(W);
end
figure, bar(dv, 'r')


%%  lecture 11 - slide 24
clearvars
% neighbours 
k = [1 3 5 11 21 100]
Y = [repmat(1,100,1);repmat(-1,100,1)];
N = 200;
for level = 2:1.5:5
    X = [randn(100, 2);randn(100, 2)+ level];    
    myknnhelper(X, Y, N, level, k);
end
