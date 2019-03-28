%Quentin Gardavaud
%26/03/2019
%Assignment 4, CMiM

%Parameters
a = 0.1 ;
b = 0.2 ;
omega = 1;

%Definition initial conditions and tolerance
x_initial = [asin(a/(2*b)); 3^0.5*a/2 + b*cos(asin(a/(2*b)))];
eps = 1e-6;

%Displacement solving
%Use of NR method for 100 time steps
for i=1 : 100
    dt = 0.1 ;
    phi =  pi/6 + omega*dt*i ; 
    t(i) = dt*i; %time vector
    
    %Displacements
    F =  @(u) [a*cos(phi) + b*cos(u(1)) - u(2)
         a*sin(phi) - b*sin(u(1))]; %u = [theta, d];
    J = @ (u) [-b*sin(u(1)), -1; -b*cos(u(1)), 0];
    [x, iteration_counter] = NR_method(F, J, x_initial, eps);
    theta(i) = x(1); %Angular displacement vector
    d(i) = x(2); %Linear displacement vector
    iteration_counter(i) = iteration_counter; 
    
    %Velocities
    Jv = [-b*sin(theta(i)), -1; -b*cos(theta(i)), 0]; %Constant jacobian matrix (we know theta and d) 
    dFdt =  [a*omega*sin(phi) 
           a*omega*cos(phi)]; %constant term
    velo = -Jv\dFdt; %How to get unknowns thetadot and ddot
    thetadot(i) = velo(1); %Angular velocity vector
    ddot(i) = velo(2); %Linear velocity vector
    
    %Acceleration
    Ja = Jv;
    dF2dt2 = [-a*omega^2*cos(phi)-b*(thetadot(i)^2)*cos(theta(i)) 
           -a*omega^2*sin(phi) + b*(thetadot(i)^2)*sin(theta(i))]; %constant term
    acc = -Ja\dF2dt2 ; %%How to get unknowns thetaacc and dacc
    thetaacc(i) = acc(1); %Angular acceleration vector
    dacc(i) = acc(2); %Linear acceleration vector
end 

%Display
plot (t, theta)
title('Evolution of theta versus the time')

figure
plot (t, d)
title('Evolution of distance versus the time') 

%Velocity display
figure
plot (t, thetadot)
title('Evolution of angular speed versus the time') 

figure
plot (t, ddot)
title('Evolution of d speed versus the time') 

%Acceleration display
figure
plot (t, dacc)
title('Evolution of d acceleration versus the time') 

figure
plot (t, thetaacc)
title('Evolution of angular acceleration versus the time') 
