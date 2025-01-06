% Define the function . Based on preliminary graphing, we know the roots
% lie in [0,5] and [5,10]
f = @(x) x.^3 - exp(0.8.*x) - 20;

% Method 1: Bisection Method to find both roots
% Tolerance for bisection method
tol = 1e-6;

% Finding the two roots using bisection method
root1_bisect = bisection_method(f, 0, 10, tol); % expect bw 3 and 4
root2_bisect = bisection_method(f, 5, 10, tol); % expect bw 7 and 8 

% Display roots from Bisection method 
fprintf('Root 1 (Bisection Method): %.6f\n', root1_bisect);
fprintf('Root 2 (Bisection Method): %.6f\n', root2_bisect);

% Method 2: Using fzero to find both roots

% Finding the two roots using fzero
root1_fzero = fzero(f, [3 4]);
root2_fzero = fzero(f, [7 8]);

% Display roots from fzero
fprintf('Root 1 (fzero Method): %.6f\n', root1_fzero);
fprintf('Root 2 (fzero Method): %.6f\n', root2_fzero);

% Compare the results
fprintf('\nComparison of Bisection and fzero methods:\n');
fprintf('Root 1 difference: %.6f\n', abs(root1_bisect - root1_fzero));
fprintf('Root 2 difference: %.6f\n', abs(root2_bisect - root2_fzero));



% Bisection Method function
function root = bisection_method(f, a, b, tol)
    %if f(a) * f(b) >= 0
        %error('The function must have opposite signs at a and b.');
    %end
    
    while (b - a) / 2 > tol
        c = (a + b) / 2;
        if f(c) == 0
            break; % c is the root
        elseif f(a) * f(c) < 0
            b = c; % root is in [a, c]
        else
            a = c; % root is in [c, b]
        end
    end
    
    root = (a + b) / 2; % Midpoint of final interval
end

