% Clear workspace and command window
close all;
clearvars; 
clc;

% Create a square image
img_size = 200; % Define size of the square image
square_img = zeros(img_size, img_size);
square_img(75:125, 75:125) = 255; % Create a white square on a black background

% Display the original image
figure, imshow(square_img, []), title('Original Square Image');

% Define projection angles for Radon Transform
theta = 0:1:179; % Angles in degrees (0° to 179°)

% Compute the Radon Transform
[R, xp] = radon(square_img, theta);

% Display the Radon Transform
figure, imshow(R, [], 'XData', theta, 'YData', xp, ...
       'InitialMagnification', 'fit');
colormap(gca, hot), colorbar;
xlabel('\theta (degrees)'), ylabel('x''');
title('Radon Transform of the Sq. Img');
axis on, axis normal;