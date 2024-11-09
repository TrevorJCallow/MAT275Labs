t0=0;tf=50;y0=[1,0];
[t,y]=ode45(@f,[t0,tf],y0);
[te,ye]=euler(@f,[t0,tf],y0,500);
u1=y(:,1);u2=y(:,2);
figure(7)
hold on
plot(t,u1,'b-+')
ylabel('u1');
plot(t,u2,'ro-')
ylabel('v(t)=y(t)');
legend('y(t)','v(t)')
ylim([-2.1,2.1])
hold off
figure(8)
plot(u1,u2);axis square;xlabel('u_1');ylabel('u_2');
ylim([-2.1,2.1])
xlim([-2.1,2.1])
A = [t, y(:,1), y(:,2)];
index = abs(A(:,2:3)) >=.025;
%-----------------------------------------------
function dYdt= f(t,Y)
y=Y(1); v=Y(2);
dYdt = [v;sin(t)+2*(y^2)*v+4*y];
end
function [t,y] = euler(f,tspan,y0,N)
m= length(y0);
t0=tspan(1);
tf=tspan(2);
h=(tf-t0)/N;
t=linspace(t0,tf,N+1);
y=zeros(m,N+1);
y(:,1)=y0';
for n=1:N
    y(:,n+1)=y(:,n)+h*f(t(n),y(:,n));
end
t=t';y=y';
end