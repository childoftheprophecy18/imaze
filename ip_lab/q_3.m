close all;
clearvars;
clc;

% Read the RGB image
originalImage = imread('xp.jpg'); % Replace 'your_image.jpg' with your image file

% Extract R, G, B channels
R = originalImage(:,:,1); % Red channel
G = originalImage(:,:,2); % Green channel
B = originalImage(:,:,3); % Blue channel

% Display the extracted channels
figure;
subplot(2,2,1), imshow(originalImage), title('Original Image');
subplot(2,2,2), imshow(R), title('Red Channel');
subplot(2,2,3), imshow(G), title('Green Channel');
subplot(2,2,4), imshow(B), title('Blue Channel');

% Reconstruct the original image
reconstructedImage = cat(3, R, G, B);

% Display the reconstructed image
figure;
imshow(reconstructedImage);
title('Reconstructed Image');
