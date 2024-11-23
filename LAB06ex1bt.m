clear all;

omega0 = 2; 
c = 1; 
omega = 1.5;

param = [omega0, c, omega];

t0 = 0; 
y0 = 0; 
v0 = 0; 
Y0 = [y0; v0]; 
tf = 60;

options = odeset('AbsTol', 1e-10, 'RelTol', 1e-10);
[t, Y] = ode45(@f, [t0, tf], Y0, options, param);

y = Y(:, 1); 
v = Y(:, 2);

if omega0 > omega
    alpha = atan(c * omega / (omega0^2 - omega^2));
else
    alpha = pi + atan(c * omega / (omega0^2 - omega^2));
end

C = 1 / sqrt((omega0^2 - omega^2)^2 + (c * omega)^2);

yc = y - C * cos(omega * t - alpha);

figure;
plot(t, yc, 'r-', 'LineWidth', 1.5);
ylabel('y_c');
xlabel('t');
title('Complementary Solution y_c');
grid on;

function dYdt = f(t, Y, param)
    y = Y(1);
    v = Y(2);
    omega0 = param(1); 
    c = param(2); 
    omega = param(3);
    dYdt = [v; cos(omega * t) - omega0^2 * y - c * v];
end
