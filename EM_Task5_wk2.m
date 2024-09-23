clc, close all; 

function ds = decayDAE(~,s)      % ~ here is to avoid having a code's color different from green
z = s(1); 
y = s(2);
dz = -2 * z + y ^ 2;  
y_e= 2 * z - 100 * log(y) - 5;
ds = [dz; y_e]; 
end

s0 = [2 0.99005]; 
tspan =[0,10]; 
M = [1 0 ; 0 0];
opts = odeset('Mass',M);
[t,s] = ode15s(@decayDAE,tspan,s0,opts);
figure;
plot(t,s) 
xlabel('Time t')
ylabel('Solution s')
grid on