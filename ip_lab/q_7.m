close all;
clearvars;
clc;

% Read the image
img = imread('cameraman.tif');

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

% Get the size of the image
[rows, cols] = size(grayImg);
total_pixels = rows * cols;

% Compute the histogram of the original image
m_hist = zeros(1, 256);
for i = 1:rows
    for j = 1:cols
        intensity = grayImg(i, j);
        m_hist(intensity + 1) = m_hist(intensity + 1) + 1;
    end
end

% Compute the CDF (Cumulative Distribution Function)
cdf = zeros(1, 256);
cdf(1) = m_hist(1);
for k = 2:256
    cdf(k) = cdf(k - 1) + m_hist(k);
end

% Normalize the CDF to the range [0, 255]
cdf_n = round((cdf - cdf(1)) / (total_pixels - 1) * 255);

% Map the original grayscale image to the equalized values using the CDF
eq_Img = zeros(rows, cols);
for i = 1:rows
    for j = 1:cols
        eq_Img(i, j) = cdf_n(grayImg(i, j) + 1);
    end
end
eq_Img = uint8(eq_Img);  % Convert to uint8 for display

% Compute the histogram of the equalized image manually
eq_hist_counts = zeros(1, 256);
for i = 1:rows
    for j = 1:cols
        intensity = eq_Img(i, j);
        eq_hist_counts(intensity + 1) = eq_hist_counts(intensity + 1) + 1;
    end
end

% Display the histogram of the original image using imhist
figure;
imhist(grayImg);
title('Histogram of (Original Image)');

% Display the manually computed histogram of the equalized image in blue
figure;
bar(0:255, eq_hist_counts, 'BarWidth', 1);
colormap(gray(256)); % Apply grayscale color map
title('Manually Coomputed Histogram (eq Img)');
xlabel('Intensity value');
ylabel('Pixel Count')
xlim([0 255]);

% Display the equalized image in a new figure
figure;
imshow(eq_Img);
title('Equalized Image');
