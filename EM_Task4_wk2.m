clc, close all;

function dS = odesol(~, S,k)    % ~ here is to avoid having a code's color different from green
    x = S(1);
    y = S(2);
    z = S(3);
    s = k(1);
    w = k(2);
    q = k(3);
    f = k(4);
    dx = s * (y - x * y + x - q * x ^ 2);
    dy = (-y - x * y + f * z) / s;
    dz = w * (x - z);
    dS = [dx; dy; dz];
end
k = [100, 3.835, 1e-5, 1.1];
tspan = [0, 360];
S0 = [1 2 3];
[t, S] = ode45(@odesol, tspan, S0, [], k);
plot3(S(:,1), S(:,2), S(:,3), 'b');
xlabel('x(t)');
ylabel('y(t)');
zlabel('z(t)');