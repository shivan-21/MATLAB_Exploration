function temptable = ctof(tinitial, tfinal); 
% CTOF : function to convert temperature from celsius to fahrenheit
% call syntax : temptable = ctof(tinitial, tfinal); 

C= [tinitial, tfinal]' ;% create a column vector instead of unsing semi-colons
F = (9/5)*C +32;  % compute the corresponding F
temptable = [C F]; % makes a 2 column table of C and F


