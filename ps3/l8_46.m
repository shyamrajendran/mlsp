
clearvars;
load('one.mat')  
% one template

[R, C ] = size(one);
oneg = gradient(one);
template_flipped = fliplr(flipud(oneg));


% to take convolution now

input = zeros(40,60);
starti = 10;
startj = 15;
for i = 1:R
    for j = 1:C
        input(starti,startj) = one(i,j);
        startj = startj + 1;
    end
    starti = starti + 1;
    startj = 15;
end


inputg = gradient(input);
input_rev = imcomplement(input);
input_revg = gradient(input_rev);


subplot(3,3,1);
colormap gray,imagesc(one), title('one template');

subplot(3,3,2)
imagesc(input), colormap gray, title('input'); 

input_rev = imcomplement(input);
subplot(3,3,3)
imagesc(input_rev), colormap gray, title('input'); 


subplot(3,3,4);
imagesc(oneg), colormap gray,title('one gradient'); 

subplot(3,3,5)
imagesc(inputg), colormap gray, title('input gradient'); 

subplot(3,3,6)
imagesc(input_revg), colormap gray, title('input gradient'); 


convop = conv2(inputg, template_flipped);
subplot(3,3,8);
imagesc(convop), colormap gray, title('matched filter output');

convop2 = conv2(input_revg, template_flipped);
subplot(3,3,9);
imagesc(convop2), colormap gray, title('matched filter output');
