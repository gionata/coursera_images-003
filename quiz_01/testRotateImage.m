function testRotateImage
%TESTROTATEIMAGE test rotateImage.
%   TESTROTATEIMAGE test the rotateImage function
%
% See also ROTATEIMAGE

% Copyright 2015 Gionata Massi

src=imread('profile.jpg');
steps = 21;
figure;
for k=0:steps-1
    angle = 2*pi/(steps-1)*k;
    dst=rotateImage(src, angle);
    imshow(dst);
    imgTitle = sprintf ('Angle: %f rad (%f degree)', angle, angle*180/pi);
    title (imgTitle);
    pause
end

% [EOF]