close all; clc; clear ;

x = [1 4 7 11 14 19 21 23]';
y = [0.13 0.24 0.27 0.29 0.30 0.31 0.31 0.31]';
n = length(x);
X = [ones(n,1) 1./x]; % Define the coefficient matrix
Y = 1./y; % Inverse transformation
params = X \ Y; % Parameter estimation
theta1 = params(2); % Recover the original parameter values
theta2 = params(1);
theta = [theta1, theta2];
yfit = x./(theta1+(theta2).*x); % Get the fitted values
figure;
plot(x, y, 'ob', x, yfit, 'r') % Plot data and fitted values
title('Fitted model');
grid on