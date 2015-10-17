clearvars;
shot = 'shot.wav';
[shotSamples, shotRate] = audioread(shot);
t=[1/shotRate:1/shotRate:length(shotSamples)/shotRate];
% plot(t,shotSamples);

[shotSamplesRow, x] = size(shotSamples);
shotSamplesT = shotSamples.';
[x, shotSamplesTCol] = size(shotSamplesT);

pa = 'pa.wav';
[paSamples, paRate] = audioread(pa);
t=[1/paRate:1/paRate:length(paSamples)/paRate];
FigHandle = figure('name','lecture 8 slide 30','numbertitle','off');
set(FigHandle, 'Position', [50, 50, 1200, 400]);
% plot(t,paSamples);
op = conv(paSamples,flipud(shotSamples));
op = abs(op);
% points = size(shotSamples,1);
points = 3000;
points = ones(1,points)/ points;
op1 = filter(points, 1, op);
plot(paSamples, 'b');hold on; plot(op1./10, 'r')
title('shot detection')
