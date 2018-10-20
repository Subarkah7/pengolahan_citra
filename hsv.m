function HSV 

F = imread('Kasus7.jpg');
HSV = rgb2hsv(F);
H = HSV(:,:,3);

range = [280 300]/360;
mask = (H>range(1)) & (H<range(2));


I = imapporx(F);
figure, imshow(I);