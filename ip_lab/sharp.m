close all;
clearvars;
clc;

% Read the image
img = imread('cameraman.tif');  % Load the grayscale image

% Convert image to double for calculations
img = double(img);

% Create a Laplacian filter 
h_laplace = fspecial('laplacian', 0); 

% Apply the Laplacian filter
img_laplace = imfilter(img, h_laplace, 'replicate');

% Sharpen the image
img_sharpened = img - img_laplace;

% Convert back to uint8 for display
img_sharpened = uint8(img_sharpened);
img = uint8(img);

% Display the original image
figure;
imshow(img);
title('Original Image');

% Display the sharpened image
figure;
imshow(img_sharpened);
title('Sharpened Image - Laplacian filter');