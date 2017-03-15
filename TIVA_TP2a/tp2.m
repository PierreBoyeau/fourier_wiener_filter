
%% Fourier transform of an image
Irgb = imread('treewall.jpg');
I = double(rgb2gray(Irgb));

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
ft_filter = low_filter(Ifft, 0.1);
I_filter = real(ifft2(ft_filter));

figure(6)
imagesc(I_filter);
axis image off;
colormap('gray');
title('Low frequency filtering');

%% Aliasing


%% Théorème d'échantillonnage (bonus)