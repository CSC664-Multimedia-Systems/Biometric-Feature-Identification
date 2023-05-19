rice = imread('rice.png');
bw = imbinarize(rice);

list = region_list(bw);

new_image = zeros(size(rice));

% Show purposes
% TODO loop through each region
% Draw the specific region
regions = list{1,50};
[rows, cols] = size(regions);
for row = 1:rows
    for col = 1:cols
        x = regions(row,1);
        y = regions(row,2);
        new_image(x,y) = 255;
    end
end

% Build a covariance matrix
center = mean(regions);
[region_size,~] = size(regions);
if region_size == 1
    return;
end
% Transform each pixel and rotate it to the x-axis
% Get each intensity value from each pixel
% Calculate and see the histogram at the x-axis
% Use Otsu's algorithm for threshold
% Wild Guess (Maybe calculate the center)
[image_height, image_width] = size(new_image);
image_centers = zeros(image_height, image_width,3);
color_of_centers = [255,0,0];

x = int32(center(1));
y = int32(center(2));

red = color_of_centers(1);
green = color_of_centers(2);
blue = color_of_centers(3);
image_centers(x,y,1) = red;
image_centers(x,y,2) = green;
image_centers(x,y,3) = blue;

covariance_matrix = cov(regions);

% fused_image = imfuse(rice, image_centers, 'blend');
% imshow(fused_image);


% x1 = x;
% y1 = y;
% x2 = x+round(most_significant_vector(1));
% y2 = y+round(most_significant_vector(2));
% x1 = x;
% y1 = y;
% x2 = x+most_significant_vector(1);
% y2 = y+most_significant_vector(2);
x = regions(:,2);
y = regions(:,1);

[slope, intercept] = best_fit_line(regions);

imshow(rice)
hold on
x1 = min(x);  % Minimum x value
x2 = max(x);  % Maximum x value
y1 = intercept + slope * x1;  % Calculate y value for the minimum x value
y2 = intercept + slope * x2;  % Calculate y value for the maximum x value
plot([x1, x2], [y1, y2], 'r', 'LineWidth', 2);
hold off