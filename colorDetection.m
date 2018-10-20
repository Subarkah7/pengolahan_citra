function colorDetection

F = imread('Kasus7.jpg');
G = F(:,:,3);
H = rgb2gray(F);
I = imsubtract(G, H);
J = im2bw(I, 0.2001);
K = im2bw(H);





subplot(2,2,1), imshow(F);
subplot(2,2,2), imshow(G);
subplot(2,2,3), imshow(I);
subplot(2,2,4), imshow(J);

figure, imshow(G);