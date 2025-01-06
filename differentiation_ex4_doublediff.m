tspan = [0 5]; 
x0 = [0; 1]; % Column vector for initial conditions

% Solving the system of equations using ode23
[t, x] = ode23(@diff_secondorder, tspan, x0); 
%[t, x] = ode23(@diff_secondorder, tspan, x0); 

% First figure with two graphs and a legend
figure;
plot(t, x(:, 1)); % Plot the first solution x1
hold on; 
plot(t, x(:, 2)); % Plot the second solution x2
legend('x1','x2');
grid on;


% Second figure with x2(:,2)
figure;
plot(t, x(:, 2)); % Plot x2(:,2) separately
grid on;

% Function to define the second-order system
function dx = diff_secondorder(t, x) % x is the vector of dependent variables 
    [m, n] = size(x); 
    dx = zeros(m, n); 
    
    dx(1) = x(2); % First equation dx1/dt = x2
    dx(2) = (2 - 2 * t * x(2) - 3 * x(1)) / (1 + t^2); % Second equation
end
