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

% Display the original image
figure;
imshow(img); title('Original Image');

% Convert image to double
img_d = double(img);

% Initialize cell array to hold bit planes
bit_planes = cell(1, 8);

% 0th plane
bit_planes{1} = mod(img_d, 2);
figure; subplot(2,2,1); imshow(bit_planes{1}); title('0th plane');

% 1st plane
bit_planes{2} = mod(floor(img_d/2), 2);
subplot(2,2,2); imshow(bit_planes{2}); title('1st plane');

% 2nd plane
bit_planes{3} = mod(floor(img_d/4), 2);
subplot(2,2,3); imshow(bit_planes{3}); title('2nd plane');

% 3rd plane
bit_planes{4} = mod(floor(img_d/8), 2);
subplot(2,2,4); imshow(bit_planes{4}); title('3rd plane');

% Loop through 4th to 7th bit planes and display them
figure;
for k = 4:7
    bit_planes{k+1} = mod(floor(img_d / 2^k), 2); % Extract the k-th bit plane
    subplot(2, 2, k-3); % Adjust index for the subplot
    imshow(bit_planes{k+1});
    title([num2str(k) 'th plane']);
end

% Reconstruct the original image from bit planes
cc_img = 0;
for k = 0:7
    % cc_img = c0 + 2*c1 + 4*c2 + 8*c3 + 16*c4 + 32*c5 + 64*c6 + 128*c7;
    cc_img = cc_img + bit_planes{k+1} * 2^k;
end

figure; imshow(uint8(cc_img)); title('Reconstructed Image');