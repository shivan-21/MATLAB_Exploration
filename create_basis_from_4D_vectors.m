% Given vectors u1, u2, and u3
u1 = [1, 1, 1, 1]';
u2 = [1, 1, 2, 4]';
u3 = [1, 2, -4, -3]';

% Initialize the orthogonal vectors v1, v2, and v3
% Step 1: v1 is just u1
v1 = u1;

% Step 2: v2 is u2 minus its projection onto v1
proj_u2_on_v1 = (dot(u2, v1) / dot(v1, v1)) * v1;
v2 = u2 - proj_u2_on_v1;

% Step 3: v3 is u3 minus its projection onto v1 and v2
proj_u3_on_v1 = (dot(u3, v1) / dot(v1, v1)) * v1;
proj_u3_on_v2 = (dot(u3, v2) / dot(v2, v2)) * v2;
v3 = u3 - proj_u3_on_v1 - proj_u3_on_v2;

% Display the orthogonal vectors
disp('Orthogonal vector v1:');
disp(v1);

disp('Orthogonal vector v2:');
disp(v2);

disp('Orthogonal vector v3:');
disp(v3);

% Normalising the vectors to make them orthonormal
v1_norm = v1 / norm(v1);
v2_norm = v2 / norm(v2);
v3_norm = v3 / norm(v3);

disp('Normalized orthogonal vector v1 (v1_norm):');
disp(v1_norm);

disp('Normalized orthogonal vector v2 (v2_norm):');
disp(v2_norm);

disp('Normalized orthogonal vector v3 (v3_norm):');
disp(v3_norm);
