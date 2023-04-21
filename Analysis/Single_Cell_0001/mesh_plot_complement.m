one = imread("../../Data/frames_grey/0001.png");
%fifty = imread("../../Data/frames_grey/0050.png");
%onefifty = imread("../../Data/frames_grey/0150.png");
%twohundred = imread("../../Data/frames_grey/0200.png");
%threehundred = imread("../../Data/frames_grey/0300.png");

%t_one = imbinarize(one, 0.35);
%eye_one = imbinarize(one, 0.19);

%[Contours,levels] = contour(one);

%for pos = 1:numel(Contours)
%    rectangle('Position', [one(1,pos),one(2,pos), 1,1], 'Curvature', [1,1]);
%end
%imshow(one);
%rectangle('Position', [30,30,30,30] , 'Curvature', [1,1]);