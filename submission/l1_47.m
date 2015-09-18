
function l1_47()
my_image = uint8(imread('shyam.jpg'));
FigHandle = figure('name','lecture 1 - 47','numbertitle','off');
subplot(2,2,1);
imshow(my_image);
title('input');
image_resized = double(imresize(my_image,[50 50]));

[H,V,P] = size(image_resized);
HH = gen2(H,1);


subplot(2,2,2);
imshow(HH);


VV = gen(V,1);


subplot(2,2,3);
imshow(VV);


diagI = diag([1,0,1]);

% kronValue = kron(kron(diagI,HH),VV);
kronValueHHVV = kron(HH,VV);
kronValue = kron(diagI,kronValueHHVV);

vec_image = image_resized(:);
final_vec = uint8(kronValue*vec_image);
final_image = reshape(final_vec,H,V,P);

subplot(2,2,4);
imshow(final_image);
title('final output');
