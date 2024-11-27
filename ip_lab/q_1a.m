close all;
clearvars;
clc;

% Read the image
a = imread('xp.jpg');

% Convert image to grayscale
x = rgb2gray(a);

% Display images in a single figure with subplots
figure;

% Display the original image
subplot(1, 2, 1);  % 1 row, 2 columns, 1st subplot
imshow(a);
title('Original Image');

% Display the grayscale image
subplot(1, 2, 2);  % 1 row, 2 columns, 2nd subplot

imshow(x);
title('Grayscale Image');
