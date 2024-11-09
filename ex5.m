x = linspace(0,9,1000) ; % define the vector x in the interval [0,9]
y1 = f(x,170); % compute the 
y2 = f(x,280); % compute the 
y3 = f(x,420); % compute the 
plot(x,y1,'b-','LineWidth',2)
hold on 
plot(x,y2,'r--','LineWidth',2)
plot(x,y3,'g-','LineWidth',2)% plot the three 
hold off
title ('Solutions to dy/dx = −3x + 4x2 − 14 cos(x)') % add a title 
legend ('C=170','C=280','C=420','Location','best') % add a legend

function y = f(x,C)
y = -(3/2)*(x.^2)+(4/3)*(x.^3)-14*sin(x)+C; % fill-in with the 
end