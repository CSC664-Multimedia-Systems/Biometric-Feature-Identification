%v = VideoReader("X265-Crf15-1.mp4");
%n = 0;
%number_of_frames = 2;
%{
while n < 2
    frame = readFrame(v);
    %gray = rgb2gray(frame);
    imshow(frame);
    number_of_frames = number_of_frames + 1;
end
%}

[rgb_value, cmap] = imread("Custom_Data/frames_single_fish/0003.png");
[image_height, image_width] = size(rgb_value);

%frame = readFrame(v);
% Here we create the X and Y space
% We want to make sure that the X and Y coordinates are
% evenly spaced.
X = ones(image_height, image_width); 
for i = 1:image_width
    X(:, i) = i;
end
Y = ones(image_height, image_width);
for i = 1:image_height
    Y(i,:) = i;
end

%normal = 255-rgb_value; % Inversed intensity
normal = rgb_value;

%mesh(X,Y,normal);
%imshow(rgb_value);
colorbar();
histogram(normal);