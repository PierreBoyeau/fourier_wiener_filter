function I_sub = subsample3( I, T )
%SUBSAMPLE3 Summary of this function goes here
%   Detailed explanation goes here
[h, w, dim] = size(I);
I_sub = I(1:T:end, 1:T:end, 1:dim);
end

