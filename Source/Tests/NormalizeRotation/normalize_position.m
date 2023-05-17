rice = imread('rice.png');
bw = imbinarize(rice);

list = region_list(bw);

new_image = zeros(size(rice));

% Show purposes
% TODO loop through each region
% Draw the specific region
regions = list{1,1};
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
% Transform each pixel and rotate it to the x-axis
% Get each intensity value from each pixel
% Calculate and see the histogram at the x-axis
% Use Otsu's algorithm for threshold
% Wild Guess (Maybe calculate the center)

image_centers = zeros(rows, cols,3);
color_of_centers = [255,0,0];
for row = 1:rows
    for col = 1:cols
        x = center(row,1);
        y = center(row,2);

        red = color_of_centers(1);
        green = color_of_centers(2);
        blue = color_of_centers(3);
        image_centers(x,y,1) = red;
        image_centers(x,y,2) = green;
        image_centers(x,y,3) = blue;
    end
end


imshow(rice)
hold on
imshow(image_centers);
hold on
imshow(new_image);