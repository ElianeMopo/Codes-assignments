 close all; clc; 
 
X = [2.1 10.4
4.3 15.5
7.0 21.0
9.1 24.9
10.5 30.3
12.7 33.8
15.2 41.4];
y = [26.5 57.9 108.4 155.9 209.3 272.4 384.3]';
n = length(y); % number of data points
% constructing the design matrix
X2 = [ones(n,1) X X(:,1).*X(:,2)];
b = X2 \ y; % LSQ fit
yfit = X2 * b; % model response
% visualizing the fit
plot(1:n,y,'ob',1:n,yfit, 'r'); title('Fitted model');