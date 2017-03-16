
%% Fourier transform of an image
Irgb = imread('treewall.jpg');
I = double(rgb2gray(Irgb));
Irgb_test = imread('test.png');
I_test = double(rgb2gray(Irgb_test));

figure(1)
imagesc(I);
axis image off;
colormap('gray');
title('Original B&W image');

Ifft = fft2(I);

% Different part of the FT (not used for plotting)
Ifft_r = real(Ifft);%Real part
Ifft_i = imag(Ifft);%Imaginary part
Ifft_mod = abs(Ifft);% Module
Ifft_angle = angle(Ifft);% Phase

% Shifted FT (only used for plotting)
ft_shift = fftshift(Ifft);

figure(2)
imagesc(log(abs(real(ft_shift))));
axis image off;
colormap('gray');
title('FT real part');

figure(3)
imagesc(log(abs(imag(ft_shift))));
axis image off;
colormap('gray');
title('FT imaginary part');

figure(4)
imagesc(log(abs(ft_shift)));
axis image off;
colormap('gray');
title('FT module');

figure(5)
imagesc(angle(ft_shift));
axis image off;
colormap('gray');
title('FT angle');

% Construction of a filter
ft_filter1 = low_filter(Ifft, 0.1);
I_filter1 = real(ifft2(ft_filter1));

ft_filter2 = low_filter(Ifft, 0.2);
I_filter2 = real(ifft2(ft_filter2));

ft_filter3 = low_filter(Ifft, 0.3);
I_filter3 = real(ifft2(ft_filter3));

figure(6)
subplot(3,1,1);
imagesc(I_filter1);
axis image off;
colormap('gray');
title('f=0.1');
subplot(3,1,2);
imagesc(I_filter2);
axis image off;
colormap('gray');
title('f=0.2');
subplot(3,1,3);
imagesc(I_filter3);
axis image off;
colormap('gray');
title('f=0.3');

% Same idea with a rectangle
ft_test = fft2(I_test);
ft_filter1 = low_filter(ft_test, 0.1);
I_filter1 = real(ifft2(ft_filter1));

ft_filter2 = low_filter(ft_test, 0.2);
I_filter2 = real(ifft2(ft_filter2));

ft_filter3 = low_filter(ft_test, 0.3);
I_filter3 = real(ifft2(ft_filter3));

figure(7)
subplot(3,1,1);
imagesc(I_filter1);
axis image off;
colormap('gray');
title('f=0.1');
subplot(3,1,2);
imagesc(I_filter2);
axis image off;
colormap('gray');
title('f=0.2');
subplot(3,1,3);
imagesc(I_filter3);
axis image off;
colormap('gray');
title('f=0.3'); % Apparition d'artéfacts


%% Aliasing
Irgb_b = imread('brickwall.jpg');

figure(8)
imagesc(Irgb_b);
axis image off;
title('Brick image');

for j=2:10
    I_sub = subsample3(Irgb_b, j);
    figure(8+j)
    imagesc(I_sub);
    axis image off;
    title('Brick image');
    pause(1);
end

%% Théorème d'échantillonnage (bonus)

