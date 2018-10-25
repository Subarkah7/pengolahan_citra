function meanIntensity

F = imread('Kasus7.jpg');

B = rgb2gray(F);
[r,c] = size(B);
h = gaussianKernel;
G = conv2(double(B), h, 'same');
G = uint8(G);

level = graythresh(B);
th = level*250;
G = zeros(r,c);
for i=1:r
    for j=1:c
     if B(i,j) < th
            G(i,j) = 1; 
        end
    end
end;

[baris, kolom] = size(G);
I = zeros(baris, kolom);

for x=1:baris
   for y=1:kolom
      if G(x,y) == 1
          I(x,y) = B(x,y);
      end
   end
end;

imNew = uint8(I);

s = regionprops(I, B, {'Area', 'meanIntensity'});

[L, num] = bwlabel(imNew);
Ekstraksi = regionprops('table', L, 'Area', 'Perimeter', 'Centroid');
rerata = mean([s.MeanIntensity]);
BW2 = ismember(L, find([s.MeanIntensity]< rerata));
imshow(imNew);




            
        