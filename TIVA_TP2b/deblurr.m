function filtered = deblurr( K, L, imagette )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

% Building W matrix
[N1,N2]=size(imagette);
seg=zeros(size(imagette));
seg(1,1+mod((1:L)-ceil(L/2),N2))=1/L;
H = fft2(seg);
W = conj(H)./(abs(H).*2 + K);

% Applying FFT to imagette
G = fft2(imagette);

% Result 
filtered = ifft2(W .* G);

end

