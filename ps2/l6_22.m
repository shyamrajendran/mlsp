N = 300;
%range -1 to 1
a = -1;
b = 1;
r1 = (b-a).*rand(N,1) + a;
r2 = (b-a).*rand(N,1) + a;

x = 2*r1 + r2;
y = r1 + r2;
scatter(x,y);
size(x)
size(y)
X = zeros(2,N);
X(1,:) = x;
X(2,:) = y;
subplot(2,1,1)
scatter(x,y);
size(X)
W = eye(2);
D = eye(2);
learningRate = 0.005;
delta = 0.00001;
W = helperICA(learningRate, delta, W, X, D, N);


%{
alpha = 0.005;
delta = 0.00001;
for i = 1:1000000
    disp(i);
    y = W*X;
    old = W;
    fy = y.^3;
    dW = (D*N - fy*(y.')) * W/N;
    W = W + alpha*dW;
    new = W;
    if(converge(old, new, delta))
        disp('convered');
        break;
    end    
end
%}
op = W*X;
size(op)
subplot(2,1,2)
scatter(op(1,:),op(2,:))
