% original_image = imread("rice.png");
% binary_image = imbinarize(original_image);
% 
% reg = regions(binary_image);
% 
% color_image = color_display_region(reg);

original_image = imread("../../../Data/frames_grey/0001.png");
binary_image = imbinarize(original_image);
binary_image = ~binary_image;

reg = regions(binary_image);

color_image = color_display_region(reg);