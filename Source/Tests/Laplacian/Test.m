subject = imread("../../../Data/frames_grey/0004.png");
gray = im2gray(subject);

test = uint8(abs(laplacian(gray)));
