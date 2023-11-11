t = 0:0.5:120;
k = 0.05;
y = 75*exp(-k.*t);
figure(1);
plot(t,y);
title('Change of y when k=0.05');
xlabel('time[min]');
ylabel('Drugs in the body[g]');
legend('k = 0.05');