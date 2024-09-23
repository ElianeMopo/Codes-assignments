clc, close all;

% Numerical solution
function ds = odesol(~, s,k)    % ~ here is to avoid having a code's color different from green
    x1 = s(1);
    x2 = s(2);
    k1 = k(1);
    k2 = k(2);
    a = k(3);
    dx1 = -k1 * x1 + a;
    dx2 = -k1 * x1 - k2 * x2 + a;
    ds = [dx1; dx2];
end
k = [0.06, 0.03, 4];
tspan = [0, 300];
s0 = [0 0];
[t, s] = ode45(@odesol, tspan, s0, [], k);
plot(t, s);
legend('x_1(t)', 'x_2(t)');
xlabel('Time t');
ylabel('Solution s');title('Numerical solution')


% Using the symbolic toolbox
k1 = k(1);
k2 = k(2);
a = k(3);
syms x1(t) x2(t)
eqns = [diff(x1,t) == -k1 * x1 + a, diff(x2,t) == -k1 * x1 - k2 * x2 + a];
conds = [x1(0) == 0, x2(0) == 0];
[S_x1, S_x2] = dsolve(eqns, conds);
figure;
fplot(S_x1, [0 300])
hold on
fplot(S_x2, [0 300])
legend('x_1(t)', 'x_2(t)');
xlabel('Time t');
ylabel('Solution s');
title('symbolic toolbox solution')
%[S_x1, S_x1]


% Comparaison and visualization
% See the graphs, they look the same