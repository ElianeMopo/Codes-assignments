clc, close all;
% Define matrices sizes
n1 = 3500;
n2 = 10000;
n3 = 13000;

% SVD Decomposition
A1 = rand(n1, n1);
tic;
[U, S, V] = svd(A1);
time_svd = toc;
fprintf('Time for SVD of a random  %dx%d matrix: %f seconds\n', n1, n1, time_svd);
% The size in the SVD case can go up to 3500


% Matrix Inversion
A2 = rand(n2, n2);
tic;
inv_A2 = inv(A2);
time_inv = toc;
fprintf('Time for Inversion of a random  %dx%d matrix: %f seconds\n', n2, n2, time_inv);
% The size in the case of Matrix Inversion can go up to 10000


% Solving Linear System (using backslash operator)
A3 = rand(n3, n3);
x = rand(n3,1);
tic;
y = A3 \ x;
time_solve = toc;
fprintf('Time for solving system of a random %dx%d matrix: %f seconds\n', n3, n3, time_solve);
% The size in the case of Solving Linear System using backslash operator can go up to 13000
