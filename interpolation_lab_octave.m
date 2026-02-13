%% =============================
%% Interpolation Lab: GNU Octave Version
%% =============================
% Purpose: Compare 6 different interpolation methods (Octave-compatible)
% NOTE: Use this version if running GNU Octave instead of MATLAB
% makima() is replaced with pchip() for compatibility

%% --- Dataset: Stress vs Strain ---
x = [1.01, 2.14, 1.08, 3.12, 2.01, 14.12, 10.91, 51.13, 15.32, 1.01 ...
     6.84, 9.93, 3.34, 2.53, 3.13, 2.81, 4.43, 4.23, 3.23, 5.73 ...
     7.65, 5.38, 5.56, 7.34, 27.59, 8.75, 22.36, 6.43, 7.20, 2.94 ...
     9.97, 40.40, 4.05, 2.54, 5.41, 8.52, 9.46, 9.76, 2.43, 6.92 ...
     7.72, 3.24, 7.17, 4.85, 3.23, 8.34, 9.54, 7.93, 2.74, 2.54 ... 
     1.52, 3.15, 3.87, 4.70, 5.31, 6.21, 7.00, 7.98, 8.66, 9.54 ... 
     2.33, 1.40, 2.36, 2.28, 4.57, 2.15, 6.031, 6.851, 7.90, 9.12 ...
     0.02, 3.24, 3.18, 3.65, 4.82, 5.60, 6.59, 7.78, 8.54, 4.01 ...
     1.02, 4.33, 4.24, 4.68, 4.74, 4.02, 4.11, 4.41, 5.031, 5.04 ...
     3.06, 5.48, 5.38, 5.51, 8.31, 9.82, 6.32, 1.84, 3.01, 6.80];

y = [2.71, 3.45, 4.19, 5.72, 6.41, 7.04, 8.15, 9.73, 9.25, 2.14 ...
     3.56, 4.91, 5.07, 4.52, 3.19, 2.63, 9.07, 0.32, 1.97, 2.21 ...
     3.65, 4.30, 5.74, 7.99, 7.63, 8.87, 9.32, 7.96, 7.41, 5.85 ...
     5.31, 3.74, 2.99, 12.43, 22.07, 31.52, 40.76, 5.41, 5.65, 9.10 ...
     8.75, 8.19, 7.63, 86.87, 7.52, 6.96, 1.421, 9.865, 8.310, 1.754 ...
     5.19, 3.63, 2.08, 5.52, 5.97, 7.21, 5.85, 4.31, 2.74, 1.99 ...
     9.64, 8.07, 46.32, 34.97, 23.41, 11.65, 21.30, 3.74, 40.99, 49.43 ...
     9.08, 6.52, 7.96, 8.42, 6.86, 8.10, 3.74, 6.19, 5.43, 39.87 ...
     27.52, 15.96, 24.41, 32.86, 41.31, 9.75, 5.19, 6.63, 5.07, 3.52 ...
     9.96, 80.41, 6.86, 7.31, 4.74, 3.19, 22.43, 11.07, 20.32, 29.76];

x = x(:);
y = y(:);
dataset_name = 'Dataset: Stress vs Strain';
x_fine = linspace(min(x), max(x), 100)';

% Raw data plot
figure(1);
plot(x, y, 'wo', 'MarkerSize', 7, 'LineWidth', 1.5);
grid on;
xlabel('Stress');
ylabel('Strain');
title('Raw Data Plot (Stress vs Strain)');
legend('Raw Data', 'Location','northwest');

x_query = 21;

% Method 1: Linear
y_linear = interp1(x, y, x_fine, 'linear');
y_linear_q = interp1(x, y, x_query, 'linear');

% Method 2: Quadratic
p_quad = polyfit(x, y, 2);
y_poly_quad = polyval(p_quad, x_fine);
y_quad_q = polyval(p_quad, x_query);

% Method 3: Cubic
p_cubic = polyfit(x, y, 3);
y_poly_cubic = polyval(p_cubic, x_fine);
y_cubic_q = polyval(p_cubic, x_query);

% Method 4: Linear Spline
y_spline_linear = interp1(x, y, x_fine, 'linear');
y_spline_linear_q = interp1(x, y, x_query, 'linear');

% Method 5: PCHIP (Octave equivalent to makima)
y_spline_quad = interp1(x, y, x_fine, 'pchip');
y_spline_quad_q = interp1(x, y, x_query, 'pchip');

% Method 6: Cubic Spline
y_spline_cubic = spline(x, y, x_fine);
y_spline_cubic_q = spline(x, y, x_query);

% Results
fprintf('\n=== Interpolated Values at x = %.1f ===\n', x_query);
fprintf('Dataset: %s\n\n', dataset_name);
fprintf('%-35s %s\n', 'Method', 'Interpolated Value');
fprintf('%s\n', repmat('-', 55, 1));
fprintf('%-35s %.6f\n', 'Linear Interpolation', y_linear_q);
fprintf('%-35s %.6f\n', 'Quadratic Polynomial', y_quad_q);
fprintf('%-35s %.6f\n', 'Cubic Polynomial', y_cubic_q);
fprintf('%-35s %.6f\n', 'Linear Spline', y_spline_linear_q);
fprintf('%-35s %.6f\n', 'Quadratic Spline (PCHIP)', y_spline_quad_q);
fprintf('%-35s %.6f\n', 'Cubic Spline', y_spline_cubic_q);
fprintf('%s\n\n', repmat('-', 55, 1));

disp('Interpolation Lab (Octave) completed successfully!');
