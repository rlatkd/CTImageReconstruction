%filename: sa.m
clear all % clear all variables
global T TS TMAX QMAX;
global Rs Csa dt;
in_sa %initialization
 
for klok=1:klokmax
    t=klok*dt;
    QAo=QAo_now(t);
    Psa=Psa_new(Psa,QAo); %new Psa overwrites old
    %Store values in arrays for future plotting:
    t_plot(klok)=t;
    QAo_plot(klok)=QAo;
    Psa_plot(klok)=Psa;
end
figure(1);
subplot(2,1,1), plot(t_plot,QAo_plot);
hold on
subplot(2,1,2), plot(t_plot,Psa_plot);
hold on
 
 
QMAX=2*QMAX;
for klok=1:klokmax
    t=klok*dt;
    QAo=QAo_now(t);
    Psa=Psa_new(Psa,QAo); %new Psa overwrites old
    %Store values in arrays for future plotting:
    t_plot(klok)=t;
    QAo_plot(klok)=QAo;
    Psa_plot(klok)=Psa;
end
 
%Now plot results in one figure 
% and Psa(t) in lower frame
subplot(2,1,1), plot(t_plot,QAo_plot,'k');
hold on
legend('summit of human','melituria of Patient');
xlabel('time(s)');
ylabel('blood flow(liters/min)');
title('blood flow about time');
 
subplot(2,1,2), plot(t_plot,Psa_plot,'k');
hold on
legend('summit of human','melituria of Patient');
xlabel('time(s)');
ylabel('pressure(mmHg)');
title('systemic artrial pressure');
