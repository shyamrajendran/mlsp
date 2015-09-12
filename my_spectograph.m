function [output] =  my_spectograph(windowSize)
[samples, sampleRate] = audioread('18.wav');
% to hold the per window matrix
sampleCount = size(samples);
output = [];
for m = 1:windowSize:sampleCount
    i=1;
    windowMatrix = zeros(1, windowSize);
    
    %ignoring values instead of zeros.
    if ( (m+windowSize) > sampleCount )
        break;
    end 
    for n = 1:windowSize;
        windowMatrix(1,i) = samples(m+n);
        i = i+1;
    end
    
    %calculate fft of this windowmatrix(:)
    fftv = log10(abs(fft(windowMatrix(:))));
    output = horzcat(output, fftv);
end
output;
end 