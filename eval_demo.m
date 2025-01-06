% Example use of the EVAL function 
% A script file that lets you take a break while matlab slogs

t= [0:0.1:1000];
for k = 1:10
    outputfile = ['result', int2str(k)]; 
    % write commands to run your function here 
    theta = k*pi*t; 
    x = sin(theta); 
    y = cos(theta); 
    z = x.*y.^2; 
    %now save variable x, y,z in a mat file 

    eval(['save ', outputfile, 'x y z'])

end