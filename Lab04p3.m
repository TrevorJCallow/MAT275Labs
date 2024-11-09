t0 = 0; tf = 50; y0 = [1;0];
[t,Y] = ode45(@f,[t0,tf],y0);
u1 = Y(:,1); u2 = Y(:,2);

figure(1)
hold on;
plot(t, u1, 'b-+');ylabel('u1');
plot(t, u2, 'ro-');ylabel("v(t)=y'(t)'")
legend('y(t)', 'v(t)');
ylim([-2.1, 2.1]);
hold off;

figure(2)
plot(u1, u2);
axis square;
xlabel('u1');
ylabel('u2');
ylim([-2.1, 2.1]);
xlim([-2.1, 2.1]);

A = [t, Y(:,1), Y(:,2)];
index = abs(A(:,2:3)) >= 0.025;

%----------------------------------------------------------------------
function dydt = f(t,Y)
    y = Y(1); v = Y(2);
    dydt = [ v ; sin(t)+2*v+4*y ];
end
