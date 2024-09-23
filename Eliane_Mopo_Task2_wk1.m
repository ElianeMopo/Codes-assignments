clc, close all;
% Solve the system of linear equations below by using SVD method.

A=[1 1; 2 3; 3 4; 4 6];
b=[4; 7; 10; 13];
[U, S, V] = svd(A);
r=2;
U_truncated = U(:, 1:r);
S_truncated = S(1:r, 1:r);
V_truncated = V(:, 1:r);
A_PI_truncated = V_truncated * inv(S_truncated) * U_truncated';
x_y_truncated = A_PI_truncated * b;
disp(x_y_truncated)

% Using the backslash operator
x_y_backslash= A\b;
disp(x_y_backslash)