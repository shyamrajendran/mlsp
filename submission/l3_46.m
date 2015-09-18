function l3_46()



%% input 
image = imread('46.jpg');
[H,V,P] = size(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);
FigHandle = figure('name','lecture 3 - 46','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 1800, 500]);

%% for output1
n = 25;
f = blur(n);
r = conv2(double(R), double(f));
g = conv2(double(G), double(f));
b = conv2(double(B), double(f));
out1(:,:,1) = uint8(r);
out1(:,:,2) = uint8(g);
out1(:,:,3) = uint8(b);
subplot(2,6,1);
imagesc(image);
subplot(2,6,2);
imagesc(imcomplement(f)),colormap gray;
subplot(2,6,3)
imagesc(uint8(out1));
title('out1');

%% for output 2
noisyimage = rand(H,V);
f1 = noisyimage>0.4;

noisyimage = rand(H,V);
f2 = noisyimage>0.3;

noisyimage = rand(H,V);
f3 = noisyimage>0.3;

[h,v,p ] = size(f1);
for i = 1:h
    for j = 1:v
        if (f1(i,j) == 0)
            R(i,j) = 100;
        end
        if (f2(i,j) == 0)
            G(i,j) = 100;
        end
        if (f3(i,j) == 0)
            B(i,j) = 100;
        end
    end
end


% construct input image
in2(:,:,1) = R;
in2(:,:,2) = G;
in2(:,:,3) = B;

subplot(2,6,4);
imagesc(uint8(in2));
subplot(2,6,5);


scale = 0.6;
f = noise(7,scale);
imagesc(imcomplement(f)),colormap gray;
r = conv2(double(f), double(R),'full');
g = conv2(double(f), double(G),'full');
b = conv2(double(f), double(B),'full');
out2(:,:,1) = r;
out2(:,:,2) = g;
out2(:,:,3) = b;
subplot(2,6,6);
imagesc(uint8(out2));
title('out2');


%% output 3
scale = 0.02;
filterV = horzcat(gen3(20,scale),gen2(20,scale));
subplot(2,6,7);
imagesc(image);
subplot(2,6,8);
imagesc(imcomplement(filterV)),colormap gray;

r = conv2(double(filterV), double(R),'full');
g = conv2(double(filterV), double(G),'full');
b = conv2(double(filterV), double(B),'full');

[h,v,p] = size(r);
out3 = zeros(h,v);
out3(:,:,1) = r;
out3(:,:,2) = g;
out3(:,:,3) = b;
subplot(2,6,9);
imagesc(uint8(out3));
title('out3');

%% out 4 

image = imread('46.jpg');
[H,V,P] = size(image);
R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);

in4 = image;

k = 2;
for i = 265 : -1 : 1
     in4(:,i,:) = in4(:,i,:) * k;
     k = k - 0.006;
end

k = 2;
for i = 266 : 531
     in4(:,i,:) = in4(:,i,:) * k;
     k = k - 0.006;
end

filter = zeros(1,41);
filter(1,21) = 1.0;
filter(1,20) = -0.2;
filter(1,22) = -0.2;

r = conv2(double(in4(:,:,1)), double(filter));
g = conv2(double(in4(:,:,2)), double(filter));
b = conv2(double(in4(:,:,3)), double(filter));
filteredImg = cat(3, uint8(r), uint8(g), uint8(b));

subplot(2,6,10);
imagesc(in4);
subplot(2,6,11),colormap gray;

plot(filter);
axis([0 41 -0.2 1.2]);
subplot(2,6,12);
imagesc(filteredImg);
title('out4');

end
