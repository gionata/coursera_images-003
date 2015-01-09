function testDownSampling
%TESTDOWNSAMPLING test downSampling.
%   TESTDOWNSAMPLING test the downSampling function
%
% See also DOWNSAMPLING

% Copyright 2015 Gionata Massi

    orig=imread('profile.jpg');
    for edge=1:2:9
        im=downSampling(orig, edge);
        figure;
        imshow(im);
        pause
    end
end

% [EOF]