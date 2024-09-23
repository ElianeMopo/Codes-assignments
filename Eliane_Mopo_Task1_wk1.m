clc, close all;
% Solve the following systems of linear equations by using the backslash
% operator.
% a)
A1 = [2 3 -1 4; 1 -2 2 -3; 3 1 -4 2; 4 -3 2 1];
b1 = [5; 7; -1; 3];
x_y_z_w = A1\b1;
disp(x_y_z_w)


% b)
A2 = [2 3 -1; 1 -2 2; 3 1 -4; 4 -3 2];
b2 = [5; 7; -1; 3];
x_y_z = A2\b2;
disp(x_y_z)


% Calculate also the residual sum of squares.
r = b2-A2*x_y_z;
RSS=sum(r.^2); % RSS for Residual Sum of Square
disp(RSS)

