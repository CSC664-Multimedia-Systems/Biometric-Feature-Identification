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

    sum_sobel = x_sobel.^2 + y_sobel.^2;
    magnitude = sqrt(sum_sobel);

%     mask = zeros(image_height, image_width);
%     mask = uint8(mask);
%     for row = 1:image_height
%         for col = 1:image_width
%             if magnitude(row,col) > threshold
%                 mask(row,col) = 255;
%             end
%         end
%     end
%     result = mask;
     result = magnitude;
%     result = int32(result);
end