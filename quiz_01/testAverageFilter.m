function testAverageFilter
%TESTAVERAGEFILTER test averageFilter.
%   TESTAVERAGEFILTER test the averageFilter function
%
% See also AVERAGEFILTER

% Copyright 2015 Gionata Massi

orig=imread('profile.jpg');
for kernelEdge=3:2:21
    dst=averageFilter(orig, kernelEdge);
    imshow(dst);
    imgTitle = sprintf ('Kernel edge: %d', kernelEdge);
    title (imgTitle);
    pause
end

 % [EOF]