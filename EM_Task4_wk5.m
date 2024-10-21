clear; close all; clc;

load('xy.mat')

data.xdata = xy(:,1);
data.ydata  = xy(:,2);
n = length(data.xdata);

fun = @(theta,x) theta(1)*x.*exp(1+theta(2)*x.^2); %define the model function 
ssfun = @(theta,data) sum((data.ydata-fun(theta,data.xdata)).^2); % ss function

% Then minimize ssfun using 'fminsearch'.
th_init = [2 0.5]; % ... after some trial & error, by plotting various options
[thmin,ssmin] = fminsearch(ssfun,th_init,[],data);

yfit = fun(thmin,data.xdata);

figure;
plot(data.xdata,data.ydata,'o',data.xdata,yfit)

%%%% Compute the Jacobian analytically
J = [data.xdata.*exp(1+thmin(2)*data.xdata.^2), thmin(1)*data.xdata.^3.*exp(1+thmin(2)*data.xdata.^2)]

%%%% Compute the covariance and print the parameter estimates
sigma2 = ssmin/(n-2); % std of measurument noise estimated by the residuals
C = sigma2*inv(J'*J)%covariance of paramter estimates
std_value = sqrt(diag(C))
t_values = thmin(:)./std_value