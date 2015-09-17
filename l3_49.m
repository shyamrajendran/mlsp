function l3_49()
input = '49.mp3';

spectrogram(audioread(input),512);
downSampleRate = 8;
windowSize = 512;

[output, samples, sampleRate] = my_spectograph(input, windowSize);

increments = size(samples)/windowSize;
x = 1:increments:size(samples);
y = log(linspace(1, 12000,5));



figure, imagesc([1 6],y, imcomplement(output)), colormap gray;
    view(0,90);
    axis xy; axis tight;
    xlabel('Time');
    ylabel('Frequency Hz');
    str = sprintf('Spectrogram for input with WindowSize = %d ',windowSize);
    title(str);


sizeSample = size(samples);
rows = uint8(sizeSample/downSampleRate);
ovector = zeros(1,1);
size(ovector)
j = 1;
for i = 1:downSampleRate:sizeSample;
    ovector(j,1) = samples(i,1);
    j = j+1;
end
sizeSample
size(ovector)

increments = size(ovector)/windowSize;
x = 1:increments:size(ovector);
y = log(linspace(1, 4000,5));
output = my_specHelper(ovector, sampleRate, windowSize);
figure,colormap gray,imagesc(x,y,1-output);
view(0,90);
axis xy; axis tight;
xlabel('Time');
ylabel('Frequency Hz');
str = sprintf('Spectogram  aliasing seen for WindowSize = %d ',windowSize);
title(str);
   

%     spectrogram(ovector, 512);


%%%%%%%%%%%%%%%%%
%%%% passing into low pass filter
%%%%%%%%%%%%%%%%%
order = 5;
filter = fir1(order, 0.4, 'low');
ovector = conv(filter, ovector);

increments = size(ovector)/windowSize;
x = 1:increments:size(ovector);
y = log(linspace(1, 4000,5));
output = my_specHelper(ovector, sampleRate, windowSize);
% figure,colormap gray,imagesc(x,y,imcomplement(output));
figure,colormap gray,imagesc(imcomplement(output));
view(0,90);
axis xy; axis tight;
xlabel('Time');
ylabel('Frequency Hz');
str = sprintf('Spectogram  aliasing removed when passed through low pass filter ');
title(str);

end

