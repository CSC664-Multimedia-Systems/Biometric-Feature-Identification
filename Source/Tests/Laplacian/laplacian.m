function result = laplacian(image)
%     laplacian_kernel = [1 4 1; 
%                         4 -20 4; 
%                         1 4 1];
    laplacian_kernel = [0 1 0;
                        1 -4 1;
                        0 1 0;];
%     laplacian_kernel = [1 2 1;
%                         2 -12 2;
%                         1 2 2;];
%     laplacian_kernel = [0.25 0.5 0.25;
%                         0.5 -3.0 0.5;
%                         0.25 0.5 0.25;];
    laplace_image = conv2(double(image), laplacian_kernel, "same");
    result = laplace_image;
%     abs_laplacian = abs(laplace_image);
%     normalized_laplacian = uint8(abs_laplacian / max(abs_laplacian(:)) * 255);
%     result = normalized_laplacian;
end
