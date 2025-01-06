% Assignment 2: Probelem 5

format long

% Testing out the beta function with parameters 2 and 3
% Inputs to the mybeta function
z = 2; w = 3;
N = 1000;  % Number of subintervals for the trapezoidal rule

% Compute the Beta function B(z, w) using mybeta
B_val = mybeta(z, w, N);
% Compute the result using beta function that is  pre-defined in matlab
I = beta(z,w); 

% Display the result
fprintf('Value of Beta(%d, %d) caluculated using my_beta function = %.8f\n', z, w, B_val);
fprintf('Value of Beta(%d, %d) calculated by in-built beta function = %.8f\n', z, w, I);
fprintf("The difference between the 2 values is %.10f", abs(I- B_val)) ; 

function B_val = mybeta(z, w, N)
    % This function numerically computes the Beta function B(z, w) using the trapezoidal rule for numerical integration.
    % Inputs:
    % z, w - parameters of the Beta function
    % N - number of subintervals for the trapezoidal integration
    % Output: B_val - the numerical value of the Beta function B(z, w)

    % Define the limits of integration [0, 1]
    a = 0;
    b = 1;
    
    % Define the integrand for the Beta function
    f = @(t) t.^(z-1) .* (1-t).^(w-1);
    
    % Compute the Beta function using the trapezoidal rule
    B_val = trapezoidal(f, a, b, N);
end

function I = trapezoidal(f, a, b, N)
    % Trapezoidal rule for numerical integration
    % f is the function to integrate
    % a is the lower limit of integration
    % b is the upper limit of integration
    % N is the number of subintervals

    % Calculate the width of each subinterval
    h = (b - a) / N;

    % Generate the x values
    x = linspace(a, b, N+1);

    % Apply the trapezoidal rule formula
    I = 0.5 * h * (f(x(1)) + f(x(end)) + 2 * sum(f(x(2:end-1))));
end
