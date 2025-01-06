% Load the data from randomData.mat
load('randomData.mat');  % This file contains variables x and y

% Create a vector for fine plotting of polynomial fits
x_fine = linspace(min(x), max(x), 1000);

% Fit polynomials of degrees 1 through 5
p1 = polyfit(x, y, 1);  % 1st degree polynomial
p2 = polyfit(x, y, 2);  % 2nd degree polynomial
p3 = polyfit(x, y, 3);  % 3rd degree polynomial
p4 = polyfit(x, y, 4);  % 4th degree polynomial
p5 = polyfit(x, y, 5);  % 5th degree polynomial

% Evaluate the polynomials on the fine x vector
y1 = polyval(p1, x_fine);
y2 = polyval(p2, x_fine);
y3 = polyval(p3, x_fine);
y4 = polyval(p4, x_fine);
y5 = polyval(p5, x_fine);

% Plot the original data as blue dots
figure;
hold on;
plot(x, y, 'bo', 'MarkerSize', 8, 'DisplayName', 'Data');  % Larger blue dots for original data

% Plot each polynomial fit using thicker lines and markers for better visibility
plot(x_fine, y1, 'r-', 'LineWidth', 2, 'DisplayName', '1st degree fit');  % Thicker red line
plot(x_fine, y2, 'g--', 'LineWidth', 2, 'DisplayName', '2nd degree fit');  % Thicker green dashed line
plot(x_fine, y3, 'b-.', 'LineWidth', 2, 'DisplayName', '3rd degree fit');  % Thicker blue dash-dot line
plot(x_fine, y4, 'm:', 'LineWidth', 2, 'DisplayName', '4th degree fit');  % Thicker magenta dotted line
plot(x_fine, y5, 'k-', 'LineWidth', 2, 'DisplayName', '5th degree fit');  % Thicker black solid line

% Add title, labels, and legend
title('Polynomial Fits of Different Degrees to Data');
xlabel('x');
ylabel('y');
legend('show');

hold off;
