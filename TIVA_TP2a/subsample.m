function I_sub = subsample( I, T )
%Only works for B&W images for now
[h, w] = size(I);
I_sub = I(1:T:h, 1:T:w);
end

