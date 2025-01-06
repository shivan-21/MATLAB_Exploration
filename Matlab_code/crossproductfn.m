function w = crossproductfn(u,v);  % the name of the function must be same as how you save it !!

% CROSSPROD: function to compute u x v for vectors u and v 
% call syntax : w = crossprod(u,v); 

if length(u)>3 || length(v)>3
    error('Ask Euler. this cross product is beyond me')
end

if length(u) ==2  || length(v)==2 % convert 2D to 3D
    u(3) = 0; v(3)= 0;  
end

w = [ u(2)*v(3) - u(3)*v(2); 
     u(3)*v(1) - u(1)*v(3); 
     u(1)*v(2) - u(2)*v(1)
    ] ; 