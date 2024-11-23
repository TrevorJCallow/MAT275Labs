clear all;
omega0 = 2; 
c = 0;  % Set damping to zero
omega = omega0;  % Set omega to natural frequency (resonance)
param = [omega0, c, omega];
t0 = 0; y0 = 0; v0 = 0; 
Y0 = [y0; v0]; 
tf = 60;
options = odeset('AbsTol', 1e-10, 'RelTol', 1e-10);
[t, Y] = ode45(@f, [t0, tf], Y0, options, param);
y = Y(:, 1);
figure;
plot(t, y, 'b-');
ylabel('y');
xlabel('t');
title('Forced Oscillation with c = 0 and \omega = \omega_0');
grid on;
function dYdt = f(t, Y, param)
    y = Y(1);
    v = Y(2);
    omega0 = param(1); 
    c = param(2); 
    omega = param(3);
    dYdt = [v; cos(omega * t) - omega0^2 * y - c * v];
end
