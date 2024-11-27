close all;
clearvars;
clc;

% Read the image
A = imread('xp.jpg');

% Convert image to double for transformation
A_double = double(A);

% Parameters for power-law transformation
G = 1.5;  % Gamma value

% Normalize pixel values to [0, 1], apply power-law transformation, then scale back
B = 255 * ((A_double / 255) .^ G);

% Clip values to [0, 255] and convert back to uint8
B = uint8(min(max(B, 0), 255));

% Display the images
subplot(1,2,1);
imshow(A);
title('Original Image');

subplot(1,2,2);
imshow(B);
title('After PLT');
