clc, close all;

% ODE numerical solver
function ds = odesol(~, s)    % ~ here is to avoid having a code's color different from green
    x = s(1);
    z = s(2);
    dx = z + 4;
    dz = -3 * x;
    ds = [dx; dz];
end

tspan = [0, 10];
s0 = [2 3];
[t, s] = ode45(@odesol, tspan, s0);
plot(t, s);
legend('x(t)', 'z(t)');
xlabel('Time t');
ylabel('Solution s');title('Numerical solution')


% Symbolic toolbox
syms x(t) z(t)
eqns = [diff(x,t) == z+4, diff(z,t) == -3*x];
conds = [x(0) == s0(1), z(0) == s0(2)];
[S_x, S_z] = dsolve(eqns, conds);
figure;
fplot(S_x, [0 10])
hold on
fplot(S_z, [0 10])
legend('x(t)', 'z(t)');
xlabel('Time t');
ylabel('Solution s');
title('Symbolic toolbox solution')
%[S_x, S_z]


% Comparaison and visualization
% See the graphs, they look the same