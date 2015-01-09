function dst = downSampling(src,edge)
%DOWNSAMPLING Downsample SRC substituting pixel with square.
%   DOWNSAMPLING(SRC,EDGE) downsamples input image SRC by keeping every
%   EDGE-th sample starting with the first.
%
%   % Example 1:
%   %   Downsample with squares of size 3x3, 5x5 and 7x7.
%   
%    orig=imread('profile.jpg');
%    for edge=3:2:7
%        im=downSampling(orig, edge);
%        imshow(im);
%        pause
%    end

% Copyright 2015 Gionata Massi

if  mod(edge, 2) == 0
    edge = edge + 1;
end
[rows, cols, depth] = size(src);
dst = src;    
firstPixel = floor((edge + 1)/2);
halfDisplacement = firstPixel-1;
for h=firstPixel:edge:rows - halfDisplacement
    for k=firstPixel:edge:cols - halfDisplacement
        for d = 1:depth
            t = h-halfDisplacement;
            b = h+halfDisplacement;
            l = k-halfDisplacement;
            r = k+halfDisplacement;
            B = src(t:b,l:r,d);
            average = mean(B(:));
            A = ones(edge, edge) .* average;
            dst(t:b,l:r,d) = A;
        end
    end
end

% [EOF]