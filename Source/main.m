fprintf("----- Weighted Centroid -----\n");
full_test(@algorithm_weighted_centroid);
fprintf("----- Centroid -----\n");
full_test(@algorithm_centroid);
fprintf("----- Centroid of the Body Parts -----\n");
full_test(@algorithm_centroid_parts);


% ----------------------------------------------
% Coming up with algorithms
% ----------------------------------------------
% fish = imread("../Data/frames_grey/0001.png");
% 
% sobel_img = sobel(fish);
% sobel_mask = imbinarize(sobel_img); % Otsu's algorithm
% 
% % Pretty Good Region Representation
% dilate_se = strel('square', 2);
% dilated_image = imdilate(sobel_mask, dilate_se);
% canny_img = edge(fish, 'canny');
% dilated_blur = uint8(dilated_image) * 255;
% dilated_blur = gaussian_blur(dilated_blur);
% new_blur = imbinarize(dilated_blur);
% 
% new_img = new_blur & canny_img;
% 
% % Adaptive Thresholding Test
% T = adaptthresh(fish, 0, "ForegroundPolarity", "dark");
% adaptive_threshold_test = imbinarize(fish, T);
% 
% adaptive_threshold_test = ~adaptive_threshold_test;
% 
% erode_se = strel('square', 2);
% eroded_image = imerode(adaptive_threshold_test, erode_se);
% 
% % adaptive, erode, AND region
% adaptive_erode_region = new_blur & eroded_image;
% 
% dilate_body = strel('square', 2);
% fish_body = imdilate(adaptive_threshold_test, dilate_body);
% % props = regionprops(adaptive_erode_region, 'Centroid');
% props = regionprops(fish_body, fish, 'WeightedCentroid');
% 
% %centroids = cat(1, props.Centroid);
% centroids = cat(1, props.WeightedCentroid);
% 
% [image_height, image_width] = size(fish);
% result = false(image_height, image_width);
% 
% for i = 1:length(centroids)
%     x = round(centroids(i,2));
%     y = round(centroids(i,1));
%     result(x,y) = true;
% end
% 
% % Convert the image to RGB
% display_image = repmat(fish, [1 1 3]);
% for row = 1:image_height
%     for col = 1:image_width
%         if(result(row,col) == true)
%             display_image(row,col,1) = 255;
%         end
%     end
% end
% 
% imshow(display_image);

% ----------------------------------------------
% LoG Image
% ----------------------------------------------
% image = imread("../Data/frames_grey/0020.png");
% [image_height, image_width] = size(image);
% 
% mask = zeros(image_height, image_width, "uint8");
% 
% % Gaussian Blur on original image
% gaussian_img = gaussian_blur(image);
% 
% % Sobel algorithm to get the gradient of the original image
% sobel_mask = sobel(image);
% % Threshold for local min/max
% sobel_mask = imbinarize(sobel_mask); % Otsu's algorithm
% 
% % Apply Laplacian on the Gaussian Blurred image
% laplacian_of_gaussian = laplacian(gaussian_img);
% laplacian_of_gaussian = uint8(laplacian_of_gaussian);
% 
% % Zero crossing while also considering threshold on the first derivative
% for row = 1:image_height
%     for col = 1:image_width
%         if laplacian_of_gaussian(row,col) == 0 && sobel_mask(row,col) == 1
%             mask(row,col) = 255;
%         end
%     end
% end
% 
% imshow(mask);