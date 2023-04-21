image = imread('../../../Data/frames_grey/0004.png');

smoothed_image = imgaussfilt(image, 1);
gaussian_img = gaussian_blur(image);

result = double(smoothed_image) - double(gaussian_img);