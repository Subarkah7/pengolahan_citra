gambar = imread('Normal-bovine-erythrocytes.jpg');
mask = [-1 -1 -1; -1 8 -1; -1 -1 -1];
gray = rgb2gray(gambar);
tresh = graythresh(gray);
imbw = im2bw(gray, tresh);
hasil = conv2(double(imbw), mask, 'valid');
imshow(gambar)
figure, imshow(hasil)