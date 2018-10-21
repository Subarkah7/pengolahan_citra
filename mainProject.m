function mainProject

CitraAsli = imread('Kasus7.jpg');
CitraGray = rgb2gray(CitraAsli);

[baris, kolom] = size(CitraGray);
Gauss = gaussianKernel;

Konvolusi = conv2(double(CitraGray), Gauss, 'same');
Konvolusi = uint8(Konvolusi);

Level = graythresh(CitraGray);
TH = Level*247;

Konvolusi = zeros(baris,kolom);

for i=1:baris
    for j=1:kolom
        if CitraGray(i,j) < TH
            Konvolusi(i,j) = 1;
        end
    end
end

[r,c] = size(Konvolusi);
CitraBaru = zeros(r,c);
Konvolusi = imfill(Konvolusi, 'holes');

for i=1:r
    for j=1:c
        if Konvolusi(i,j) == 1
            CitraBaru(i,j) = CitraGray(i,j);
        end
    end
end

CitraBaru = uint8(CitraBaru);
BW = im2bw(CitraBaru);

Inten = regionprops(BW, CitraBaru, 'MeanIntensity');
Labeled = bwlabel(BW);

Rerata = mean([Inten.MeanIntensity]);
CitraAkhir = ismember(Labeled, find([Inten.MeanIntensity]> 172));

for i=111:136
    CitraAkhir(1,i) = 255;
end;

for i=543:583
    CitraAkhir(1,i) = 255;
end;

CitraAkhir = imfill(CitraAkhir, 'holes');
CitraAkhir = im2bw(CitraAkhir);
BW1 = bwconncomp(CitraAkhir);
CitraAkhir = regionprops(BW1, 'Area');
CitraAkhir = find([CitraAkhir.Area]>800);
CitraAkhir = ismember(labelmatrix(BW1), CitraAkhir);
BW3 = im2bw(CitraAkhir);
[L, num] = bwlabel(BW3);

imshow(CitraAkhir);
figure, imshow(CitraBaru);
