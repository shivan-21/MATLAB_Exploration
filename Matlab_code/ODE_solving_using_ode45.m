
% Time span for the simulation
tspan = [0 20]; 

% Initial conditions
y0 = [2; 0]; % Initial values for x and dx/dt

% Values of epsilon to test
epsilon_values = [1, 3, 5, 7];

% Create a figure for subplots
figure;

for i = 1:length(epsilon_values) % loop through epsillon values 
    epsilon = epsilon_values(i);
    
    % Solve the ODE using ode45
    [t, y] = ode45(@(t, y) vanDerPol(t, y, epsilon), tspan, y0); % format: ode45(@odefun, tspan, y0)
    % t is the vector os time points where the sol is computed
    % y(:,1) gives x(t) and y(:,2) gives dx/dt

    % Plot the results
    subplot(2, 2, i);
    plot(t, y(:, 1), 'LineWidth', 2);
    title(['Van der Pol Oscillator (ε = ', num2str(epsilon), ')']);
    xlabel('Time (t)');
    ylabel('x(t)');
    grid on;
end

% Adjust layout
sgtitle('Van der Pol Oscillator Solutions for Different ε Values'); % sgtitle is title for grid fo sublplots


% Define the Van der Pol oscillator function
function dydt = vanDerPol(t, y, epsilon)
    x = y(1); % represents x(t)
    v = y(2); % represents y(t)
    dydt = [v; epsilon * (1 - x^2) * v - x];
end

