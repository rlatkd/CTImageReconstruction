%filename: sa.m
clear all % clear all variables
global T TS TMAX QMAX;
global Rs Csa dt;
in_sa %initialization
 
other_Psa = [];
 
Psa = 87;
%% ex2 (a)
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
%with QAo(t) in upper frame
% and Psa(t) in lower frame
figure (1)
plot(t_plot,Psa_plot)
xlabel('TIme(s)'); ylabel('Pressure(HHmg)');
title('Change of Arterial Pressure at Psa = 85')
 
opt_Psa = Psa_plot
%% ex2 (b)