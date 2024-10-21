clear; close; clc;

x = [0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]';
y = [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52]';
n = length(x);
X = [ones(n,1) x];
b = X\y
yfit = X*b; % model response
repmeas = [2 3]; % indices of repeated measurements
sig = std(y(repmeas)); % sigma estimate
cov_b = sig^2*inv(X'*X)
% t-values
std_b = sqrt(diag(cov_b));
t_b = b./std_b
% R2 value
R2 = 1-sum((y-yfit).^2)/sum((y-mean(y)).^2)
plot(x,y,'o',x,yfit)