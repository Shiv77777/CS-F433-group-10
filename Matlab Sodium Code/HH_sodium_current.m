%% Simulation of voltage clamp experiments for sodium current.
% Data of Hodgkin and Huxley, J. Physiol, 116:500-544, 1952. Each
% data set corresponds to a different voltage clamp, as indicated.
% Time (in ms) is the first row, g_Na is the second row.
%  6 mV:
data1 = [0.1700    0.3400    0.5520    0.7220    1.1000    1.4700    2.0200    2.8200    4.1800    6.4300    8.8100   11.2000
         0.0097    0.0350    0.0450    0.0420    0.0420    0.0420    0.0420    0.0410    0.0380    0.0380    0.0370    0.0370];
%  10 mV:  
data2 = [0.1490    0.3400    0.5100    0.7010    1.1000    1.4900    1.9700    2.8000    4.1600    6.4100    8.7700   11.3000
         0.0400    0.0900    0.1100    0.1200    0.1200    0.1200    0.1100    0.1100    0.1000    0.0900    0.0800    0.0800];
%  19 mV:
data3 = [0.3240    0.5200    0.6920    1.1000    1.5200    1.9900    2.8100    4.1400    6.4200    8.7600   11.2000
         0.2900    0.5400    0.6600    0.7400    0.7700    0.9360    0.7600    0.2900    0.1400    0.1500    0.1600];
%  26 mV:
data4 = [0.1520    0.3570    0.5780    0.7360    1.1300    1.5600    1.9900    2.8300    4.1800    6.4300    8.8100   11.2000
         0.1600    0.8300    1.3000    1.7000    2.4000    2.4000    2.0000    1.3000    0.4500    0.3900    0.4800    0.5000];
%  32 mV:
data5 = [0.2109    0.4218    0.5906    0.7804    1.1600    1.5610    2.0460    2.8690    4.2180    6.4750    8.7950   11.2400
         0.2100    1.6600    2.7000    3.9500    4.7700    4.3400    3.2900    1.6000    0.5200    0.2600    0.4000    0.5500];
%  38 mV:
data6 = [0.1898    0.4008    0.5906    0.7804    1.1390    1.5610    2.0460    2.8690    4.1970    6.4540    8.8170   11.2400
         0.6300    3.3300    5.8300    6.6500    6.8500    6.0100    4.1200    2.0200    0.9400    0.4700    0.8200    0.5500];
%  51 mV:
data7 = [0.2109    0.3797    0.7382    1.1180    0.5906    1.5190    2.0250    2.8470    4.1970    6.4330    8.8170   11.2400
         1.6700    6.8700   11.2400    9.9800   10.6200    6.6400    4.1200    1.6000    0.9400    0.6700    0.8200    0.9700];
%  63 mV:
data8 = [0.1898    0.3586    0.5484    0.7382    1.1180    1.5400    2.0250    2.8470    4.1760    6.4330    8.7740   11.2200
         3.7500   10.6240   13.5357   12.6970    9.7710    5.8020    2.8700    0.5600    0.1100    0.2600    0.4000    0.5500];
%  76 mV:
data9 = [0.1690    0.3590    0.5480    0.7170    1.1000    1.5000    2.0000    2.8100    4.1600    6.4100    8.7700   11.2000
         6.1000   17.0000   18.0000   17.0000   11.0000    5.9000    3.2000    1.5000    1.2000    1.6000    1.5000    1.2000];
%  88 mV:
data10 = [0.1476    0.3164    0.5273    0.7171    1.0970    1.4980    1.9830    2.8050    4.1550    6.4120    8.7530   11.2000
          6.8700   15.8300   17.2800   14.7700    8.1000    3.2900    0.9900    0.5500    0.9300    0.8700    0.4000    0.1300];    
%  100 mV:     
data11 = [0.1266    0.2531    0.5062    0.6960    1.0550    1.4760    1.9830    2.7840    4.1340    6.4120    8.7530
          9.5800   17.2900   17.4900   14.3600    7.4700    2.2500    1.2000    1.5900    1.5600    1.2900    0.1900];
%  109 mV:
data12 = [0.1055    0.2742    0.4851    0.6750    1.0550    1.4760    1.9400    2.7630    4.1130    6.3700    8.7530
         12.7100   18.3300   17.4900   13.5200    6.8500    2.2500    2.0300    2.8400    2.3900    1.2900    0.1900];

%% Performing simulations and generating Figure 8.7
g_Na = 70;
figure(1); clf; 
v = 6; xo = [0.04 0.7]; 
ax1 = axes('position',[0.10 0.075 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
 plot(data1(1,:),data1(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[0.1],'Xtick',1:11);
box off; axis([0 12 0 0.15]);
xlabel('$t$ (ms)','interpreter','latex','fontsize',11);
text(12.2,0.45*0.15,'$v = 6$~mV','interpreter','latex','fontsize',10);
  
v = 10.0; xo = [0.05 0.7];
ax1 = axes('position',[0.10 (0.075+0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data2(1,:),data2(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[0.1],'Xtick',[]);
box off; axis([0 12 0 0.15]);
text(12.2,0.30*0.15,'$v = 10$~mV','interpreter','latex','fontsize',10);

v = 19; xo = [0.04 0.7];
ax1 = axes('position',[0.10 (0.075+2*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data3(1,:),data3(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[1],'Xtick',[]);
box off; axis([0 12 0 1.2]);
text(12.2,0.45*1.2,'$v = 19$~mV','interpreter','latex','fontsize',10);

v = 26; xo = [0.03 0.65];
ax1 = axes('position',[0.10 (0.075+3*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data4(1,:),data4(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[2.5],'Xtick',[]);
box off; axis([0 12 0 3]);
text(12.2,0.45*3,'$v = 26$~mV','interpreter','latex','fontsize',10);

v = 32; xo = [0.0 0.6]; 
ax1 = axes('position',[0.10 (0.075+4*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data5(1,:),data5(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[5],'Xtick',[]);
box off; axis([0 12 0 6]);
text(12.2,0.45*6,'$v = 32$~mV','interpreter','latex','fontsize',10);
 
v = 38; xo = [0.0 0.6]; 
ax1 = axes('position',[0.10 (0.075+5*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data6(1,:),data6(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[10],'Xtick',[]);
box off; axis([0 12 0 15]);
text(12.2,0.45*15,'$v = 38$~mV','interpreter','latex','fontsize',10);

v = 51; xo = [0.0 0.6]; 
ax1 = axes('position',[0.10 (0.075+6*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data7(1,:),data7(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 51$~mV','interpreter','latex','fontsize',10);
ylabel('$g_{Na}$ (mS$\cdot$cm$^{-2}$)','interpreter','latex','fontsize',11);

v = 63; xo = [0 0.65]; 
ax1 = axes('position',[0.10 (0.075+7*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data8(1,:),data8(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 63$~mV','interpreter','latex','fontsize',10);

v = 76; xo = [0 0.7]; 
ax1 = axes('position',[0.10 (0.075+8*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data9(1,:),data9(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 76$~mV','interpreter','latex','fontsize',10);

v = 88; xo = [0 0.7]; 
ax1 = axes('position',[0.10 (0.075+9*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data10(1,:),data10(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 88$~mV','interpreter','latex','fontsize',10);

v = 100; xo = [0 0.6]; 
ax1 = axes('position',[0.10 (0.075+10*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data11(1,:),data11(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[20],'Xtick',[]);
box off; axis([0 12 0 25]);
text(12.2,0.45*25,'$v = 100$~mV','interpreter','latex','fontsize',10);

v = 109; xo = [0 0.6];
ax1 = axes('position',[0.10 (0.075+11*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_mh,[0 12],xo,[],v);
g = g_Na*(x(:,1).^3).*x(:,2);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data12(1,:),data12(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[20],'Xtick',[]);
box off; axis([0 12 0 25]);
text(12.2,0.45*25,'$v = 109$~mV','interpreter','latex','fontsize',10);
