%function result = sobel(image, threshold)
function result = sobel(image)
    x_kernel = [-1 0 1; 
                -2 0 2;
                -1 0 1;];
    y_kernel = [1, 2, 1;
                0, 0, 0;
                -1, -2, -1;];
%    x_kernel = [-3 0 3; 
%                -10 0 10;
%                 -3 0 3;];
%     y_kernel = [3, 10, 3;
%                 0, 0, 0;
%                 -3, -10, -3;];
    x_sobel = conv2(double(image), x_kernel, "same");
    y_sobel = conv2(double(image), y_kernel, "same");

    % Sum the squares
    sum_sobel = x_sobel.^2 + y_sobel.^2;
    magnitude = sqrt(sum_sobel);
    max_mag = max(magnitude(:));

    % Usually the values can go very high so we will normalize it
    normalized = magnitude / max_mag;
    result = normalized * 255;
    result = uint8(result);
end