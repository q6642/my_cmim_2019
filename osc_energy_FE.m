%Quentin Gardavaud
%Exercise 4.10
%09/03/2019

%Forward-Euler scheme (cf p-117)

%Data, coming from material course
omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

%initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

%Step equation forward in time
for n = 1:N_t
    u(n+1) = u(n) + dt*v(n);
    v(n+1) = v(n) - dt*omega^2*u(n);
end

%Display of real solution versus solution obtained by Forward-Euler scheme
plot (t, u, 'b-', t , X_0*cos(omega*t), 'r--');
title ('Example of oscillation model');
legend ('numerical', 'exact','Location', 'northwest');
xlabel ('t');
print ('tmp', '-dpdf'); print('tmp', '-dpng');

%Call to osc_energy function
[pot, kin] = osc_energy(u, v, omega);

%Loop 'for' to compute the energy at each times 
for ii = 1:length(t)
    tot_energy(ii) = pot(ii) + kin(ii);
end 

%display of energy
figure;
plot (t,tot_energy);
xlabel ('t'); ylabel('Total energy');
title ('Total energy depending on time. Method used: Forward-Euler scheme');







