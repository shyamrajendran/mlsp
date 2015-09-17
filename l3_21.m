function l3_21()
N = 32;
[X, Y]= meshgrid(2*pi*(1:N)/N, 2*pi*(1:N)/N);
m1 = 
output = zeros(N);
for x = 1:N
    for y = 1:N
        output(x,y) = sin(3*y);
    end
end


figure, imagesc(imcomplement(output)), colormap gray, 
% figure, imagesc(abs(fft2(output))), colormap gray,  title('sin(3x)');
% subplot(2,4,1);
% imagesc(output),colormap gray;
% view(0,90);axis xy; axis tight;
% imagesc(abs(fft2(output))),colormap gray;
% view(0,90);axis xy; axis tight;
%{

subplot(2,4,2);
imagesc(abs(fft2(output))),colormap gray;
view(0,90);axis xy; axis tight;


output = zeros(N);
for x = 1:N
    for y = 1:N
        output(x,y) = sin(3*x);
    end
end
figure, imagesc(output),colormap gray
figure, imagesc(abs(fft2(output))), colormap gray,  title('sin(3x)');
subplot(2,4,2);
imagesc(output),colormap gray;
view(0,90);axis xy; axis tight;
subplot(2,4,3);
imagesc(abs(fft2(output))),colormap gray;
view(0,90);axis xy; axis tight;


output = zeros(N);
for x = 1:N
    for y = 1:N
        output(x,y) = sin(5*y);
    end
end
figure
colormap gray
imagesc(output)
figure, imagesc(abs(fft2(output))), colormap gray, title('sin(5y)');


output = zeros(N);
for x = 1:N
    for y = 1:N
        output(x,y) = sin(3*(x+y));
    end
end
figure
colormap gray
output
imagesc(output);
figure, imagesc(output);
figure, imagesc(abs(fft2(output))), colormap gray, title('sin( 3(x+y))');
% figure, imshow(abs(fftshift(output)),[24 100000]), colormap gray

% figure
% colormap gray
% plot(fft2(output))

% F = fft2(output);
% F = fftshift(F); % Center FFT
% 
% F = abs(F); % Get the magnitude
% F = log(F+1); % Use log, for perceptual scaling, and +1 since log(0) is undefined
% F = mat2gray(F); % Use mat2gray to scale the image between 0 and 1
% F
% imagesc(F); % Display the result

 


% output = fft2(output);
% figure
% colormap gray
% imagesc(output)
% axis xy; axis tight;


% figure
% colormap gray
% imagesc(output);

%%%%%%%%%%%%%%%%%%%%%



% N = 32;
% [X, Y]= meshgrid(2*pi*(1:N)/N, 2*pi*(1:N)/N);
% figure;
% imagesc(abs(dftmtx(N)*sin(3*X)));
%}

end