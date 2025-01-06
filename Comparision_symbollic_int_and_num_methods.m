% Assignment 2: Problem 4 

% Define the function f(x) = x^x
f = @(x) x.^x;

% Plot the function using ezplot over the interval [0, 1]
figure;
fplot(f, [0, 1]);

% Add labels and title
xlabel('x');
ylabel('f(x) = x^x');
title('Plot of f(x) = x^x over the interval [0, 1]');
grid on;

% Define Limits of intergrtion
a=0; b=1 ; 
N  = 1000; % discrete steps for numerical integration. 1000 is a small enough step size without being too costly

% Perform symbolic integration: there is no probelem
syms x; 
f_sym = x^x ; 
I = double(int(f_sym, x, a,b)) ; 
disp(I) ; 

% Performing Numerical Integration
I1 = trapezoidal(f, a, b, N); disp(I1);
I2 = Simpson(f, a, b, N); disp(I2); 

% Displaying values and Finding Errors in numerical Integration
fprintf("\nThe absolute differences between the estimated values and the true value of the integral are as follows:\n");
fprintf("For N = %d, using the trapezoidal method :  %.15f\n", N, abs(I1 - I)); 
fprintf("For N = %d, using Simpson's rule:  %.15f\n", N, abs(I2 - I)); 




% All relevant function definitions 
% Trapezoidal Function
function I = trapezoidal(f, a, b, N)
    % f is the function to integrate
    % a is the lower limit
    % b is the upper limit
    % N is the number of subintervals

    % Calculate the width of each subinterval
    h = (b - a) / N;

    % Generate the x values
    x = linspace(a, b, N+1);
    
    % Apply the trapezoidal rule formula
    I = 0.5 * h * (f(x(1)) + f(x(end)) + 2 * sum(f(x(2:end-1))));
end

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


