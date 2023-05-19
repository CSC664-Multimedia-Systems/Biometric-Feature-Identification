function result = algorithm_centroid_parts(fish)
    sobel_img = sobel(fish);
    sobel_mask = imbinarize(sobel_img); % Otsu's algorithm
    
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
    %props = regionprops(fish_body, 'Centroid');
    props = regionprops(fish_body, fish, 'WeightedCentroid');

    % 4 Connectivity Region Processing
    fish_body_parts = adaptive_threshold_test;
    [body, num_of_body] = bwlabel(fish_body,4);
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
end