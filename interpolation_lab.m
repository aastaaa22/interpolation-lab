%% =============================
%% Interpolation Lab: Generalized Script
%% =============================
% Purpose: Compare 6 different interpolation methods on a stress-strain dataset
% Methods: Linear, Quadratic, Cubic, Linear Spline, Quadratic Spline (makima), Cubic Spline
% Author: Interpolation Lab
% Date: 2026-02-13

%% --- Dataset: Stress vs Strain ---
% 100 data points of stress (x) vs strain (y)
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

% Convert to column vectors (required for interpolation functions)
x = x(:);
y = y(:);

% Dataset name (for display)
dataset_name = 'Dataset: Stress vs Strain';

% Fine grid for smooth plotting (100 evenly-spaced points)
x_fine = linspace(min(x), max(x), 100)';

%% --- Visualization: Raw Data ---
figure('Name','Raw Data','NumberTitle','off');
plot(x, y, 'wo', 'MarkerSize', 7, 'LineWidth', 1.5);
grid on;
xlabel('Stress');
ylabel('Strain');
title('Raw Data Plot (Stress vs Strain)');
legend('Raw Data', 'Location','northwest');
drawnow;

%% --- Query Point for Interpolation ---
% We estimate the y-value at this x-position using each method
x_query = 21;

%% ===== INTERPOLATION METHOD 1: Linear Interpolation =====
% Connects adjacent data points with straight line segments
y_linear = interp1(x, y, x_fine, 'linear');
y_linear_q = interp1(x, y, x_query, 'linear');

%% ===== INTERPOLATION METHOD 2: Quadratic Polynomial =====
% Fits a 2nd-degree polynomial: y = ax^2 + bx + c
p_quad = polyfit(x, y, 2);
y_poly_quad = polyval(p_quad, x_fine);
y_quad_q = polyval(p_quad, x_query);

%% ===== INTERPOLATION METHOD 3: Cubic Polynomial =====
% Fits a 3rd-degree polynomial: y = ax^3 + bx^2 + cx + d
p_cubic = polyfit(x, y, 3);
y_poly_cubic = polyval(p_cubic, x_fine);
y_cubic_q = polyval(p_cubic, x_query);

%% ===== INTERPOLATION METHOD 4: Linear Spline =====
% Same as linear interpolation (included for comparison)
y_spline_linear = interp1(x, y, x_fine, 'linear');
y_spline_linear_q = interp1(x, y, x_query, 'linear');

%% ===== INTERPOLATION METHOD 5: Quadratic Spline (makima) =====
% Modified Akima Interpolation - smoother than linear, less overshoot than cubic
y_spline_quad = makima(x, y, x_fine);
y_spline_quad_q = makima(x, y, x_query);

%% ===== INTERPOLATION METHOD 6: Cubic Spline =====
% Piecewise cubic polynomials with continuous 1st and 2nd derivatives
y_spline_cubic = spline(x, y, x_fine);
y_spline_cubic_q = spline(x, y, x_query);

%% --- Display Results in a Table ---
Method = {'Linear Interpolation'; 
          'Quadratic Polynomial'; 
          'Cubic Polynomial'; 
          'Linear Spline'; 
          'Quadratic Spline (makima)'; 
          'Cubic Spline'};

Interpolated_Value = [y_linear_q; 
                      y_quad_q; 
                      y_cubic_q; 
                      y_spline_linear_q; 
                      y_spline_quad_q; 
                      y_spline_cubic_q];

T = table(Method, Interpolated_Value);
disp(' ');
disp(['=== Interpolated Values at x = ', num2str(x_query), ' ===']);
disp(['Dataset: ', dataset_name]);
disp(' ');
disp(T);
disp(' ');

%% --- Individual Plots (One per Method) ---
methods = {'Linear Interpolation','Quadratic Polynomial','Cubic Polynomial',...
           'Linear Spline','Quadratic Spline (makima)','Cubic Spline'};
values = {y_linear,y_poly_quad,y_poly_cubic,y_spline_linear,y_spline_quad,y_spline_cubic};
query_values = {y_linear_q,y_quad_q,y_cubic_q,y_spline_linear_q,y_spline_quad_q,y_spline_cubic_q};
colors = {'r','b','g','m','c','k'};

for i = 1:length(methods)
    figure('Name',methods{i},'NumberTitle','off');
    
    % Plot original data
    plot(x, y, 'wo', 'MarkerFaceColor','w', 'MarkerEdgeColor','k', ...
         'MarkerSize', 5, 'DisplayName','Original Data'); 
    hold on;
    
    % Plot interpolation curve
    plot(x_fine, values{i}, 'Color', colors{i}, 'LineWidth', 2, ...
         'DisplayName',methods{i});
    
    % Highlight query point
    plot(x_query, query_values{i}, 'o', 'MarkerSize',10, 'MarkerFaceColor', colors{i}, ...
         'MarkerEdgeColor','k', 'LineWidth',2, 'DisplayName',['@ x=',num2str(x_query)]);
    
    xlabel('Stress'); 
    ylabel('Strain');
    title(['Interpolation using ', methods{i}]);
    legend('Location','northwest'); 
    grid on;
    hold off;
end

%% --- Combined Comparison Plot ---
figure('Name','All Methods Comparison','NumberTitle','off');

% Plot original data
plot(x, y, 'wo', 'MarkerFaceColor','w','MarkerEdgeColor','k','MarkerSize',5,...
     'DisplayName','Original Data'); 
hold on;

% Plot all interpolation curves
plot(x_fine, y_linear, 'r-', 'LineWidth',1.5,'DisplayName','Linear Interpolation');
plot(x_fine, y_poly_quad, 'b--','LineWidth',1.5,'DisplayName','Quadratic Polynomial');
plot(x_fine, y_poly_cubic, 'g-.','LineWidth',1.5,'DisplayName','Cubic Polynomial');
plot(x_fine, y_spline_linear, 'm:','LineWidth',1.5,'DisplayName','Linear Spline');
plot(x_fine, y_spline_quad, 'c-','LineWidth',1.5,'DisplayName','Quadratic Spline (makima)');
plot(x_fine, y_spline_cubic, 'k--','LineWidth',1.5,'DisplayName','Cubic Spline');

% Highlight query points for each method
plot(x_query, y_linear_q, 'ro', 'MarkerFaceColor','r','MarkerSize',8,'DisplayName','Linear @Query');
plot(x_query, y_quad_q, 'bo', 'MarkerFaceColor','b','MarkerSize',8,'DisplayName','Quad Poly @Query');
plot(x_query, y_cubic_q, 'go', 'MarkerFaceColor','g','MarkerSize',8,'DisplayName','Cubic Poly @Query');
plot(x_query, y_spline_quad_q, 'co', 'MarkerFaceColor','c','MarkerSize',8,'DisplayName','Quad Spline @Query');
plot(x_query, y_spline_cubic_q, 'ko', 'MarkerFaceColor','y','MarkerSize',8,'DisplayName','Cubic Spline @Query');

xlabel('Stress'); 
ylabel('Strain');
title(['Comparison of All Interpolation Methods - ', dataset_name]);
legend('Location','northwest'); 
grid on;
hold off;

%% --- End of Script ---
disp('Interpolation Lab completed successfully!');
disp('All figures have been generated.');
