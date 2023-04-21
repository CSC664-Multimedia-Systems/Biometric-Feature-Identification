% DO NOT USE THIS SCRIPT
% It's very old and doesn't produce meaningful data.

[rgb_value, cmap] = imread("../Data/frames_grey/0100.png");
[image_height, image_width] = size(rgb_value);

mask = zeros(image_height, image_width, "uint8");

gaussian_img = gaussian_blur(rgb_value);
gaussian_img = gaussian_blur(gaussian_img);
%gaussian_img = imgaussfilt(rgb_value, 1);
%gaussian_img = uint8(gaussian_img);
sobel_mask = sobel(rgb_value);
laplacian_of_gaussian = laplacian(gaussian_img);
laplacian_of_gaussian = abs(laplacian_of_gaussian);
laplacian_of_gaussian = uint8(laplacian_of_gaussian);

for row = 1:image_height
    for col = 1:image_width
        if laplacian_of_gaussian(row,col) < 20 && sobel_mask(row,col) == 255
            mask(row,col) = 255;
        end
    end
end
imshow(mask);