clearvars
%% lecture 10 - slide 39
X = [randn(100, 2);randn(100, 2)+ 6];
Y = [repmat(1,100,1);repmat(-1,100,1)];
% clasify into class
[classA, classB] = clasifyGroup(X, 200, Y);
classA = classA.';
classB = classB.';

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
figure, bar(dv, 'b')

%%
%%for lecture 10 - slide 42
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
%%%calculate A matrix such that Ax <= b
A = zeros(200, 2);
A(:,1) = Y .* X(:,1);
A(:,2) = Y .* X(:,2);
A = [-A -Y -eye(200)];
b = -ones(200,1);
op = quadprog(H,f,A,b,Aeq,beq,lb,ub);
% clasify into class
[ classA, classB ] = clasifyGroup(X, 200, Y);
classA = classA.';
classB = classB.';
figure,
plot(classA(:,1), classA(:,2), 'or')
hold on
plot(classB(:,1), classB(:,2), 'ob')
title('lecture 10 - slide 42')

W = [op(1);op(2)];
w0 = op(3);
x1 = min(X(:,1)): max(X(:,1));
x2 = (- W(1) * x1 - w0 ) / W(2);
plot(x1,x2)
x3 = (1 - W(1) * x1 - w0) / W(2);
plot(x1,x3, '-.b');
x4 = (-1 - W(1) * x1 - w0) / W(2);
plot(x1,x4, '-.r');
distance_vector = zeros(200,1);
for i =1:200
    distance_vector(i,1) = (W.' * X(i,:).' + w0) / norm(W);
end
figure, bar(distance_vector, 'r')