close all;
clearvars;
clc;

% Read the image
img = imread('cameraman.tif');
gray_img = img;  % Directly use the grayscale image

% Add salt and pepper noise
noisy_img = imnoise(gray_img, 'salt & pepper', 0.05);

% Apply Median Filter
median_filtered_img = medfilt2(noisy_img, [3 3]);

% Apply Averaging Filter (Mean Filter)
avg_filter = fspecial('average', [3 3]);
avg_filtered_img = imfilter(noisy_img, avg_filter, 'replicate');

% Display the images for comparison
figure;
%subplot(2,2,1);
imshow(gray_img);
title('Original Grayscale Image');

%subplot(2,2,2);
figure;
imshow(noisy_img);
title('Image with Salt & Pepper Noise');

%subplot(2,2,3);
figure;
imshow(median_filtered_img);
title('Median Filtered Image');

%subplot(2,2,4);
figure;
imshow(avg_filtered_img);
title('Averaging Filtered Image');