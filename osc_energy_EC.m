%Quentin Gardavaud
%Exercise 4.10
%09/03/2019

%Euler_Cromer scheme

%Data to modelize the same oscillating system as with Forward Euler scheme
omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 3*P;
N_t = floor(T/dt);
t = linspace(0, N_t*dt, N_t+1);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

%initial conditions
X_0 = 2;
u(1) = X_0;
v(1) = 0;

%Loop 'for' to run the loop 
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end

%Display of real solution versus solution obtained by Euler-Cromer scheme
plot (t, u, 'b-', t , X_0*cos(omega*t), 'r--');
title ('Example of oscillation model with Euler-Cromer scheme');
legend ('numerical', 'exact','Location', 'northwest');
xlabel ('t');
print ('tmp', '-dpdf'); print('tmp', '-dpng');

%Call to osc_energy function
[pot, kin] = osc_energy(u, v, omega);

%Loop 'for' to compute the energy at each times
for ii = 1:length(t)
    tot_energy(ii) = pot(ii) + kin(ii);
end 

%display of total energy
figure;
plot (t,tot_energy);
xlabel ('t'); ylabel('Total energy');
title ('Total energy depending on time. Method used: Euler-Cromer scheme');


    