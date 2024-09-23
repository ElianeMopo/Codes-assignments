clc, close all;

function dS = odesol(~, S,K)    % ~ here is to avoid having a code's color different from green
    s = S(1);
    x = S(2);
    k = K(1);
    ks = K(2);
    y = K(3);
    b = K(4);
    ds = -(k * s * x) / (ks  + s);
    dx = y * (k * s * x) / (ks  + s) - b * x;
    dS = [ds; dx];
end
K = [5, 20, 0.05, 0,01];
tspan = [0, 40];
S0 = [2000 100];
[t, S] = ode23(@odesol, tspan, S0, [], K);
plot(t, S);
legend('s(t)', 'x(t)');
xlabel('Time t');
ylabel('Solution S');