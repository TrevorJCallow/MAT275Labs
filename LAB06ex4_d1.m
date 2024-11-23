clear all;

omega0 = 2; 
c = 0;  % No damping
omega = 1.9;  % Frequency close to omega0

param = [omega0, c, omega];

t0 = 0; 
y0 = 0; 
v0 = 0; 
Y0 = [y0; v0]; 
tf = 80;  % Extended simulation time

options = odeset('AbsTol', 1e-10, 'RelTol', 1e-10);
[t, Y] = ode45(@f, [t0, tf], Y0, options, param);

y = Y(:, 1);

% Define envelope functions
C = 1 / abs(omega0^2 - omega^2);
A = 2 * C * sin(0.5 * abs(omega0 - omega) * t); % Envelope amplitude
negA = -A;

figure;
plot(t, y, '-b', t, A, '-r', t, negA, '-g');
ylabel('y');
xlabel('t');
legend('Oscillation', 'A(t)', '-A(t)');
title('Oscillation and Envelope Functions (\omega = 1.9)');
grid on;

function dYdt = f(t, Y, param)
    y = Y(1);
    v = Y(2);
    omega0 = param(1); 
    c = param(2); 
    omega = param(3);
    dYdt = [v; cos(omega * t) - omega0^2 * y - c * v];
end
