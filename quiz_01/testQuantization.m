function testQuantization
%TESTQUANTIZATION test quantization.
%   TESTQUANTIZATION test the quantization function
%
% See also QUANTIZATION

% Copyright 2015 Gionata Massi

orig=imread('profile.jpg');
for bits=1:8
    im=quantization(orig, bits);
    figure;
    imshow(im);
    filename=sprintf('profile_color_%d_bits.png', bits);
    imwrite(im, filename);
end

% [EOF]