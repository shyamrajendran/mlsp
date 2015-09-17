function l4_52()
image = imread('52.png');
[H,V,P] = size(image)
% image = imresize(image,0.5);

f = zeros(200,200);


for i = 50:150
    f(i,100) = 1;
end

for i = 52:148
    f(i,101) = 1;
    f(i,101) = 1;
end
for i = 54:146
    f(i,102) = 1;
    f(i,102) = 1;
end
for i = 60:140
    f(i,103) = 1;
    f(i,103) = 1;
end

f1 = fliplr(f);
f1 = f + f1;
f2 = rot90(f1,1);
f3 = imrotate(f1, 45);
f4 = imrotate(f1, -45);

o1=conv2(f1, image,'full');
o2=conv2(f2, image,'full');
o3=conv2(f3, image,'full');
o4=conv2(f4, image,'full');


figure,imagesc(f1);
figure,imagesc(o1);
figure,imagesc(f2);
figure,imagesc(f3);
figure,imagesc(f4);
figure,imagesc(o1);
figure,imagesc(o2);
figure,imagesc(o3);
figure,imagesc(o4);


end