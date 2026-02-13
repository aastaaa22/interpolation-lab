% MATLAB script for interpolation

% Example data points
x = [1, 2, 3, 4, 5];
y = [2.2, 2.8, 3.6, 4.5, 5.1];

% Linear interpolation
xi = 1:0.1:5;
yi = interp1(x, y, xi);

% Plotting the result
figure;
plot(x, y, 'o', xi, yi, '-');
title('Linear Interpolation');
xlabel('x');
ylabel('y');
grid on;