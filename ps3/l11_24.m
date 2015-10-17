clearvars
% neighbours 
k = [1 3 5 11 21 100]
Y = [repmat(1,100,1);repmat(-1,100,1)];
N = 200;
for level = 2:1.5:5
    X = [randn(100, 2);randn(100, 2)+ level];    
    myknnhelper(X, Y, N, level, k);
end