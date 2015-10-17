function [ classA, classB ]  = clasifyGroup(source, N, checkSource)
a = 1, b = 1;
for i = 1 : N
    if (checkSource(i) == -1)
        classA(:,a) = source(i,:);
        a = a + 1;
    else
        classB(:,b) = source(i,:);
        b = b + 1;
    end
end
classA = classA.';
classB = classB.';
end