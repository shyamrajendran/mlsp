function hw3_18()
input = '18.wav';
figure,imagesc(my_spectograph(input, 64));
title('64 window');

figure,imagesc(my_spectograph(input, 512));
title('512 window');

figure,imagesc(my_spectograph(input, 2048));
title('2048 window');
end
