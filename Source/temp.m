image = imread("rice.png");

LoG_img = LaplacianOfGaussian(image);
sobel_img = sobel(image);
th_img = imbinarize(image);

fish = imread("../Data/frames_grey/0001.png");
fish_img = LaplacianOfGaussian(fish);
