
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
print(1,'results/0.jpg','-djpeg');

Ifft = fft2(I);

% Different part of the FT (not used for plotting)
Ifft_r = real(Ifft);%Real part
Ifft_i = imag(Ifft);%Imaginary part
Ifft_mod = abs(Ifft);% Module
Ifft_angle = angle(Ifft);% Phase

% Shifted FT (only used for plotting)
ft_shift = fftshift(Ifft);

figure(2)
subplot(2, 2, 1)
imagesc(log(abs(real(ft_shift))));
axis image off;
colormap('gray');
title('FT real part');

subplot(2, 2, 2)
imagesc(log(abs(imag(ft_shift))));
axis image off;
colormap('gray');
title('FT imaginary part');

subplot(2, 2, 3)
imagesc(log(abs(ft_shift)));
axis image off;
colormap('gray');
title('FT module');

subplot(2, 2, 4)
imagesc(angle(ft_shift));
axis image off;
colormap('gray');
title('FT angle');
print(2,'results/12.jpg','-djpeg');


% Construction of a filter
ft_filter1 = low_filter(Ifft, 0.1);
I_filter1 = real(ifft2(ft_filter1));

ft_filter2 = low_filter(Ifft, 0.2);
I_filter2 = real(ifft2(ft_filter2));

ft_filter3 = low_filter(Ifft, 0.3);
I_filter3 = real(ifft2(ft_filter3));

ft_filter4 = low_filter(Ifft, 0.4);
I_filter4 = real(ifft2(ft_filter4));

figure(6)
subplot(2,2,4);
imagesc(I_filter1);
axis image off;
colormap('gray');
title('f=0.1');
subplot(2,2,3);
imagesc(I_filter2);
axis image off;
colormap('gray');
title('f=0.2');
subplot(2,2,2);
imagesc(I_filter3);
axis image off;
colormap('gray');
title('f=0.3');
subplot(2,2,1);
imagesc(I_filter4);
axis image off;
colormap('gray');
title('f=0.4');
print(6,'results/151.jpg','-djpeg');

% Same idea with a rectangle
ft_test = fft2(I_test);
ft_filter1 = low_filter(ft_test, 0.1);
I_filter1 = real(ifft2(ft_filter1));

ft_filter2 = low_filter(ft_test, 0.2);
I_filter2 = real(ifft2(ft_filter2));

ft_filter3 = low_filter(ft_test, 0.3);
I_filter3 = real(ifft2(ft_filter3));

ft_filter4 = low_filter(ft_test, 0.4);
I_filter4 = real(ifft2(ft_filter4));

figure(7)
subplot(2,2,4);
imagesc(I_filter1);
axis image off;
colormap('gray');
title('f=0.1');
subplot(2,2,3);
imagesc(I_filter2);
axis image off;
colormap('gray');
title('f=0.2');
subplot(2,2,2);
imagesc(I_filter3);
axis image off;
colormap('gray');
title('f=0.3');
subplot(2,2,1);
imagesc(I_filter4);
axis image off;
colormap('gray');
title('f=0.4');
print(6,'results/152.jpg','-djpeg');


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

