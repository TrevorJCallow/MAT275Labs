clear all;     % clear all variables 
m = 1;  % mass [kg]
k = 4;  % spring constant [N/m]
c = 1;  % friction coefficient [Ns/m]
omega0 = sqrt(k/m); p = c/(2*m); 
y0 =-0.8;  v0 = -0.3; % initial conditions
[t,Y] = ode45(@f,[0,10],[y0,v0],[],omega0, p); % solve for 0<t<10
y = Y(:,1); v = Y(:,2); % retrieve y, v from Y 
figure(1); plot(t,y,'bo-',t,v,'r+-');% time series for y and v 
grid on; axis tight; 
E = 0.5 * m * v.^2 + 0.5 * k * y.^2;
figure(1);
 plot(t, E, 'm-');
 xlabel('Time (s)');
 ylabel('Energy (J)');
 grid on;
 ylim([min(E)-.01,max(E)+.01])
%---------------------------------------------------
function dYdt = f(t,Y,omega0,p); % function defining the DE 
y = Y(1); v = Y(2); 
dYdt=[ v ; -2*p*v-omega0^2*y ];   % fill-in dv/dt
end
for i=1:length(y) 
    M(i)=max(abs(y(i:end)));
end
i = find(M<0.06); i = i(1);
disp(['|y|<0.06 for t > t1 with ' num2str(t(i-1)) '< t1 <' num2str(t(i))])
