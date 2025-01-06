% part one: Find solutions for the linear system of equations 

A = [1 2 2; 3 3 4; 2 3 3] ; % define coeficient matrix

b = [1;1;2] ; % constant matrix 

x = A\b; 

%c = A*x; % this is matrix multiplciation only. Used for verification purposes 

%disp(c); 
disp("the solution to the linear system of equations is given below: "); 
disp(x) % display the result



% part 2: Finding eignevalues and eigenvectors of A
A = [5 -3 2; -3 8 4; 4 2 -9]; 
[V,D]= eig(A); 
disp("The eigenvectors of the matrix A displayed as columns of the matrix V are: ")
disp(V)% display the eigenvectors as columns of a 3 by 3 matrix

disp("The eigenvalues of the matrix A displayed as diagonal elements of the matrix D are: ")
disp(D) % display eigenvalues as the diagonal elements of a 3 by 3 matrix'






