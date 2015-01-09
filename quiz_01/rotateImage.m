function dst = rotateImage(src, rad)
%ROTATEIMAGE rotate an image.
%   ROTATEIMAGE rotate an image of RAD radiants.
%
%   % Example 1
%   %   Rotate and image by 45 and 90 degrees
%
%   orig=imread('profile.jpg');
%   for a=[pi/4 pi/2]
%      dst=rotateImage(orig, a);
%      imshow(dst);
%      pause
%   end

% Copyright 2015 Gionata Massi

[rows, cols, depth] = size(src);
radius = ceil(norm([rows, cols], 2));
diameter=2*radius;
dst1=zeros(diameter, diameter, depth, 'uint8');
c = cos(rad);
s = sin(rad);
rt=[c s; -s c];
xmin = diameter;
xmax = 1;
ymin = diameter;
ymax = 1;
for h = 1:diameter
    for k = 1:diameter
        w = rt * [h-radius; k-radius];
        if (w(1) >= 1 && w(2) >= 1 && w(1) <= rows && w(2) <= cols)
            x1=floor(w(1));
            y1=floor(w(2));
            if h < xmin
                xmin = h;
            end
            if h > xmax
                xmax = h;
            end
            if k < ymin
                ymin = k;
            end
            if k > ymax
                ymax = k;
            end
            for d=1:depth
                dst1(h, k, d) = src(x1, y1, d);
            end
        end
    end
end
dst=dst1(xmin:xmax,ymin:ymax,1:depth);