rice = imread("rice.png");
rice = imbinarize(rice);
m = regions(rice);

[image_height, image_width] = size(m);
color_image = uint8(255 * ones(size(rice, 1), size(rice, 2), 3));

for row = 2:image_height
    for col = 2:image_width
        color_image(row, col, :) = [mod(m(row,col), 100), mod(m(row,col), 255), mod(m(row,col), 150)];
    end
end