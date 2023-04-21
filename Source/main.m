image = imread("../Data/frames_grey/0010.png");
[image_height, image_width] = size(image);

mask = zeros(image_height, image_width, "uint8");

% Gaussian Blur on original image
gaussian_img = gaussian_blur(image);

% Sobel algorithm to get the gradient of the original image
sobel_mask = sobel(image);
% Threshold for local min/max
sobel_mask = imbinarize(sobel_mask); % Otsu's algorithm

% Apply Laplacian on the Gaussian Blurred image
laplacian_of_gaussian = laplacian(gaussian_img);
laplacian_of_gaussian = uint8(laplacian_of_gaussian);

% Zero crossing while also considering threshold on the first derivative
for row = 1:image_height
    for col = 1:image_width
        if laplacian_of_gaussian(row,col) == 0 && sobel_mask(row,col) == 1
            mask(row,col) = 255;
        end
    end
end