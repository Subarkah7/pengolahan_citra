function mainProject2

CitraAsli = imread('Kasus7.jpg');

%preprocessing
CitraGray = rgb2gray(CitraAsli);


%Gaussian Filtering

Gauss = gaussianKernel;
Gaussian = conv2(double(CitraGray), Gauss, 'same');
Konvolusi = uint8(Gaussian);


%segmentasi dengan thresholding menggunakan metode otsu
[baris, kolom] = size(CitraGray);
Level = graythresh(Konvolusi);
TH = Level*247;
Konvolusi = zeros(baris,kolom);
for i=1:baris
    for j=1:kolom
        if CitraGray(i,j) < TH
            Konvolusi(i,j) = 1;
        end
    end
end
KonvolusiFill = imfill(Konvolusi, 'holes');


%mengisi yang masih kosong
for i=111:136
    KonvolusiFill(1,i) = 255;
end;

for i=543:583
    KonvolusiFill(1,i) = 255;
end;

Fill2 = imfill(KonvolusiFill, 'holes');
Fill2 = im2bw(Fill2);


%proses segmentasi grayscale
[r,c] = size(Fill2);
SegmentasiGray1 = zeros(r,c);
for i=1:r
    for j=1:c
        if Fill2(i,j) == 1
            SegmentasiGray1(i,j) = CitraGray(i,j);
        end
    end
end
SegmentasiGray1 = uint8(SegmentasiGray1);


%mencari sel
Labeled = bwlabel(Fill2);
Find = regionprops(Fill2, SegmentasiGray1, 'MeanIntensity', 'Area');
FindCell = ismember(Labeled, find([Find.MeanIntensity]> 172));
FindNoise = ismember(Labeled, find([Find.Area]<800));

Sel = xor(FindNoise, Labeled);      %hilangkan noise dari Labeled
Parasit = xor(FindCell, Labeled);   %hilangkan sel dan noise dari Labeled
Sel2 = xor(Sel,Parasit);            %hilangkan parasit dan noise
[label, num] = bwlabel(Sel2);
num;

%segmentasi grayscale
[b,k] = size(Sel2);
SegmentasiGray = zeros(b,k);

for i=1:b
    for j=1:k
        if Sel2(i,j) == 1
            SegmentasiGray(i,j) = CitraGray(i,j);
        end
    end
end
SegmentasiGray = uint8(SegmentasiGray);

%tampilkan gambar
figure, subplot(3,3,1), imshow(CitraAsli), title('Citra Asli')
subplot(3,3,2), imshow(CitraGray), title('Citra Grayscale')
subplot(3,3,3), imshow(Konvolusi), title('Thresholding')
subplot(3,3,4), imshow(KonvolusiFill), title('Fill holes')
subplot(3,3,5), imshow(Fill2), title('Segmentasi 2')
subplot(3,3,6), imshow(Parasit), title('Parasit')
subplot(3,3,7), imshow(FindNoise), title('Noise')
subplot(3,3,8), imshow(Sel2), title('Sel')
subplot(3,3,9), imshow(SegmentasiGray), title('Segmentasi Grayscale')