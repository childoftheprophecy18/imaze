close all;
clearvars;
clc;

% Read the image
img = imread('xp.jpg');

% Convert the image to grayscale if it's not already
if size(img, 3) == 3
    grayImg = rgb2gray(img);
else
    grayImg = img;
end

% Display the original grayscale image
figure;
imshow(grayImg);
title('Original Grayscale Image');

% Perform histogram equalization
equalizedImg = histeq(grayImg);

% Display the histogram of the original image
figure;
imhist(grayImg);
title('Histogram of Original Image');

% Display the histogram of the equalized image
figure;
imhist(equalizedImg);
title('Histogram of Equalized Image');

% Display the equalized image in a new figure
figure;
imshow(equalizedImg);
title('Equalized Image');