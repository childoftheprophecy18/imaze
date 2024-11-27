close all;
clearvars;
clc;

% Read the image
img = imread('cameraman.tif');

% Converting to grayscale if the image is colored
if size(img, 3) == 3
    gray_img = rgb2gray(img);
else
    gray_img = img;
end

% Convert grayscale image to double format
gray_img = double(gray_img);  

% Compute the 2D DFT of the image and shift zero frequency to the center
dft_img = fftshift(fft2(gray_img));

% Define filter parameters
[m, n] = size(gray_img);
D0 = 30; % Cutoff frequency for low-pass and high-pass filters
[U, V] = meshgrid(1:n, 1:m);
center_u = ceil(n/2);
center_v = ceil(m/2);
D = sqrt((U - center_u).^2 + (V - center_v).^2);

% Create Low-Pass and High-Pass Filter Masks
low_pass_filter = double(D <= D0);  % Low-pass filter mask
high_pass_filter = double(D > D0);  % High-pass filter mask

% Apply the low-pass filter in the frequency domain
low_passed_dft = dft_img .* low_pass_filter;
low_pass_img = real(ifft2(ifftshift(low_passed_dft)));  % Inverse DFT for LPF result

% Apply the high-pass filter in the frequency domain
high_passed_dft = dft_img .* high_pass_filter;
high_pass_img = real(ifft2(ifftshift(high_passed_dft)));  % Inverse DFT for HPF result

% Display results
figure;
imshow(uint8(gray_img)); title('Original Image');

figure;
imshow(uint8(low_pass_img)); title('DFT Low-Pass Filtered Image');

figure;
imshow(uint8(high_pass_img)); title('DFT High-Pass Filtered Image');