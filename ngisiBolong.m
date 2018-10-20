function ngisiBolong

F = imread('hasil1.jpg');


for i=111:136
    F(1,i) = 255;
end;

for i=543:583
    F(1,i) = 255;
end;

F = imfill(F, 'holes');
H = im2bw(F);
G = bwconncomp(H);
I = regionprops(G, 'Area');
J = find([I.Area]>800);
K = ismember(labelmatrix(G),J);

imshow(F);

figure, imshow(K);