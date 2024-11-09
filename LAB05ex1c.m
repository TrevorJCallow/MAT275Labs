clear all;     % clear all variables 
m = 4;  % mass [kg]
k = 4;  % spring constant [N/m]
omega0 = sqrt(k/m); 
y0 =-0.8;  v0 = -0.3; % initial conditions
[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0); % solve for 0<t<10
y = Y(:,1); v = Y(:,2);  % retrieve y, v from Y 
figure(1); plot(t,y,'ro-',t,v,'b+-');% time series for y and v 
grid on; axis tight; 
%---------------------------------------------------
function dYdt = f(t,Y,omega0); % function defining the DE 
y = Y(1); v = Y(2); 
dYdt=[ v ; - omega0^2*y ];
end