function l3_46()

%
image = imread('46.jpg');
[H,V,P] = size(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);


%%%%%%%%%%%%%%%%%%%%%%
%%%% out 3
%%%%%%%%%%%%%%%%%%%%%%%
%{
scale = 0.02
filterV = horzcat(gen3(20,scale),gen2(20,scale));
r = conv2(double(filterV), double(R),'full');
g = conv2(double(filterV), double(G),'full');
b = conv2(double(filterV), double(B),'full');

[h,v,p] = size(r);
out3 = zeros(h,v);
out3(:,:,1) = r;
out3(:,:,2) = g;
out3(:,:,3) = b;
figure,imagesc(uint8(out3));
title('out3')
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    out2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ratio = 0.5;
r = conv2(noise(7,ratio), double(R),'full');
g = conv2(noise(7,ratio), double(G),'full');
b = conv2(noise(7,ratio), double(B),'full');
size(r)
size(g)
size(b)
out2 = zeros(size(r));
out2(:,:,1) = r;
out2(:,:,2) = g;
out2(:,:,3) = b;

figure,imagesc(out2);
title('out2');


end
