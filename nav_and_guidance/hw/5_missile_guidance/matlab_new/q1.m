%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];
t = 0:0.01:100;
theta_target = pi/2;
y0 = [0;100];
vt = 5;


%% calculations 
vu = 6;
[tP1, x_target1, x_missile1,beta,theta,R1,betas1] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 8;
[tP2, x_target2, x_missile2,beta2,theta2,R2,betas2] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 11;
[tP3, x_target3, x_missile3,beta3,theta3,R3,betas3] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);

%% plotting part

fig1 = figure();
plot(x_target1(1,:),x_target1(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target2(1,:),x_target2(2,:),'r',  'Linewidth', 2);
plot(x_target3(1,:),x_target3(2,:),'r',  'Linewidth', 2);
plot(x_missile1(1,:),x_missile1(2,:),  'Linewidth', 2);
plot(x_missile2(1,:),x_missile2(2,:),  'Linewidth', 2);
plot(x_missile3(1,:),x_missile3(2,:),  'Linewidth', 2);
scatter(x_target1(1,end),x_target1(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_target2(1,end),x_target2(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_target3(1,end),x_target3(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','','DP V = 6','DP V = 8','DP V = 11');
saveas(fig1,'./plots/q1_plot_traj1.png');
savefig(fig1,'./plots/q1_plot_traj1');
hold off;

fig2 = figure();
subplot(2,1,1);
plot(tP1(1:end-10),betas1(1,1:end-10),  'Linewidth', 2);
hold on;
plot(tP2(1:end-10),betas2(1,1:end-10),  'Linewidth', 2);
plot(tP3(1:end-10),betas3(1,1:end-10),  'Linewidth', 2);
legend('DP V = 6','DP V = 8','DP V = 11');
hold off;
subplot(2,1,2);
plot(tP1(1:end-10),betas1(2,1:end-10),  'Linewidth', 2);
hold on;
plot(tP2(1:end-10),betas2(2,1:end-10),  'Linewidth', 2);
plot(tP3(1:end-10),betas3(2,1:end-10),  'Linewidth', 2);
legend('DP V = 6','DP V = 8','DP V = 11');
saveas(fig2,'./plots/q1_plot_beta.png');
savefig(fig2,'./plots/q1_plot_beta');
hold off;


fig3 = figure();
plot(tP1(1:end),R1(1:end),  'Linewidth', 2);
hold on;
plot(tP2(1:end),R2(1:end),  'Linewidth', 2);
plot(tP3(1:end),R3(1:end),  'Linewidth', 2);
legend('DP V = 6','DP V = 8','DP V = 11');
saveas(fig3,'./plots/q1_plot_dist.png');
savefig(fig3,'./plots/q1_plot_dist');
hold off;

