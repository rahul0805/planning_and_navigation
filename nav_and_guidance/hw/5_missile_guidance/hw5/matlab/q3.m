%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];
%% calculations 

t = 0:0.01:100;
vt = 5;
theta_target = pi/2;
vu = 6;
y0 = [0;0;100];

lambda = 0.25;
[tP1_PP, x_target1_PP, x_missile1_PP,beta1_PP,theta1_PP,R1_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 0.5;
[tP2_PP, x_target2_PP, x_missile2_PP,beta2_PP,theta2_PP,R2_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 0.75;
[tP3_PP, x_target3_PP, x_missile3_PP,beta3_PP,theta3_PP,R3_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 0.9;
[tP4_PP, x_target4_PP, x_missile4_PP,beta4_PP,theta4_PP,R4_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 1;
[tP5_PP, x_target5_PP, x_missile5_PP,beta5_PP,theta5_PP,R5_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 2;
[tP6_PP, x_target6_PP, x_missile6_PP,beta6_PP,theta6_PP,R6_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 5;
[tP7_PP, x_target7_PP, x_missile7_PP,beta7_PP,theta7_PP,R7_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 50;
[tP8_PP, x_target8_PP, x_missile8_PP,beta8_PP,theta8_PP,R8_PP] = get_pp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
y0 = [asin(vt/vu);100];
[tP1_CBP, x_target1_CBP, x_missile1_CBP,beta1_CBP,theta1_CBP,R1_CBP] = get_cbp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
%% plotting 



fig1 = figure();
plot(x_target1_PP(1,:),x_target1_PP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target2_PP(1,:),x_target2_PP(2,:),'r',  'Linewidth', 2);
plot(x_target3_PP(1,:),x_target3_PP(2,:),'r',  'Linewidth', 2);
plot(x_target4_PP(1,:),x_target4_PP(2,:),'r',  'Linewidth', 2);
plot(x_missile1_PP(1,:),x_missile1_PP(2,:),  'Linewidth', 2);
plot(x_missile2_PP(1,:),x_missile2_PP(2,:),  'Linewidth', 2);
plot(x_missile3_PP(1,:),x_missile3_PP(2,:),  'Linewidth', 2);
plot(x_missile4_PP(1,:),x_missile4_PP(2,:),  'Linewidth', 2);
scatter(x_missile1_PP(1,end),x_missile1_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile2_PP(1,end),x_missile2_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile3_PP(1,end),x_missile3_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile4_PP(1,end),x_missile4_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','','','lambda = 0.25','lambda = 0.5','lambda = 0.75','lambda = 0.9');
saveas(fig1,'./plots/q3_plot_traj1.png');
savefig(fig1,'./plots/q3_plot_traj1');
hold off;

fig2 = figure();
plot(tP1_PP,R1_PP,'Linewidth', 2);
hold on;
plot(tP2_PP,R2_PP,'Linewidth', 2);
plot(tP3_PP,R3_PP,'Linewidth', 2);
plot(tP4_PP,R4_PP,'Linewidth', 2);
legend('lambda = 0.25','lambda = 0.5','lambda = 0.75','lambda = 0.9');
saveas(fig2,'./plots/q3_plot_dist1.png');
savefig(fig2,'./plots/q3_plot_dist1');
hold off;


fig3 = figure();
plot(x_target5_PP(1,:),x_target5_PP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target6_PP(1,:),x_target6_PP(2,:),'r',  'Linewidth', 2);
plot(x_target7_PP(1,:),x_target7_PP(2,:),'r',  'Linewidth', 2);
plot(x_target8_PP(1,:),x_target8_PP(2,:),'r',  'Linewidth', 2);
plot(x_target1_CBP(1,:),x_target1_CBP(2,:),'r',  'Linewidth', 2);
plot(x_missile5_PP(1,:),x_missile5_PP(2,:),  'Linewidth', 2);
plot(x_missile6_PP(1,:),x_missile6_PP(2,:),  'Linewidth', 2);
plot(x_missile7_PP(1,:),x_missile7_PP(2,:),  'Linewidth', 2);
plot(x_missile8_PP(1,:),x_missile8_PP(2,:),  'Linewidth', 2);
plot(x_missile1_CBP(1,:),x_missile1_CBP(2,:),  'Linewidth', 2);
scatter(x_missile5_PP(1,end),x_missile5_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile6_PP(1,end),x_missile6_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile7_PP(1,end),x_missile7_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile8_PP(1,end),x_missile8_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile1_CBP(1,end),x_missile1_CBP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','','','lambda = 1','lambda = 2','lambda = 5','lambda = 50');
saveas(fig3,'./plots/q3_plot_traj3.png');
savefig(fig3,'./plots/q3_plot_traj3');
hold off;

fig4 = figure();
plot(tP5_PP,R5_PP,'Linewidth', 2);
hold on;
plot(tP6_PP,R6_PP,'Linewidth', 2);
plot(tP7_PP,R7_PP,'Linewidth', 2);
plot(tP8_PP,R8_PP,'Linewidth', 2);
plot(tP1_CBP,R1_CBP,'Linewidth', 2);
legend('lambda = 1','lambda = 2','lambda = 5','lambda = 50');
saveas(fig4,'./plots/q3_plot_dist2.png');
savefig(fig4,'./plots/q3_plot_dist2');
hold off;




