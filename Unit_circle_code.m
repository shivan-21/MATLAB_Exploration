% CIRCLE    a script file to draw a circle
% File written by Shivan: Last modified on 17|08|24

r= input('Enter the radius of the circle: ')
theta = linspace(0, 2*pi, 100); 
x= r*cos(theta);
y= r*sin(theta); 
plot(x,y,0,0, '+')
axis('equal')
xlabel('x')
ylabel('y')
title('Circle of Unit Radius')
  