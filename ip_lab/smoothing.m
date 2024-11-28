close all;
clearvars;
clc;

% Read the image
img = imread('cameraman.tif');  % Load the grayscale image

% Apply a 3x3 average filter
h_avg = fspecial('average', [3 3]);  
img_avg = imfilter(img, h_avg, 'replicate');  % Apply the average filter

% Gaussian filter with a standard deviation of 0.5
h_gaussian = fspecial('gaussian', [3 3], 0.5);  
img_gaussian = imfilter(img, h_gaussian, 'replicate');  

% Displaying the original image 
figure;
imshow(img);
title('Original Image');

figure;
imshow(img_avg);
title('Averaged Image (3x3)');

figure;
imshow(img_gaussian);
title('Gaussian Filtered Image (3x3, \sigma = 0.5)');
