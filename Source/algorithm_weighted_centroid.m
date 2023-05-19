function result = algorithm_weighted_centroid(fish)
    % Adaptive Thresholding Test
    T = adaptthresh(fish, 0, "ForegroundPolarity", "dark");
    adaptive_thresholded_image = imbinarize(fish, T);
    
    adaptive_thresholded_image = ~adaptive_thresholded_image;
    
    dilate_body = strel('square', 2);
    fish_body = imdilate(adaptive_thresholded_image, dilate_body);
    %props = regionprops(fish_body, 'Centroid');
    props = regionprops(fish_body, fish, 'WeightedCentroid');
    
    %centroids = cat(1, props.Centroid);
    centroids = cat(1, props.WeightedCentroid);
    
    [image_height, image_width] = size(fish);
    result = false(image_height, image_width);
    
    for i = 1:length(centroids)
        x = round(centroids(i,2));
        y = round(centroids(i,1));
        result(x,y) = true;
    end

%     % Convert result and adaptive_thresholded_image to RGB
%     result_rgb = cat(3, result, zeros(image_height, image_width), zeros(image_height, image_width));
%     adaptive_threshold_rgb = cat(3, fish_body, fish_body, fish_body);
%     
%     % Overlay the red color on adaptive_thresholded_image using the result image as a mask
%     overlaid_image = adaptive_threshold_rgb;
%     overlaid_image = imfuse(overlaid_image, result_rgb, 'blend');
%     
%     % Display the overlaid image
%     imshow(overlaid_image);
end