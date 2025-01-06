function s = gseriessumfn(r,n); 

% GSERIESSEUM: Function to calculate the sum of a geometric series
% the series is 1 + r + r^2... to the nth power
% call syntax: s= gseriessumfn(r,n)
nvector= 0:n;
series = r.^nvector; % automatically  assumes r is a vector of dimenion n+1
s = sum(series); 
