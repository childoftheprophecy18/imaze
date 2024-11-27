close all;
clearvars;
clc;

%Read the image
img = imread('cameraman.tif');

%Converting to grayscale if the image is colored
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Converting the image to double format
gray_img = double(gray_img);

% Define the masks or filters for each operator
% Sobel masks
sobel_x = [-1 0 1; -2 0 2; -1 0 1];
sobel_y = [-1 -2 -1; 0 0 0; 1 2 1];

% Prewitt masks
prewitt_x = [-1 0 1; -1 0 1; -1 0 1];
prewitt_y = [-1 -1 -1; 0 0 0; 1 1 1];

% Roberts masks
roberts_x = [1 0; 0 -1];
roberts_y = [0 1; -1 0];

% Initialize matrices for edge-detected images for each operator
[m, n] = size(gray_img);
sobel_edges = zeros(m, n);
prewitt_edges = zeros(m, n);
roberts_edges = zeros(m, n);

% Step 5: Detect edges a
% long X-axis and Y-axis and combine for each operator

% Sobel operator
for i = 2:m-1
    for j = 2:n-1
        Gx = sum(sum(sobel_x .* gray_img(i-1:i+1, j-1:j+1)));
        Gy = sum(sum(sobel_y .* gray_img(i-1:i+1, j-1:j+1)));
        sobel_edges(i, j) = sqrt(Gx^2 + Gy^2);
    end
end

% Prewitt operator
for i = 2:m-1
    for j = 2:n-1
        Gx = sum(sum(prewitt_x .* gray_img(i-1:i+1, j-1:j+1)));
        Gy = sum(sum(prewitt_y .* gray_img(i-1:i+1, j-1:j+1)));
        prewitt_edges(i, j) = sqrt(Gx^2 + Gy^2);
    end
end

% Roberts operator
for i = 1:m-1
    for j = 1:n-1
        Gx = sum(sum(roberts_x .* gray_img(i:i+1, j:j+1)));
        Gy = sum(sum(roberts_y .* gray_img(i:i+1, j:j+1)));
        roberts_edges(i, j) = sqrt(Gx^2 + Gy^2);
    end
end

% Displaying all the images
figure;
% subplot(2,2,1);
imshow(uint8(gray_img));
title('Grayscale Image');

%subplot(2,2,2);
figure;
imshow(uint8(sobel_edges));
title('Sobel Edge Detection');

%subplot(2,2,3);
figure;
imshow(uint8(prewitt_edges));
title('Prewitt Edge Detectn');

%subplot(2,2,4);
figure;
imshow(uint8(roberts_edges));
title('Roberts Edge Detection');