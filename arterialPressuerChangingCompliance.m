%filename: sa.m
clear all % clear all variables
global T TS TMAX QMAX;
global Rs Csa dt;
in_sa %initialization
 
change_Psa=zeros(1,klokmax);
choose_Psa=zeros(1,250);
maxPressure=[];
minPressure=[];
numCsa=0.0009:0.0002:0.0017;
 
for n=1:5
    Csa=0.0009+0.0002*(n-1);
    for klok=1:klokmax
        t=klok*dt;
        QAo=QAo_now(t);
        Psa=Psa_new(Psa,QAo); %new Psa overwrites old
        %Store values in arrays for future plotting:
        t_plot(klok)=t;
        QAo_plot(klok)=QAo;
        Psa_plot(klok)=Psa;
        change_Psa(n,klok)=Psa_plot(klok);
        
    end
   
end
for a=1:5
    for b=1:250
        choose_Psa(a,b)=change_Psa(a,b+1250);
    end
end
 
maxPressure=max(choose_Psa,[],2);
minPressure=min(choose_Psa,[],2);
 
%Now plot results in one figure 
% and Psa(t) in lower frame
figure(1);
plot(t_plot,change_Psa);
hold on
legend('Csa=0.0009','Csa=0.0011','Csa=0.0013','Csa=0.0015','Csa=0.0017');
xlabel('time(s)');
ylabel('pressure(mmHg)');
title('systemic artrial pressures for changing compliance');
 
figure(2);
stem(numCsa,minPressure,'k');
hold on
stem(numCsa,maxPressure,'r');
hold on grid on
legend('min blood pressure','max blood pressure');
xlabel('Csa(0.0009, 0.0011, 0.0013, 0.0015, 0.0017)');
ylabel('min and max Blood pressure(mmHg)');
title('difference of blood pressure');