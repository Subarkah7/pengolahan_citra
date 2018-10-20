F = imread('Kasus7.jpg');

imgGray = rgb2gray(F);
[baris,kolom] = size(imgGray);
gauss = gaussianKernel;

G = conv2(double(imgGray), gauss, 'same');
G = uint8(G);
level = graythresh(imgGray);
th = level*247;
G = zeros(baris,kolom);

for i=1:baris
    for j=1:kolom
        if imgGray(i,j) < th
            G(i,j) =1;
        end
    end
end

[r, c] = size(G);
H = zeros(r,c);
G2 = imfill(G, 'holes');

for i=1:r
    for j=1:c
        if G2(i,j) == 1
           H(i,j) = imgGray(i,j);
        end
    end
end


imNew = uint8(H);
Bw = im2bw(imNew);
inten = regionprops(Bw, imNew, 'MeanIntensity');

Labeled = bwlabel(Bw);
rerata = mean([inten.MeanIntensity]);
BW2 = ismember(Labeled, find([inten.MeanIntensity]> 180));
BW7 = ismember(Labeled, find([inten.MeanIntensity]> 172));



Deteksi = F(:,:,3);
CitraKeunguan = imsubtract(Deteksi,imgGray);
BW3 = im2bw(CitraKeunguan, 0.2001);
BW4 = imfill(BW3, 'holes');
BW5 = bwmorph(BW4, 'erode');
BW6 = bwmorph(BW7, 'dilate', 1);
BW9 = regionprops(BW6, 'area');
rataarea = mean([BW9.Area]);
Labeled1 = bwlabel(BW6);
BW10 = ismember(Labeled1, find([BW9.Area]>rataarea));

imwrite(BW7, 'hasil1.jpg');
imshow(BW7);
figure, imshow(F);
