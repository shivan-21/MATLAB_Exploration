% finding the Jacobian of a function 

% Define the vector-valued function F
F = @(x) [x(1)^2 * x(2); 5 * x(1) + sin(x(2))];

% Define the point at which to evaluate the Jacobian
X = [1; 1];

% Calculate the Jacobian at X using the previously defined Jacobian function
J = Jacobian(F, X);

% Display the result
disp('Jacobian matrix at X = (1, 1) for the required function');
disp(J);

%% Function Definition 
function J = Jacobian(F, X)
    % Input: 
    %   F - function handle representing the vector-valued function F(x)
    %   X - point at which to evaluate the Jacobian, a column vector [x1; x2; ...; xn]
    % Output:
    %   J - Jacobian matrix evaluated at X
    
    h = 1e-6;  % step size for finite difference approximation
    n = length(X);         % Number of variables (dimension of X)
    m = length(F(X));      % Number of functions (dimension of F(X))- will be 2 in example
    J = zeros(m, n);       % Initialise Jacobian matrix with zeros
    
    % Loop through each variable to compute partial derivatives
    for j = 1:n
        % Create a perturbed version of X
        X_perturbed = X;
        X_perturbed(j) = X_perturbed(j) + h;  % Increment the j-th variable by h
        
        % Compute the finite difference approximation of the derivative
        J(:, j) = (F(X_perturbed) - F(X)) / h;
    end
end
