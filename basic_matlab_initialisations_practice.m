% Assignment 2: problem 1
% I have included the matrices X and Y as output parameters to make it
% easier to construct the function 

% defining parameters
v = [1; 1];  % Corrected to square brackets
m = 20; 

[X, Y, result] = eval_ls_sq(m, v);  
%disp(X); included for verification purposes  
%disp(Y); 
disp(result);

function [X, Y, ls_sq] = eval_ls_sq(m, v)
    % Check if m is valid
    if m <= 1
        error('m must be greater than 1');
    end

    % Define h
    h = 1 / (m - 1);
    
    % Create xi values for i = 1 to m
    xi = (0:(m-1)) * h;

    % Define matrix X (m by 2)
    X = [ones(m, 1), xi'];  % m x 2 matrix where first column is ones, second is xi

    % Define matrix Y (m by 1)
    Y = 0.1 * sin(pi * xi)';

    % Ensure v is a 2 by 1 vector
    if size(v, 1) ~= 2 || size(v, 2) ~= 1
        error('v must be a 2 by 1 vector');
    end
    
    % Compute ls_sq using matrix multiplication
    % ls_sq = Y' * Y - 2 * v' * X' * Y + v' * X' * X * v;
    
    % X is already m by 2, so no need for additional transposes
    % Everything should be in correct dimension now
    term1 = Y' * Y;  % (1 x m) * (m x 1) = scalar
    term2 = 2 * v' * X' * Y;  % (1x2) * (2xm) * (m x1) = scalar
    term3 = v' * X' * X * v;  % (1x2) * (2xm) * (m x 2) * (2x1) = scalar
    
    ls_sq = term1 - term2 + term3;
end
