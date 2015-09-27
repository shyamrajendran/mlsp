function [W] = helperICA(learningRate, delta, W, X, D, N)
for i = 1:1000000
    disp(i);
    y = W*X;
    old = W;
    fy = y.^3;
    dW = (D*N - fy*(y.')) * W/N;
    W = W + learningRate*dW;
    new = W;
    if(converge(old, new, delta))
        disp('convered');
        break;
    end    
end