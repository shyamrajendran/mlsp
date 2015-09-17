function l3_18()
input = '18.wav';
list = [64,512,2048]
x = 1:increments:size(samples);
y = log(linspace(1, 6000,5));
    
for windowSize = list
    [output, samples, sampleRate] = my_spectograph(input, windowSize);
    increments = size(samples)/windowSize;
    figure,colormap gray,imagesc(x,y,1-output);
    view(0,90);
    axis xy; axis tight;
    xlabel('Time');
    ylabel('Frequency Hz');
    str = sprintf('Spectrogram for WindowSize = %d ',windowSize);
    title(str);
    title(str);
end

end

