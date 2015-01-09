function dst = averageFilter(src,kernelEdge)
%AVERAGEFILTER average filter.
%   AVERAGEFILTER(SRC,KERNELEDGE) filters the image SRC replacing each
%   pixel with the average of the pixel inside a square with center in the
%   pixel and edge of length KERNELEDGE.
%
%   % Example 1:
%   %   Apply the filter of size 3x3, 5x5 and 7x7.
%
%   src=imread('profile.jpg');
%   for kernelEdge=3:2:7
%      dst=averageFilter(src, kernelEdge);
%      imshow(dst);
%      pause
%   end

% Copyright 2015 Gionata Massi

[rows, cols, depth] = size(src);
dst = zeros(rows, cols, depth, 'uint8');
kernelEdge=uint8(kernelEdge);
halfDisplacement = idivide(kernelEdge, 2, 'floor');
for r = 1:rows
    ymin = max(1, r - halfDisplacement);
    ymax = min(r + halfDisplacement, rows);         
    for c = 1:cols
        xmin = max(1, c - halfDisplacement);
        xmax = min(c + halfDisplacement, cols);

        for d = 1:depth
            B = src(ymin:ymax,xmin:xmax,d);
            average = uint8(mean(B(:)));
            dst(r,c,d) = average;
        end
    end
end

% [EOF]