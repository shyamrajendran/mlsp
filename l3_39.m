function l3_39()
input = '39.wav';
windowSize = 512;
order = 20;
[samples, sampleRate] = audioread('39.wav');
spectrogram(samples, 512);
title('Using matlab spectrogram');


size(samples)
filter = fir1(order, 0.8, 'high');
samplesFiltered = conv(filter, samples);
size(samplesFiltered);
spectrogram(samplesFiltered, 512);


filter = fir1(order, 0.9, 'low');
samplesFiltered = conv(filter, samples);
size(samplesFiltered);
output = my_specHelper(samplesFiltered, sampleRate, windowSize);
figure,imagesc(output);
title('lowpass');

filter = fir1(order, [0.2 0.8], 'bandpass');
samplesFiltered = conv(filter, samples);
size(samplesFiltered);
output = my_specHelper(samplesFiltered, sampleRate, windowSize);
figure,imagesc(output);
title('bandpass');



filter = fir1(order, 0.8, 'high');
samplesFiltered = conv(filter, samples);
size(samplesFiltered);
output = my_specHelper(samplesFiltered, sampleRate, windowSize);
figure,imagesc(output);
title('high');


filter = fir1(order, [0.2 0.8], 'stop');
samplesFiltered = conv(filter, samples);
size(samplesFiltered);
output = my_specHelper(samplesFiltered, sampleRate, windowSize);
figure,imagesc(output);
title('band stop');

end

