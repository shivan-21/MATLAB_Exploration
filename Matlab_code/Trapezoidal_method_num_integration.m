format long %

a = -1; % define lower limit of integration 
b = 1; % define upper limit of integration 
N1 =10; N2 =100; N3 = 1000; % define 3 values of N. we divide the interval into 

% Define the function f(x) = 2 / (1 + x^2)
f = @(x) 2 ./ (1 + x.^2);

% Call the trapezoidal function
I1 = trapezoidal(f, a, b, N1); disp(I1); 
I2 = trapezoidal(f, a, b, N2); disp(I2); 
I3 = trapezoidal(f, a, b, N3); disp(I3); 

% Display the absolute differences in a formatted manner
fprintf("\nThe absolute differences between the estimated values and the true value of pi are as follows:\n");
fprintf("For N = %d: %.15f\n", N1, abs(I1 - pi)); 
fprintf("For N = %d: %.15f\n", N2, abs(I2 - pi)); 
fprintf("For N = %d: %.15f\n", N3, abs(I3 - pi)); 

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
