function l4_50()
f = zeros(3);
f(:) = -1/8;
f(2,2) = 1;
figure,imshow(f);



input = zeros(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 1;
    end
end
figure,imshow(input),colormap gray
title('input1');
output = conv2(f, input);
figure,imshow(output), colormap gray
title('output1');


input = ones(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 0;
    end
end

figure,imshow(input),colormap gray
title('input2');
output = conv2(f, input);
figure,imshow(output),colormap gray
title('output2');

end