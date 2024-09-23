close all; clc; clear

load('data_1.mat')
n = length(xy(:,1)); % extract the length of data
X = [ones(n,1) xy(:,1)]; % Define the coefficient matrix
Y = log(xy(:,2)./(1-xy(:,2))); % log transformation
params = X \ Y; % estimate the parameters
theta0 = params(1); % recover the original parameter values
theta1 = params(2);
theta = [theta0, theta1];
Yfit = 1./(1+exp(-theta0-(theta1).*xy(:,1))); % Get the fitted values
figure;
plot(xy(:,1),xy(:,2),'ob',xy(:,1),Yfit,'r') % plot data and fitted values
title('Fitted model');
grid on
