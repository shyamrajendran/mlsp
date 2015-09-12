function hw3_18()

figure,imagesc(my_spectograph(64));
title('64 window');


figure,imagesc(my_spectograph(512));
title('512 window');


figure,imagesc(my_spectograph(2048));
title('2048 window');
end
