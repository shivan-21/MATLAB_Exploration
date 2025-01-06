function factn = factorial(n); 

% FACTORIAL: function to compute factorial
% call syntax: factn= factorial(n)

factn = 1; 

for k = 1:1:n
    factn = k*factn
end

if n==0
    factn= 1
end
