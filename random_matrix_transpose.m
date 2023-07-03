% Define the size of the matrix
rows = input('Enter the number of rows: ');
cols = input('Enter the number of columns: ');

% Generate a random matrix
matrix = rand(rows, cols);

% Display the original matrix
disp('Original Matrix:');
disp(matrix);

% Calculate the transpose of the matrix
transpose_matrix = matrix';

% Display the transpose matrix
disp('Transpose Matrix:');
disp(transpose_matrix);
