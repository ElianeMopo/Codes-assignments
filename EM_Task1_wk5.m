clear; close; clc;

 % A=[2 1
 %     1 3];
A = rand(5,4);
n = size(A,1);
m = size(A,2);

% Means
x_bar = zeros(1, n-1);
for k = 1:m
    x_bar(k) = sum(A(:,k))/n;
end
disp("x_bar= ")
disp(x_bar)

% Variances
var_x = zeros(1, n-1);
for k=1:m
    var_x(k) = sum((A(:,k)-x_bar(k)).^2)/(n-1);
end
disp('var_x= ')
disp(var_x)

% Covariance matix
cov_mat = zeros(n-1,m);
for i = 1:m
    for j = 1:m
        cov_mat(i,j) = sum((A(:,i)-x_bar(i)).*(A(:,j)-x_bar(j)))/(n-1);
    end
end
disp('cov_mat= ')
disp(cov_mat)

% Correlation matrix
corr_mat = zeros(n-1,m);
for i = 1:m
    for j = 1:m
        corr_mat(i,j) = cov_mat(i,j)/sqrt(var_x(i)*var_x(j));
    end
end
disp('corr_mat= ')
disp(corr_mat)