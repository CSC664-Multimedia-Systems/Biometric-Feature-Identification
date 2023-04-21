subject = imread("subject.PNG");
gray = im2gray(subject);

test = sobel(gray);
sobel_img = sobel(gray);

result = sobel_img - test;
ret = sum(result(:));