%filename: sa.m
clear all % clear all variables
global T TS TMAX QMAX;
global Rs Csa dt;
in_sa %initialization
 
change_Psa=zeros(1,klokmax);
choose_Psa=zeros(1,250);
change_Q=zeros(1,klokmax);
maxPressure=[];
minPressure=[];
 
opt_Csa=0.0011;
 
for n=1:4
    Csa=opt_Csa/n;
    for klok=1:klokmax
        t=klok*dt;
        QAo=QAo_now(t);
        Psa=Psa_new(Psa,QAo); %new Psa overwrites old
        %Store values in arrays for future plotting:
        t_plot(klok)=t;
        QAo_plot(klok)=QAo;
        Psa_plot(klok)=Psa;
        change_Psa(n,klok)=Psa_plot(klok);
        change_Q(n,klok)= QAo_plot(klok);
    end
   
end
 
maxPressure=max(choose_Psa,[],2);
minPressure=min(choose_Psa,[],2);
 
%Now plot results in one figure 
% and Psa(t) in lower frame
figure(1);
plot(t_plot,change_Psa);
hold on
legend('Csa=0.0011','Csa=0.0055','Csa=0.00037','Csa=0.000275');
xlabel('time(s)');
ylabel('pressure(mmHg)');
title('systemic artrial pressures for changing compliance');
 
figure(2);
plot(t_plot,change_Q);
hold on
legend('Csa=0.0011','Csa=0.00055','Csa=0.00037','Csa=0.000275')
xlabel('time(s)');
ylabel('blood flow(liters/min)');
title('difference blood flow for changing artrial compliance');