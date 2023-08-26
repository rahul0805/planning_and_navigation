%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];
t = 0:0.01:100;
theta_target = pi/2;
vt = 5;

%% calculations 
vu = 6;
y0 = [asin(vt/vu);100];
[tP1_CBP, x_target1_CBP, x_missile1_CBP,beta1_CBP,theta1_CBP,R1_CBP] = get_cbp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
y0 = [0;100];
[tP1_DP, x_target1_DP, x_missile1_DP,beta1_DP,theta1_DP,R1_DP,betas1_DP] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 8;
y0 = [asin(vt/vu);100];
[tP2_CBP, x_target2_CBP, x_missile2_CBP,beta2_CBP,theta2_CBP,R2_CBP] = get_cbp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
y0 = [0;100];
[tP2_DP, x_target2_DP, x_missile2_DP,beta2_DP,theta2_DP,R2_DP,betas2_DP] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 11;
y0 = [asin(vt/vu);100];
[tP3_CBP, x_target3_CBP, x_missile3_CBP,beta3_CBP,theta3_CBP,R3_CBP] = get_cbp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
y0 = [0;100];
[tP3_DP, x_target3_DP, x_missile3_DP,beta3_DP,theta3_DP,R3_DP,betas3_DP] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);

%%

fig1 = figure();
subplot(3,1,1)
plot(x_target1_DP(1,:),x_target1_DP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target1_CBP(1,:),x_target1_CBP(2,:),'r',  'Linewidth', 2);
plot(x_missile1_DP(1,:),x_missile1_DP(2,:),  'Linewidth', 2);
scatter(x_target1_DP(1,end),x_target1_DP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
plot(x_missile1_CBP(1,:),x_missile1_CBP(2,:),  'Linewidth', 2);
scatter(x_target1_CBP(1,end),x_target1_CBP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','DP V = 6','','CBP V = 6','');
hold off;
subplot(3,1,2)
plot(x_target2_DP(1,:),x_target2_DP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target2_CBP(1,:),x_target2_CBP(2,:),'r',  'Linewidth', 2);
plot(x_missile2_DP(1,:),x_missile2_DP(2,:),  'Linewidth', 2);
scatter(x_target2_DP(1,end),x_target2_DP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
plot(x_missile2_CBP(1,:),x_missile2_CBP(2,:),  'Linewidth', 2);
scatter(x_target2_CBP(1,end),x_target2_CBP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','DP V = 8','','CBP V = 8','');
hold off;
subplot(3,1,3)
plot(x_target3_DP(1,:),x_target3_DP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target3_CBP(1,:),x_target3_CBP(2,:),'r',  'Linewidth', 2);
plot(x_missile3_DP(1,:),x_missile3_DP(2,:),  'Linewidth', 2);
scatter(x_target3_DP(1,end),x_target3_DP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
plot(x_missile3_CBP(1,:),x_missile3_CBP(2,:),  'Linewidth', 2);
scatter(x_target3_CBP(1,end),x_target3_CBP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','DP V = 11','','CBP V = 11','');
saveas(fig1,'./plots/q2_plot_traj1.png');
savefig(fig1,'./plots/q2_plot_traj1');
hold off;
