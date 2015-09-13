function l4_1()
f = zeros(3);
f(:) = -1/8;
f(2,2) = 1/8;

input = zeros(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 1;
    end
end
figure,imagesc(input);
title('input1');
output = conv2(input, f);
figure,imagesc(output);
title('output1');


%%%%

input = ones(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 0;
    end
end
figure,imagesc(input);
title('input2');
output = conv2(input, f);
figure,imagesc(output);
title('output2');

end