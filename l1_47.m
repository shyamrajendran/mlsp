
function l1_47()
my_image = uint8(imread('shyam.jpg'));
% figure,imshow(my_image);
image_resized = double(imresize(my_image,[100 100]));
% figure,imshow(uint8(image_resized));


[H,V,P] = size(image_resized);
HH = gen2(H,1);
title('hh');
figure,imshow(HH);
VV = gen(V,1);
figure,imshow(VV);
diagI = diag([1,0,1]);

% kronValue = kron(kron(diagI,HH),VV);
kronValueHHVV = kron(HH,VV);
kronValue = kron(diagI,kronValueHHVV);


vec_image = image_resized(:);


final_vec = uint8(kronValue*vec_image);
final_image = reshape(final_vec,H,V,P);
% title('original');
% figure,imshow(uint8(image_resized));
title('final');
figure,imshow(final_image);
