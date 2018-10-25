function findNoise

F = imread('GaussSegmentedBinary.jpg');

%convert ke binary image
G = im2bw(F);

%Melabeli image
H = bwconncomp(G);

%Ekstraksi ciri area
I = regionprops(H,'Area');

%Cari objek dengan area kurang dari 400
J = find([I.Area] < 400);

%identifikasi anggota dari image yang sudah dilabeli yang termasuk bagian
%dari image hasil pencarian (J)
K = ismember(labelmatrix(H),J);



subplot(2,2,1), title('Asli'), imshow(F), subplot(2,2,2), title('Noise'), imshow(K)
subplot(2,2,3), imshow(xor(F,K))
