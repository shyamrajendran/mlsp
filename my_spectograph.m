function [output] =  my_spectograph(input, windowSize)
[samples, sampleRate] = audioread(input);
output = my_specHelper(samples, sampleRate, windowSize)
end
output
end
