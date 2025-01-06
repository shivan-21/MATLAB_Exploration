%% Publishing Reports -A simple Example 
%% A Spiral Plot 
% Let us plot a spiral given by 
% r(t) = exp (-theta/10), 0 <= theta<= 10*pi'

%% Create vectors r and theta 
theta = linspace(0, 10*pi, 200); 
r= exp(-theta/10);

%% Now plot the theta vs r using polar plot 
polar(theta,r)


