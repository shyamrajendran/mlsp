function l3_18()
input = '18.wav';
list = [64,512,2048];
FigHandle = figure('name','lecture 3 - 18','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 2000, 1000]);

i = 1;
for windowSize = list
    [output, samples, sampleRate] = my_spectograph(input, windowSize);
    T = 0 : (windowSize*1/sampleRate) : (length(samples)*1/sampleRate) - windowSize*1/sampleRate;
    F = 0 : sampleRate/2;
    increments = size(samples)/windowSize;
    subplot(3,1,i);
    colormap gray,imagesc(T,F,imcomplement(output));
    view(0,90);
    axis xy; axis tight;
    xlabel('Time (sec)');
    ylabel('Frequency (Hz)');
    str = sprintf('Spectogram function outout for WindowSize = %d ',windowSize);
    title(str);
    i = i + 1;
end

end

