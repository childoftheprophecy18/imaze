% Clear workspace, close all figures, and clear command window
close all;
clearvars;
clc;

% Load the grayscale image
I = imread('cameraman.tif'); % Use 'cameraman.tif' as the image file
I = double(I); % Convert to double precision for DCT

% Compute the 2D DCT of the image (this is 'u')
u = dct2(I);

% Get the size of the image
[rows, cols] = size(I);

% Create a mask to keep only the top-left 25% of the coefficients
mask = zeros(rows, cols);
r = floor(rows * 0.25); % 25% of rows
c = floor(cols * 0.25); % 25% of columns
mask(1:r, 1:c) = 1; % Top-left 25% of coefficients

% Apply the mask to the DCT coefficients
u_masked = u .* mask;

% Compute the inverse DCT to reconstruct the image
reconstructed_image = idct2(u_masked);

% Convert to uint8 for display
I = uint8(I);
reconstructed_image = uint8(reconstructed_image);

% Display the original image
figure;
imshow(I);
title('Original Image');

% Display the reconstructed image using 25% DCT coefficients
figure;
imshow(reconstructed_image);
title('Reconstructed Image from 25% DCT Coefficients');
