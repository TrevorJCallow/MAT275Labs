t0 = 0 ; tf=50; y0= [0,0,.5];
[t,y]=ode45(@f,[t0,tf],y0);
u1 = y(:,1);u2=y(:,2);u3=y(:,3);
figure(1)
hold on
plot(t,u1,'b-+');ylabel('u1');
plot(t,u2,'ro-');ylabel("v(t)=y'(t)'");
plot(t,u3,'k-');ylabel("3v(t)=y3(t)'");
legend('y(t)','v(t)')
ylim([-2.1,2.1])
hold off
figure(2)
plot3(u1,u2,u3);
hold on
view([-40,60])
xlabel('y');ylabel('v=y');zlabel('w=y');
ylim([-2.1,2.1])
xlim([-2.1,2.1])
A=[t,y(:,1),y(:,2)];
index=abs(A(:,2:3)) >=.025;
function dYdt = f(t,Y)
y=Y(1); v = Y(2); w=Y(3);
dYdt = [v;w;cos(t)+2*(y^2)*w+4*v];
end
