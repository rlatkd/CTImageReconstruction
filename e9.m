%filename HH.m
%numerical solution of the space-clamped Hodgkin-Huxley equations
clear all
clf
global check;
global t1p t2p ip; %parameters for the function izero(t)
in_HH
plot_Potential=[];
for step=1:4
    in_mhnv
    vstart = vstart + 1;
    for klok=1:klokmax
        t=klok*dt;                      %note time
        m=snew(m,alpham(v),betam(v),dt); %update m
        h=snew(h,alphah(v),betah(v),dt); %update h
        n=snew(n,alphan(v),betan(v),dt); %update n
        gNa=gNabar*(m^3)*h;    %sodium conductance
        gK =gKbar*(n^4);    %potassium conductance
        g=gNa+gK+gLbar;         %total conductance
        gE=gNa*ENa+gK*EK+gLbar*EL;         %gE=g*E
        %save old value of v for checking purposes:
        v_old=v;
        %update v:
        v=(v+(dt/C)*(gE+izero(t)))/(1+(dt/C)*g);
        if(check)
            E=gE/g;
            chv=C*(v-v_old)/dt+g*(v-E)-izero(t)
        end
        %store results for future plotting:
        mhn_plot(:,klok)=[m h n]';
        v_plot(klok)=v;
        t_plot(klok)=t;
        plot_Potential(step,klok)=v;
        hold on
    end
end
plot(t_plot,plot_Potential);
axis([0, klokmax*dt, -85, 40]);
hold on
xlabel('Time(ms)');
ylabel('Voltage(mV)');
title('Membrane Potential');
legend('vstart=-64','vstart=-63','vstart=-62','vstart=-61');