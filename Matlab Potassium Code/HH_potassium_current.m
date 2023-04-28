%% Simulation of voltage clamp experiments for potassium current.
% Data of Hodgkin and Huxley, J. Physiol, 116:500-544, 1952. Each
% data set corresponds to a different voltage clamp, as indicated.
% Time (in ms) is the first row, g_K is the second row.
%  6 mV:
data1 = [0.1740    0.3420    0.5740    0.7430    1.1200    1.5500    2.0300    2.8300    4.1800    6.4400    8.7800   11.2000
         0.2500    0.2800    0.2800    0.2900    0.3000    0.3000    0.3600    0.4140    0.5460    0.7600    0.9300    1.0900];
%  10 mV: 
data2 = [0.1640    0.3330    0.5860    0.7540    1.1100    1.4900    2.0000    2.8400    4.1900    6.3800    8.8000   11.2000
         0.2500    0.2600    0.2600    0.3100    0.3100    0.3200    0.4000    0.5000    0.7100    1.0000    1.3000    1.6000];
%  19 mV:
data3 = [0.1908    0.3391    0.5723    0.7630    1.1230    1.5680    2.0130    2.8190    4.1750    6.4430    8.8380   11.2500
         0.4200    0.2500    0.3400    0.3400    0.3300    0.5000    0.6700    1.0800    1.7500    2.7400    3.5700    4.3200];
%  26 mV:
data4 = [0.1696    0.3603    0.5511    0.7630    1.1230    1.5470    1.9920    2.7980    4.1970    6.4860    8.8380   11.2500
         0.5000    0.4200    0.4200    0.4200    0.5000    0.6700    0.8300    1.6700    2.8300    4.6600    5.6600    6.2400];
%  32 mV:
data5 = [0.1908    0.3391    0.5511    0.7630    1.1660    1.5680    1.9920    2.8400    4.1970    6.4640    8.8380   11.2300
         0.4200    0.3400    0.4200    0.4200    0.5800    0.8300    1.3300    2.4200    4.1600    6.3300    7.8200    8.2400];
%  38 mV:
data6 = [0.1908    0.4027    0.5723    0.7630    1.1230    1.5470    2.0130    2.8400    4.1750    6.4640    8.8170   11.2800
         0.3300    0.4200    0.5000    0.5000    0.8300    1.5000    2.0800    3.6600    5.9900    8.4100    9.7400    9.9000];
%  51 mV:
data7 = [0.1696    0.3815    0.5723    0.7630    1.1450    1.5470    1.9920    2.8400    4.1750    6.4430    8.8170   11.2500
         0.6700    0.5000    0.6700    0.9200    1.7500    2.8300    3.9100    6.7500    9.5800   11.9100   12.8200   12.9800];
%  63 mV:
data8 = [0.1696    0.4027    0.5723    0.7418    1.1230    1.5260    1.9920    2.8400    4.1970    6.4640    8.8380   11.2800
         0.5800    0.6600    1.2500    1.5000    2.6600    4.1600    6.1600    9.1600   12.4100   14.6540   15.0670   15.1460];
%  76 mV:
data9 = [0.1908    0.3815    0.5723    0.7630    1.1450    1.5260    1.9920    2.8400    4.1970    6.4430    8.8380   11.2800
         0.2500    0.2500    1.1700    1.6700    3.5000    5.8300    8.1670   11.6660   14.6640   15.5770   16.8230   16.7360];
%  88 mV:
data10 = [0.1908    0.3815    0.5934    0.7418    1.1230    1.5260    2.0130    2.8400    4.1970    6.4640    8.8170   11.2500
          0.3300    0.8300    1.5800    2.5820    4.9980    8.0810   10.6640   14.2460   16.9940   18.3240   18.5700   18.2330];     
%  100 mV:   
data11 = [0.1696    0.3815    0.5723    0.7630    1.1020    1.5470    1.9920    2.8400    4.1750    6.4640    8.8590
          0.5830    0.6660    1.4160    2.7490    6.1653    9.9980   12.8310   16.0770   18.4070   19.7370   20.0670];
%  109 mV:
data12 = [0.1696    0.3603    0.5723    0.7630    1.1020    1.5260    1.9920    2.8400    4.1330    6.4430    8.7960
          0.3331    0.4995    1.4990    3.0820    7.2480   11.2500   13.9100   17.0000   19.0800   20.4100   20.7400];

%% Performing simulations and generating 
figure(1); clf; 
v = 6; xo = 0.28; g_K = 40; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 0.075 0.60 0.07]); 
[t,x] = ode15s(@dXdT_n,[0 100],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data1(1,:),data1(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[1],'Xtick',1:11);
box off; axis([0 12 0 1.2]);
xlabel('$t$ (ms)','interpreter','latex','fontsize',11);
text(12.2,0.45*1.2,'$v = 6$~mV','interpreter','latex','fontsize',10);
  
v = 10.001; xo = 0.28; g_K = 35; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data2(1,:),data2(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[2],'Xtick',[]);
box off; axis([0 12 0 2.4]);
text(12.2,0.45*2.4,'$v = 10$~mV','interpreter','latex','fontsize',10);

v = 19; xo = 0.28; g_K = 35; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+2*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data3(1,:),data3(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[5],'Xtick',[]);
box off; axis([0 12 0 6]);
text(12.2,0.45*6,'$v = 19$~mV','interpreter','latex','fontsize',10);

v = 26; xo = 0.28; g_K = 30; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+3*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data4(1,:),data4(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[5],'Xtick',[]);
box off; axis([0 12 0 10]);
text(12.2,0.45*10,'$v = 26$~mV','interpreter','latex','fontsize',10);

v = 32; xo = 0.28; g_K = 30; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+4*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data5(1,:),data5(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[8],'Xtick',[]);
box off; axis([0 12 0 12]);
text(12.2,0.45*12,'$v = 32$~mV','interpreter','latex','fontsize',10);
 
v = 38; xo = 0.28; g_K = 27; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+5*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data6(1,:),data6(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[10],'Xtick',[]);
box off; axis([0 12 0 15]);
text(12.2,0.45*15,'$v = 38$~mV','interpreter','latex','fontsize',10);
ylabel('$g_{K}$ (mS$\cdot$cm$^{-2}$)','interpreter','latex','fontsize',11);

v = 51; xo = 0.28; g_K = 26; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+6*0.075) 0.60 0.07]); 
[t,x] = ode15s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
 plot(data7(1,:),data7(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 51$~mV','interpreter','latex','fontsize',10);
  
v = 63; xo = 0.28; g_K = 23; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+7*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data8(1,:),data8(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 63$~mV','interpreter','latex','fontsize',10);

v = 76; xo = 0.28; g_K = 23; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+8*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data9(1,:),data9(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 76$~mV','interpreter','latex','fontsize',10);

v = 88; xo = 0.28; g_K = 23; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+9*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data10(1,:),data10(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[15],'Xtick',[]);
box off; axis([0 12 0 20]);
text(12.2,0.45*20,'$v = 88$~mV','interpreter','latex','fontsize',10);

v = 100; xo = 0.28; g_K = 23; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+10*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data11(1,:),data11(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[20],'Xtick',[]);
box off; axis([0 12 0 25]);
text(12.2,0.45*25,'$v = 100$~mV','interpreter','latex','fontsize',10);

v = 109; xo = 0.28; g_K = 23; % voltage setting, initial condition, and conductivity value
ax1 = axes('position',[0.10 (0.075+11*0.075) 0.60 0.07]); 
[t,x] = ode23s(@dXdT_n,[0 12],xo,[],v);
g = g_K*(x(:,1).^4);
plot(t,g,'k-','linewidth',1.5); hold on;
plot(data12(1,:),data12(2,:),'ko','linewidth',1.5,'Markerfacecolor',[1 1 1],'Markersize',5); hold off
set(gca,'Fontsize',9,'Ytick',[20],'Xtick',[]);
box off; axis([0 12 0 25]);
text(12.2,0.45*25,'$v = 109$~mV','interpreter','latex','fontsize',10);
