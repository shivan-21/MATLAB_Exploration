% Define the objective function as a separate function file or inline function
f = @(x) exp(x(1)/x(2)) * (8*x(2)^2 + 10*x(1)^2 + 24*x(1)*x(2) + 12*x(1) + 33);


% Initial starting point
x0 = [1, 1];

% Set options for fmincon
options = optimoptions('fmincon', 'Display', 'iter', 'Algorithm', 'sqp');
% Display and iter are to track the optimisation progress after each
% iteratiom. Algorithm', 'sqp' specify the use of sequential quadratic
% programming. 

% Run fmincon
[x_opt, fval] = fmincon(f, x0, [], [], [], [], [], [], @constraints, options);
% x_opt is the optimized solution for x, and fval is the corresponding function value at x_opt
% empty brackets [] indicate no linear inequality or equality constraints

% Display results
fprintf('Optimal solution x: [%f, %f]\n', x_opt(1), x_opt(2));
fprintf('Optimal objective function value: %f\n', fval);



% Define the non-linear constraints function
function [c, ceq] = constraints(x)
    % Non-linear inequality constraints
    c = [x(1)*x(2) - 4*x(1) - 5*x(2) + 4.75;
         -x(1)*x(2) - 6];
    % Non-linear equality constraints (none in this case)
    ceq = [];
end
