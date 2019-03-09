%Quentin Gardavaud
%Exercise 4.14
%09/03/2019


%Backward-Euler scheme to solve oscillating systems
% data
omega = 2;
P = 2*pi/omega; %period of the cos
dt = P/2000; %20 time steps per period
T = 3*P; %display of 3 periods
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

%initial conditions
X_0 = 2;
u(1) = X_0;
v(1) = 0;

%Backward Euler scheme
for n = 1:N_t
    v(n+1) = (v(n) - dt*omega^2*u(n));
    u(n+1) = u(n) + dt*v(n+1);
end

%Display of real solution versus solution obtained by Backward-Euler scheme
plot (t, u, 'b-', t , X_0*cos(omega*t), 'r--');
title ('Example of oscillation model with Backward-Euler scheme');
legend ('numerical', 'exact','Location', 'northwest');
xlabel ('t');

