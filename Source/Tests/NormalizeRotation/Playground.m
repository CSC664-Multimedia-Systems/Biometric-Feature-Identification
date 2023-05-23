image = imread('../../../Data/frames_grey/0001.png');

% Adaptive Thresholding Test
T = adaptthresh(image, 0, "ForegroundPolarity", "dark");
adaptive_thresholded_image = imbinarize(image, T);

adaptive_thresholded_image = ~adaptive_thresholded_image;

dilate_body = strel('square', 2);
fish_body = imdilate(adaptive_thresholded_image, dilate_body);

region_orientation(fish_body);