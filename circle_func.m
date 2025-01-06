[x_c, y_c]= circlefn(1); 

function [x,y] = circlefn(r)

    % CIRCLEFN - function to draw a circle of radius r
    % File written by Shivan on 17/08/2024
    
    % call syntax: [x,y] = circlefn(r) or just circlefn(r)
    % input: r- specified radius 
    %Output: the x and y coordinates of the data points. 
    
    theta = linspace(0, 2*pi, 100); 
    x= r*cos(theta); 
    y= r*sin(theta); 
    plot(x,y)
    axis('equal')
    title(['Circle of radius r= ', num2str(r)])

end