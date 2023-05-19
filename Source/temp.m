fish = imread("../Data/frames_grey/0050.png");

sobel_img = sobel(fish);
sobel_mask = imbinarize(sobel_img); % Otsu's algorithm

% dilate_se = strel('square', 2);
% dilated_image = imdilate(sobel_mask, dilate_se);
% erode_se = strel('square', 2);
% eroded_image = imerode(dilated_image, erode_se);

% erode_se = strel('square', 2);
% eroded_image = imerode(sobel_mask, erode_se);
% dilate_se = strel('square', 5);
% dilated_image = imdilate(eroded_image, dilate_se);
% 
% result = imsubtract(dilated_image, eroded_image);
% 
% T = adaptthresh(fish, 0.9);
% binary_img = imbinarize(fish, T);
% 
% binary_img = ~binary_img;
% erode_se = strel('square', 1);
% eroded_image = imerode(binary_img, erode_se);
% dilate_se = strel('square', 2);
% dilated_image = imdilate(eroded_image, dilate_se);

% Weird Lucky Result
% dilate_se = strel('square', 2);
% dilated_image = imdilate(sobel_mask, dilate_se);

% Pretty Good Region Representation
dilate_se = strel('square', 2);
dilated_image = imdilate(sobel_mask, dilate_se);
canny_img = edge(fish, 'canny');
dilated_blur = uint8(dilated_image) * 255;
dilated_blur = gaussian_blur(dilated_blur);
new_blur = imbinarize(dilated_blur);

new_img = new_blur & canny_img;

% Adaptive Thresholding Test
T = adaptthresh(fish, 0, "ForegroundPolarity", "dark");
adaptive_threshold_test = imbinarize(fish, T);

adaptive_threshold_test = ~adaptive_threshold_test;

erode_se = strel('square', 2);
eroded_image = imerode(adaptive_threshold_test, erode_se);

% adaptive, erode, AND region
adaptive_erode_region = new_blur & eroded_image;

dilate_body = strel('square', 2);
fish_body = imdilate(adaptive_threshold_test, dilate_body);
% props = regionprops(adaptive_erode_region, 'Centroid');
props = regionprops(fish_body, fish, 'WeightedCentroid');

%centroids = cat(1, props.Centroid);
centroids = cat(1, props.WeightedCentroid);

% Convert the image to RGB
img_rgb = repmat(fish, [1 1 3]);

% Draw a red cross on the centroid of each region
marker_size = 0;
for k = 1:length(centroids)
    x = round(centroids(k,1));
    y = round(centroids(k,2));
    img_rgb(max(1,y-marker_size):min(size(img_rgb,1),y+marker_size), max(1,x-marker_size):min(size(img_rgb,2),x+marker_size), 1) = 255;
end