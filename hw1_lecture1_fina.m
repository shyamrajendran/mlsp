
function hw1_backup()
my_image = uint8(imread('shyam.jpg'));
figure,imshow(my_image);
image_resized = double(imresize(my_image,[50 50]));
figure,imshow(uint8(image_resized));


[H,V,P] = size(image_resized);
HH = gen2(H);
title('hh');
figure,imshow(HH);
VV = gen(V);
figure,imshow(VV);
diagI = diag([1,0,1]);

% kronValue = kron(kron(diagI,HH),VV);
kronValueHHVV = kron(HH,VV);
kronValue = kron(diagI,kronValueHHVV);


vec_image = image_resized(:);


final_vec = uint8(kronValue*vec_image);
final_image = reshape(final_vec,H,V,P);
title('original');
figure,imshow(uint8(image_resized));
title('final');
figure,imshow(final_image);
