
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
title('FT real part');

profile = fftshift(abs(H));
profile = profile(int32(end/2), 1:end);
figure(1)
plot(profile);
title('FT longitudinal profile');

% Building FFT of image
Ift = fft2(double(I));


%% Wiener Filter
% K Parameter
L = 30;
K = 0.07;
W = conj(H)./(abs(H).*2 + K);

DeblurredImage = deblurr(K, L, I);

% Plotting deblurred image
figure(2)
subplot(1,2,1);
imagesc(I);
colormap('gray');

subplot(1,2,2);
imagesc(DeblurredImage);
colormap('gray');
% Penser à modifier la taille de l'image pour reconnaître le numéro de
% plaque

% Plotting W longitudinal profile
profile = fftshift(abs(W));
profile = profile(int32(end/2), 1:end);
figure(3)
plot(profile);
colormap('gray');

% Inverse FT of W
w = real(ifft2(W));
figure(4)
imagesc(w);
colormap('gray');

% Profile of w
profile_w = w(1, 1:end);
figure(5)
plot(profile_w);

