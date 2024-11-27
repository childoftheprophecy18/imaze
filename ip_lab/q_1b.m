close all;
clearvars;
clc;

% Read the image
a = imread('xp.jpg');

% Convert the image to grayscale
x = rgb2gray(a);

% Create a figure for displaying both images
figure;

% Display the grayscale image
subplot(2, 1, 1);  % 1 row, 2 columns, 1st subplot
imshow(x);
title('Grayscale Image');

% Negate the grayscale image
neg_x = 255 - x;

% Display the negated grayscale image
subplot(2, 1, 2);  % 1 row, 2 columns, 2nd subplot
imshow(neg_x);
title('Negated Grayscale Image');
