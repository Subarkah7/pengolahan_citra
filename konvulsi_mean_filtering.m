function meanFiltering
F = imread('grayErythrocytes.jpg');
[r, c] = size(F);
G = zeros(r,c);
h = (1/9)*ones(3,3);
G = conv2(F,h, 'same');
G = uint8(G);

subplot(2,2,1), title('Asli'), imshow(F), subplot(2,2,2), title('hasil'), imshow(G)
subplot(2,2,3), title('Hist Asli'), imhist(F), subplot(2,2,4), title('Hist Hasil'), imhist(G)