% Simulate motion blur in x and y directions
close all;
clearvars;
clc;

% Load an image
image = imread('cameraman.tif'); % replace 'input_image.jpg' with your image file name

% Convert to grayscale if the image is in color
if size(image, 3) == 3
    image = rgb2gray(image);
end

% Convert the image to double for processing
image = double(image);

% Get the dimensions of the image
[M, N] = size(image);

% Parameters for motion blur
a = 0.1; % Rate in x-direction
b = 0.1; % Rate in y-direction
T = 1;   % Duration of motion

% Generate the frequency coordinates
[u, v] = meshgrid(-N/2:N/2-1, -M/2:M/2-1);

% Compute the motion blur transfer function
H = T ./ (pi * (u * a + v * b)) .* sin(pi * (u * a + v * b) * T) .* exp(-1i * pi * (u * a + v * b) * T);
H((u * a + v * b) == 0) = T; % Avoid division by zero

% Apply the 2D DFT to the image
dft_image = fft2(image);

% Shift the zero frequency component to the center
dft_image_shifted = fftshift(dft_image);

% Apply the motion blur filter in the frequency domain
blurred_dft_image = dft_image_shifted .* H;

% Shift back and apply the inverse DFT
blurred_dft_image_shifted_back = ifftshift(blurred_dft_image);
blurred_image = ifft2(blurred_dft_image_shifted_back);
blurred_image = abs(blurred_image); % Take the magnitude for real part

% Display the original and blurred images
figure;
%subplot(1, 2, 1);
imshow(uint8(image));
title('Original Image');

%subplot(1, 2, 2);
figure;
imshow(uint8(blurred_image));
title('Blurred Image (Motion Blur)');
