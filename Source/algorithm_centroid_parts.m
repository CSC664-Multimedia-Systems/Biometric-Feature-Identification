function result = algorithm_centroid_parts(fish)
    % Adaptive Thresholding Test
    T = adaptthresh(fish, 0, "ForegroundPolarity", "dark");
    adaptive_thresholded_image = imbinarize(fish, T);
    
    adaptive_thresholded_image = ~adaptive_thresholded_image;
    
    dilate_body = strel('square', 2);
    fish_body = imdilate(adaptive_thresholded_image, dilate_body);

    % 4 Connectivity Region Processing
    fish_body_parts = adaptive_thresholded_image;
    [body, ~] = bwlabel(fish_body,4);
    fish_body_parts = body .* fish_body_parts;

    [image_height, image_width] = size(fish);
    result = false(image_height, image_width);
    max_parts = max(fish_body_parts(:));
    for body_parts = 1:max_parts
        [x,y] = find(fish_body_parts == body_parts);
        mean_x = round(mean(x));
        mean_y = round(mean(y));
        result(mean_x, mean_y) = true;
    end

%     % Convert result and adaptive_thresholded_image to RGB
%     result_rgb = cat(3, result, zeros(image_height, image_width), zeros(image_height, image_width));
%     adaptive_threshold_rgb = cat(3, adaptive_thresholded_image, adaptive_thresholded_image, adaptive_thresholded_image);
%     
%     % Overlay the red color on adaptive_thresholded_image using the result image as a mask
%     overlaid_image = adaptive_threshold_rgb;
%     overlaid_image = imfuse(overlaid_image, result_rgb, 'blend');
%     
%     % Display the overlaid image
%     imshow(overlaid_image);
end