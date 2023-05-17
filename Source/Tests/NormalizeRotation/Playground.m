image = imread('../../../Data/frames_binary/0001.png');

% Tried converting image to [row,col,intensity] didn't get meaningful
% result
[rows, cols] = size(image);
% Initialize new matrix
new_matrix = zeros(rows*cols,3);

% Loop through each pixel in the image
% Converts image into [row, col, intensity]
for row = 1:rows
    for col = 1:cols
        % Add values to new matrix
        index = (row-1)*cols + col;
        intensity = image(row,col);
        new_matrix(index, :) = [row, col, intensity];
    end
end

%reg = bwlabel(image);
reg = regionprops(image, 'all');

[T,S,D] = pca(new_matrix, 1);

reconstruction = T * S * D;
