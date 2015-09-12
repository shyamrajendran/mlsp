
function hw1()
my_image = uint8(imread('shyam.jpg'));

% my_image = im2uint8(my_image);
image_resized = double(imresize(my_image,.3));
% image_resized = my_image;
% imshow(image_resized);
[H,V,P] = size(image_resized)
HH = gen2(H);
VV = gen(V);
diagI = diag([1,0,1]);
% kronValue = kron(kron(diagI,eye(H)),eye(V));

kronValue = kron(kron(diagI,HH),VV);


% size(kronValue)


vec_image = image_resized(:);

% size(vec_imagev
final_vec = uint8(kronValue*vec_image);

size(final_vec);
final_image = reshape(final_vec,H,V,P);
size(final_image);
% image(image_resized);
% title('original');
 
% image_resized;
% final_image;
% imshow(final_image);
% title('final image');
imshow(final_image)