function result = naive_detection_algorithm(fish)
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
    
    %centroids = cat(1, props.Centroid);
    centroids = cat(1, props.WeightedCentroid);
    
    [image_height, image_width] = size(fish);
    result = false(image_height, image_width);
    
    for i = 1:length(centroids)
        x = round(centroids(i,2));
        y = round(centroids(i,1));
        result(x,y) = true;
    end
end