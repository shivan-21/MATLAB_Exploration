%% Initial setup of the problem 
% Parameters for the boundary value problem
a = 1/3 * pi; % Start of the interval
b = 1; % End of the interval
N = 100; % Number of points for finite difference

% Set up initial guess for bvp4c and bvp5c
solinit = bvpinit(linspace(a, b, 10), [0 0]);

% Solve using bvp4c
sol4 = bvp4c(@bvpfcn, @bcfcn, solinit);

% Solve using bvp5c
sol5 = bvp5c(@bvpfcn, @bcfcn, solinit);

% Evaluate the solutions over a finer grid for plotting
x_fine = linspace(a, b, 100);
y4 = deval(sol4, x_fine);
y5 = deval(sol5, x_fine);

%% Finite Difference Method without built-in functions
h = (b - a) / (N - 1); % Step size
x_fd = linspace(a, b, N)'; % Discretized x domain
A = zeros(N, N); % Coefficient matrix for finite difference
B = zeros(N, 1); % Right-hand side vector

% Boundary conditions for finite difference
B(1) = 0; % y(a) = 0
B(end) = sin(1); % y(b) = sin(1)

% Fill the matrix for finite difference approximation
for i = 2:N-1
    A(i, i-1) = 1/h^2 + 1/(x_fd(i) * h);    % Term for y(i-1)
    A(i, i) = -2/h^2 + x_fd(i)^(-4);        % Term for y(i)
    A(i, i+1) = 1/h^2 - 1/(x_fd(i) * h);    % Term for y(i+1)
end

% Set boundary conditions in matrix
A(1, 1) = 1;      % For y(a) = 0
A(N, N) = 1;      % For y(b) = sin(1)

% Solve the linear system for finite difference solution
y_fd = A \ B;

%% Plotting all solutions together. 
% Plot all solutions together
figure;
plot(x_fine, y4(1,:), 'b-', 'LineWidth', 1.5); hold on;
plot(x_fine, y5(1,:), 'r--', 'LineWidth', 1.5);
plot(x_fd, y_fd, 'g:', 'LineWidth', 1.5);
legend('Solution using bvp4c', 'Solution using bvp5c', 'Finite Difference Solution');
xlabel('x');
ylabel('y');
title('Comparison of Solutions using bvp4c, bvp5c, and Finite Difference Method');
grid on;

%% function defintions for ODEs and BCs

% Function for differential equations
function dydx = bvpfcn(x, y)
    dydx = [y(2);
            -2/x * y(2) - y(1)/x^4];
end

% Function for boundary conditions
function res = bcfcn(ya, yb)
    res = [ya(1);          % y(1/3*pi) = 0
           yb(1) - sin(1)]; % y(1) = sin(1)
end
