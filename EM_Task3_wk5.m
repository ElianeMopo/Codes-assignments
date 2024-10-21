clear; close all; clc;

% define a cell array for the group of data 
data = {[0.0 1.0 1.0 2.0 1.8 3.0 4.0 5.2 6.5 8.0 10.0]', [5.00 5.04 5.12 5.28 5.48 5.72 6.00 6.32 6.68 7.08 7.52]';
    [0.9 1.3 1.3 1.4 1.6 1.8 2.1 2.1 2.5 2.9 3.2 3.3 3.6 4.0 4.2 4.3]', [2.5 4.03 4.1 4.4 5.1 6.05 7.48 7.6 9.8 12.4 14.3 15.2 18.1 19.9 23.0 23.9]';
    (-3:3)', [7.5 3 0.5 1 3 6 14]'};

% create a for loop to handle all the group
for k = 1:3
    x = data{k, 1}; 
    y = data{k, 2}; 
    n = length(y); 
% perfom leave-one-out cross-validation
    pred_lin_term = zeros(1, n);   % this will hold the prediction for each data point
    pred_quad_term = zeros(1, n);  % this will hold the prediction for each data point
    for p = 1:n
        % figure out indices
        trainx = setdiff(1:n, p);
        testx = p;
        Y = y(trainx);
        % train the model
        X_lin = [ones(n-1, 1) x(trainx)]; % construct coefficient matrix
        b_lin = X_lin\Y; % estimate parameters
        % test the model by computing the prediction for the left-out data point
        pred_lin_term(p) = [1 x(testx)] * b_lin; 
        
        X_quad = [ones(n-1, 1) x(trainx) x(trainx).^2]; % construct coefficient matrix
        b_quad = X_quad\Y; 
        pred_quad_term(p) = [1 x(testx) x(testx).^2] * b_quad; 
    end
    
% quantify how well the predictions match the data using coefficient of determination
    Q2_lin = 100 * (1 - sum((y - pred_lin_term').^2) / sum((y - mean(y)).^2));
    Q2_quad = 100 * (1 - sum((y - pred_quad_term').^2) / sum((y - mean(y)).^2));
    
    % Results
    fprintf('Model %d : Q2_lin = %.2f, Q2_quad = %.2f\n', k, Q2_lin, Q2_quad);

    % visualize
    %plot(x,y,'o', x, pred_quad_term,x,pred_lin_term)
end
