function dst= quantization(src,bits)
%QUANTIZATION reduce the number of levels in the image.
%   QUANTIZATION(SRC,BITS) reduce the number of levels from 2^_channels_^8
%   to 2^_channels_^BITS.
%
%   % Example 1:
%   %   Get a binary image.
%
%   orig=imread('profile.jpg');
%   im=quantization(orig, 1);
%   imshow(im);

% Copyright 2015 Gionata Massi

[rows, cols, depth] = size(src);
dst = src;
if bits < 8
    mask = [128, 192, 224, 240, 248, 252, 254, 255];
    for r = 1:rows
        for c = 1:cols
            for d=1:depth
                dst(r, c) = bitand (dst(r, c, d), mask(bits));
            end
        end
    end
end

% [EOF]