% ASSIGNMENT 2: PROBLEM 3


% Define the symbolic variable
syms x

% Define the function using symbolic expression
f_sym = exp(-2*x) + 3*sqrt(x);

% Define the exact integral using symbolic integration
a = 0;  % lower limit
b = 1;  % upper limit
I_exact = double(int(f_sym, x, a, b));  % Evaluate the exact integral

% Define the function f(x) for numerical integration
f_num = @(x) exp(-2*x) + 3*sqrt(x);

% Define the range of N values
N_values = 10:10:1000;

% Preallocate an array for storing error array
errors = zeros(size(N_values));

% Loop over each N value and calculate the error
for i = 1:length(N_values)
    N = N_values(i);
    I_simpson = Simpson(f_num, a, b, N);  % Numerical integration using Simpson's rule
    errors(i) = abs(I_exact - I_simpson);  % Calculate the absolute error
end

% Display the results
disp('N values and corresponding errors:');
disp(table(N_values', errors', 'VariableNames', {'N', 'Error'}));

% Plot the error vs. N
figure;
loglog(N_values, errors, '-o');
xlabel('N (Number of subintervals) ->');
ylabel('Absolute Error ->');
title('Error of Simpson''s Rule vs N');
grid on;

% Simpson's function
function I = Simpson(f, a, b, N)
    % f is the function to integrate
    % a is the lower limit of integration
    % b is the upper limit of integration
    % N is the number of subintervals (must be even for Simpson's 1/3 rule)

    % Ensure that N is even for Simpson's rule
    if mod(N, 2) ~= 0
        error('N must be an even number for Simpson''s 1/3 rule');
    end

    % Calculate the width of each subinterval
    h = (b - a) / N;

    % Generate the x values
    x = linspace(a, b, N+1);
    
    % Calculate the function values at each x
    fx = f(x);

    % Apply Simpson's 1/3 rule
    I = h/3 * (fx(1) + 4*sum(fx(2:2:end-1)) + 2*sum(fx(3:2:end-2)) + fx(end));
end
