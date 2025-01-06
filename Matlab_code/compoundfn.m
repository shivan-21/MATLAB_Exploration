function [capital, interest] = compoundfn(capital, years, rate, timescomp); 

% COMPOUNDFN  function to compute the compounded capital and the interest 
% call syntax: [capital, interest] = compoundfn(capital, years, rate, timescomp)

x0 =capital; n= years; r= rate; k = timescomp; 

if r>1
    disp('If rate of interest is 8%, Enter 0.08 not 8')
end

capital = x0*(1 + r/k)^(k*n); 

interest = capital -x0; 
