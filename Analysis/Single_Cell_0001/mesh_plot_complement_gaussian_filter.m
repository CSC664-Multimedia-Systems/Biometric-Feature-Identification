[rgb_value, cmap] = imread("../../Data/frames_grey/0001.png");
[image_height, image_width] = size(rgb_value);

X = ones(image_height, image_width); 
for i = 1:image_width
    X(:, i) = i;
end
Y = ones(image_height, image_width);
for i = 1:image_height
    Y(i,:) = i;
end

normal = 255 - rgb_value;
normal = histeq(normal);
title('normal');
mesh(X,Y,normal);