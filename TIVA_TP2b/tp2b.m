
%% Imports etc.
addpath('./imdisp/');

I0=imread('car.tif');
imdisp(I0);

load('plaque');
I = plaque;

%% Building convolution kernel
% Parameters
L = 40;


[N1,N2]=size(I);
seg=zeros(size(I));
seg(1,1+mod((1:L)-ceil(L/2),N2))=1/L;

% Building FFT of seg
H = fft2(seg);
figure(1)
imagesc(fftshift(abs(H)));
axis image off;
colormap('gray');
title('FT module of convolution kernel');
print(1,'results/b221.jpg','-djpeg');

profile = fftshift(abs(H));
profile = profile(int32(end/2), 1:end);
figure(2)
plot(profile);
title('FT longitudinal profile');
print(2,'results/b222.jpg','-djpeg');

% Building FFT of image
Ift = fft2(double(I));


%% Wiener Filter
% K Parameter
L = 32;
K = 0.03;
W = conj(H)./(abs(H).*2 + K);
W_ks = conj(H)./(abs(H).*2 + 0.00001);
W_kh = conj(H)./(abs(H).*2 + 5);
DeblurredImage = deblurr(K, L, I);

% Plotting deblurred image
figure(2)
subplot(1,2,1);
imagesc(I);
colormap('gray');

subplot(1,2,2);
imagesc(DeblurredImage);
colormap('gray');
% Penser � modifier la taille de l'image pour reconna�tre le num�ro de
% plaque

% Plotting W longitudinal profile
profile = fftshift(abs(W));
profile = profile(int32(end/2), 1:end);
figure(3)
plot(profile);
title('Profil longitudinal de W pour une valeur adapt�e de K');
colormap('gray');
print(3,'results/b34.jpg','-djpeg');


% Inverse FT of W
w = real(ifft2(W));
figure(4)
imagesc(w);
colormap('gray');

% Profile of w
profile_w = w(1, 1:end);
figure(5)
plot(profile_w);
title('Profil de la transform�e inverse (Valeurs optimales)')
print(5,'results/b351.jpg','-djpeg');


% Profile of w_ks and w_kh
w_ks = real(ifft2(W_ks));
w_kh = real(ifft2(W_kh));
profile_w_ks = w_ks(1, 1:end);
profile_w_kh = w_kh(1, 1:end);

figure(6)
subplot(1, 2, 1)
plot(profile_w_ks);
title('Small value of K');
subplot(1, 2, 2)
plot(profile_w_kh);
title('High value of K');
print(6,'results/b352.jpg','-djpeg');


