function gaussian_img = gaussian_blur(image)
gaussian_kernel = [1, 1, 2, 2, 2, 1, 1;
                    1, 2, 2, 4, 2, 2, 1;
                    2, 2, 4, 8, 4, 2, 2,;
                    2, 4, 8, 16, 8, 4, 2;
                    2, 2, 4, 8, 4, 2, 2;
                    1, 2, 2, 4, 2, 2, 1;
                    1, 1, 2, 2, 2, 1, 1;];
gaussian_img = conv2(double(image), gaussian_kernel, "same");
gaussian_img = imdivide(gaussian_img, 140);
gaussian_img = uint8(gaussian_img);
end