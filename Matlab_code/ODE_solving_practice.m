tspan = [0 25]; %tspan is an array that gives the start and end point
x0 =1; % this is the initial condition 

a= -1/5; % parameters for the eqation
b=1; 

param = [a b]; 

[t,y] = ode45(@my_simple_diff, tspan, x0, [], param); % t is a column vectoe with all the times, y is a matric- each row corresponds to a time in the column vector t
% arg1: function , arg2: beginning and ending time pts, arg3: initial
% condiotion, arg4: [] fill for special things only, arg5: parameters for
% separate function
plot(t,y)


function dx = my_simple_diff(t, x, param)
    a = param(1); b= param(2); 
    dx = a*x +b; 
end

