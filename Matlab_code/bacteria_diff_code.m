% Main script
tspan = [0, 1];
x0 = 100;

[t, y] = ode45(@bacteria_diff, tspan, x0);
plot(t, y);
xlabel('Time');
ylabel('Bacteria Population');
title('Bacteria Growth over Time');



% Function definition at the end of the script
function dx = bacteria_diff(t, x)
    % Simple Differential Equation for Bacteria Growth

    b = 1;  % Growth rate
    p = 0.5;  % Competition or limiting factor

    dx = b*x - p*x^2;  % Differential equation
end
