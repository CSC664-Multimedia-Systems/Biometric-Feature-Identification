image = imread('../../../Data/frames_grey/0001.png');
bw = imbinarize(image);
bw = ~bw;

region_orientation(bw);