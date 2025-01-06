% Define a 3x3 matrix using magic function
A = magic(3);

% Display the matrix
disp('Matrix A:');
disp(A);

% Check if the columns of A are orthogonal
% We need to check the dot product between all pairs of columns

% Get the columns of A
col1 = A(:,1);  % First column
col2 = A(:,2);  % Second column
col3 = A(:,3);  % Third column

% Compute the dot products between columns
dot12 = dot(col1, col2);  % Dot product of col1 and col2
dot13 = dot(col1, col3);  % Dot product of col1 and col3
dot23 = dot(col2, col3);  % Dot product of col2 and col3

% Display the results
disp('Dot product between Column 1 and Column 2:');
disp(dot12);

disp('Dot product between Column 1 and Column 3:');
disp(dot13);

disp('Dot product between Column 2 and Column 3:');
disp(dot23);

% Check if the dot products are zero (orthogonal condition)
if dot12 == 0 && dot13 == 0 && dot23 == 0
    disp('The columns of matrix A are orthogonal.');
else
    disp('Clearly, the columns of matrix A are NOT orthogonal.');
end
