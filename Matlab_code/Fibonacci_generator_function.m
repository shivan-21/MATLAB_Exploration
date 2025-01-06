% Main Script

% Generate Fibonacci sequence using myfibonacci function for n = 20
n = 20;
F = myfibonacci(n); % Call the function to get the Fibonacci sequence

% Step 2: Create a 10x10 matrix M where mij = F(i + j)
M = zeros(10, 10); % Preallocate 10x10 matrix
for i = 1:10
    for j = 1:10
        M(i,j) = F(i + j); % Assigning the (i+j)th Fibonacci number
    end
end
disp('Matrix M of order 10 with mij = F(i+j):')
disp(M)

% Step 3: Calculate the ratio rn = Fn / Fn-1 and plot the convergence to 1.618
ratios = F(2:end) ./ F(1:end-1); % Calculate the ratios Fn/Fn-1

% Plotting the ratios
figure;
plot(2:n, ratios, 'o-', 'LineWidth', 2, 'MarkerSize', 6)
hold on;
yline(1.618, '--r', 'Golden Ratio (1.618)', 'LineWidth', 1.5); % Golden ratio line
hold off;

title('Convergence of Fibonacci Ratios to the Golden Ratio')
xlabel('n')
ylabel('F_n / F_{n-1}')
grid on;

% Function definition
function F = myfibonacci(n)
    % Generate Fibonacci sequence up to Fn using a for loop
    F = zeros(1, n); % Preallocate array for speed
    F(1) = 1; % First Fibonacci number
    if n > 1
        F(2) = 1; % Second Fibonacci number
    end
    for i = 3:n
        F(i) = F(i-1) + F(i-2); % Recursion: Fn = F(n-1) + F(n-2)
    end
    disp('Fibonacci Sequence:')
    disp(F)
end
