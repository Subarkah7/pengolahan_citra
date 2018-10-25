function pendeteksitepi

F = imread('GaussSegmentedBinary.jpg');
[r,c] = size(F);

Gx = zeros(r,c);
Gy = zeros(r,c);
G = zeros(r,c);


sx = (1/8)*[-1 0 1; -2 0 2; -1 0 1];
sy = (1/8)*[1 2 1; 0 0 0; -1 -2 -1];

Gx = conv2(double(F), sx, 'same');
Gy = conv2(double(F), sy, 'same');
absGx = uint8(abs(Gx));
absGy = uint8(abs(Gy));

Gx = uint8(Gx);
Gy = uint8(Gy);
G = absGx + absGy;


subplot(1,2,1), imshow(Gx), title('Gx'), subplot(1,2,2), imshow(absGx), title('|Gx|');
figure, subplot(1,2,1), imshow(Gy), title('Gy'),subplot(1,2,2), imshow(Gy), title('|Gy|');
figure, subplot(1,2,1), imshow(F), title('Binary'), subplot(1,2,2), imshow(G),title('Tepi/Edge');
