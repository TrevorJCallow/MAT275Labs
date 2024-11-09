t0 = 0;
tf = 50;
y0 = [1,0];
[t,y] = ode45(@f,[t0,tf],y0);
u1 = y(:,1); u2 = y(:,2);
figure(5)
hold on; 
plot(t,u1,'b-+')
ylabel('u1');
plot(t,u2,'ro-')
ylabel('v(t)=y(t)');
legend('y(t)','v(t)')
ylim([-2.1,2.1])
hold off
figure(6)
plot(u1,u2);axis square;xlabel('u_1');ylabel('u_2');
ylim([-2.1,2.1])
xlim([-2.1,2.1])
A = [t, y(:,1),y(:,2)];
index = abs(A(:,2:3)) >=.025;
%
function dYdt= f(t,Y)
y=Y(1); v=Y(2);
dYdt = [v;sin(t)+2*(y^2)*v+4*y];
end
