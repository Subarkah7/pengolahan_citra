function pendeteksitepi_morfologi

F = imread('GaussSegmentedBinary.jpg');

%convert ke BW
I = im2bw(F);

%Bikin kerenel dengan fungsi strel properti disk dengan 4 connected
kernel = strel('disk', 4);

%jalankan fungsi imerode, citra bw dengan kernel
Terkikis = imerode(I, kernel);

Tepi = xor(Terkikis, I);

imwrite(Terkikis, 'shrink.jpg');

figure, subplot(2,2,1), imshow(Terkikis)
    subplot(2,2,2), imshow(Tepi)