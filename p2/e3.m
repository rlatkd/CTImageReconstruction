t = 0:0.5:120;
y = 0.1859;
k = (log(75) - log(y))./t;
figure(1);
plot(t,k);
title('Change of k when y=0.1859');
xlabel('time[min]');
ylabel('k');
legend('y = 0.1859');