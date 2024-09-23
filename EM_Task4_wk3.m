clear; close all; clc;

x = [5 7 11 12 15 17 19]';
y = [0.93 0.91 0.84 0.82 0.76 0.71 0.66]';
n = length(y);
X = [ones(n,1) x.^2];  % Define the corfficient matrix
Y = -log(y);           % Log transformation
params = X\Y;          % Parameter estimation
theta0 = params(1);    % Recover the original parameter values
theta2 = params(2);
theta = [theta0 theta2];
yfit = 1./(exp(theta0+(theta2).*(x.^2)));    % Get the fitted values
figure;
plot(x,y,'ob', x, yfit, 'r') %'ob' to have blue circles for the given data
title('Fitted model')
grid on