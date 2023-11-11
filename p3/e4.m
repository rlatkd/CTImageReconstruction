%filename HH.m
%numerical solution of the space-clamped Hodgkin-Huxley equations
clear all
clf
global check;
global t1p t2p ip; %parameters for the function izero(t)
in_HH
plot_Potential=[];
plot_mGate=[];
plot_nGate=[];
plot_hGate=[];
plot_GK_GNA=[];
GK=[];
GNA=[];
for step=1:10
    in_mhnv
    vstart=vstart-3;
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
        GK(klok)=gK;
        GNA(klok)=gNa;
        hold on
    end
    plot_mGate=[plot_mGate;mhn_plot(1,:)];
    plot_nGate=[plot_nGate;mhn_plot(3,:)];
    plot_hGate=[plot_hGate;mhn_plot(2,:)];
end
plot_GK_GNA=[GK;GNA];
figure(1)
plot(t_plot,plot_Potential);
axis([0, klokmax*dt, -95, 40]);
hold on
xlabel('Time(ms)');
ylabel('Voltage(mV)');
title('Membrane Potential');
legend('vstart=-70','vstart=-73','vstart=-76','vstart=-79','vstart=-82','vstart=-85','vstar
t=-88','vstart=-91', 'vstart=-94', 'vstart=-97');
figure(2)
plot(t_plot,plot_mGate);
xlabel('Time(ms)');
ylabel('Percentage(%)');
title('m Parameter');
legend('vstart = -70','vstart = -73','vstart = -76','vstart = -79','vstart = -82','vstart = -85','vstart = -88','vstart = -91', 'vstart = -94', 'vstart = -97');
figure(3)
plot(t_plot,plot_nGate);
xlabel('Time(ms)');
ylabel('Percentage(%)');
title('n Parameter');
legend('vstart = -70','vstart = -73','vstart = -76','vstart = -79','vstart = -82','vstart = -85','vstart = -88','vstart = -91', 'vstart = -94', 'vstart = -97');
figure(4)
plot(t_plot,plot_hGate);
xlabel('Time(ms)');
ylabel('Percentage(%)');
title('h Parameter');
legend('vstart = -70','vstart = -73','vstart = -76','vstart = -79','vstart = -82','vstart = -85','vstart = -88','vstart = -91', 'vstart = -94', 'vstart = -97');
figure(5)
plot(t_plot,plot_GK_GNA);
xlabel('Time(ms)');
ylabel('Conductance');
title('gK and gNa');
legend('gK','gNa');