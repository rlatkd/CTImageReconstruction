for n=1:5
    Psa = 80+5.*(n-1);
    for klok=1:klokmax
     t=klok*dt;
     QAo=QAo_now(t);
     Psa=Psa_new(Psa,QAo); %new Psa overwrites old
     %Store values in arrays for future plotting:
     t_plot(klok)=t;
     QAo_plot(klok)=QAo;
     Psa_plot(n,klok)=Psa;
     diff(n,klok) = opt_Psa(1,klok) - Psa_plot(n,klok);
    end
    figure(2)
    plot(t_plot,Psa_plot)
    hold on
    xlabel('Time(s)'); ylabel('Pressure')
    title('Arterial pressure according to initial Psa(80 to 100)')
    legend('Psa = 80', 'Psa = 85', 'Psa = 90', 'Psa = 95', 'Psa= 100')
    figure(3)
    plot(t_plot, diff)
    hold on
    xlabel('Time(s)'); ylabel('Pressure(HHmg)')
    title('Pressure difference between optimal Psa and the others(80 to 100)')
    legend('Psa = 80', 'Psa = 85', 'Psa = 90', 'Psa = 95', 'Psa= 100')
end
