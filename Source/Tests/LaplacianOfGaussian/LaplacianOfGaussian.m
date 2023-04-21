function mask = LaplacianOfGaussian(image)
[image_height, image_width] = size(image);

mask = zeros(image_height, image_width, "uint8");

gaussian_img = gaussian_blur(image);
sobel_mask = sobel(image);
sobel_mask = uint8(sobel_mask);
sobel_mask = graythresh(sobel_mask);
laplacian_of_gaussian = laplacian(gaussian_img);
laplacian_of_gaussian = uint8(laplacian_of_gaussian);

for row = 1:image_height
    for col = 1:image_width
        if laplacian_of_gaussian(row,col) == 0 && sobel_mask(row,col) == 255
            mask(row,col) = 255;
        end
    end
end