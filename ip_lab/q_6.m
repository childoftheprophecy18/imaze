% Close all figures, clear variables, and clear command window
close all;
clearvars;
clc;

% Read the image
img = imread('xp.jpg');

% Ensure the image is grayscale
if size(img, 3) == 3
    img = rgb2gray(img);
end

% Display the grayscale image
figure;
imshow(img);
title('Grayscale Image');

% Initialize the histogram array (256 bins for grayscale)
m_hist = zeros(1, 256);

% Count the pixel intensities manually
[rows, cols] = size(img);
for i = 1:rows
    for j = 1:cols
        intensity = img(i, j);  % Get pixel intensity
        m_hist(intensity + 1) = m_hist(intensity + 1) + 1;  % Increment histogram bin
    end
end

% Plot the manually calculated histogram
figure;
bar(0:255, m_hist, 'k');  % Use black bars
title('Manually Computed Histogram');
xlabel('Pixel Intensity');
ylabel('Frequency');

% Plot the histogram of the grayscale image using imhist
figure;
imhist(img);
title('Histogram using MATLAB imhist');
xlabel('Pixel Intensity');
ylabel('Frequency');
