function l4_50()
f = zeros(3);
f(:) = -1/8;
f(2,2) = 1;

input = zeros(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 1;
    end
end
FigHandle = figure('name','Lecture 4 - 50','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 500, 500]);
subplot(2,2,3)
imshow(input),colormap gray
title('input');
output = conv2(input,f,'full');
subplot(2,2,4)
imshow(output), colormap gray
title('Energy of edge detector');


input = ones(50,50);
for i = 15:35
    for j = 15:35
        input(i,j) = 0;
    end
end
subplot(2,2,1)
imshow(input),colormap gray
title('input');
output = conv2(input,f,'valid');
subplot(2,2,2)
imshow(output),colormap gray
title('Energy of edge detector');

end