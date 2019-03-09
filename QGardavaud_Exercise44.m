%Quentin Gardavaud
%06/03/2019
%Exercise 44

%Parameters
U_0 = 100; %Initial quantity
dt_0 = 10; %Initial step time 
T = 60; %Total time

%Logistic model
M = 500;
r = 0.1;
f = @(u, t) r*(1 - u/M)*u;

%Asking for the maximal iteration k
kmax = input ('Please give the maximal value of k \n');

%Solving of the equation for different k
ii = 0;
while ii <= kmax-1 
    dt = (2^(-ii))*dt_0 ;
    [tsol1, usol1] = ode_FE(f, U_0, dt, T);
    [tsol2, usol2] = ode_FE(f, U_0, dt/2, T);
    ii = ii + 1;
end

%Display
plot(tsol1, usol1, 'b-');
title('Display of logistic model with dt = 10*2^-k');
hold on
plot(tsol2, usol2, 'r-');
legend(['k = ' num2str((kmax-1))],['k = ' num2str(kmax)]);
xlabel('t');  ylabel('N(t)');
filestem = strcat('tmp_',num2str(dt));
