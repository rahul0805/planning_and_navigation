%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];
%% calculations 

t = 0:0.01:100;
vt = 5;
theta_target = pi/2;
vu = 6;
y0 = [0;0;100];

lambda = 1;
[tP5_PP, x_target5_PP, x_missile5_PP,beta5_PP,theta5_PP,R5_PP] = get_pp_rand_osc(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 1.5;
[tP6_PP, x_target6_PP, x_missile6_PP,beta6_PP,theta6_PP,R6_PP] = get_pp_rand_osc(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 2;
[tP7_PP, x_target7_PP, x_missile7_PP,beta7_PP,theta7_PP,R7_PP] = get_pp_rand_osc(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
lambda = 2.50;
[tP8_PP, x_target8_PP, x_missile8_PP,beta8_PP,theta8_PP,R8_PP] = get_pp_rand_osc(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda);
%% plotting 


fig3 = figure();
plot(x_target5_PP(1,:),x_target5_PP(2,:),'r',  'Linewidth', 2);
hold on;
plot(x_target6_PP(1,:),x_target6_PP(2,:),'r',  'Linewidth', 2);
plot(x_target7_PP(1,:),x_target7_PP(2,:),'r',  'Linewidth', 2);
plot(x_target8_PP(1,:),x_target8_PP(2,:),'r',  'Linewidth', 2);
plot(x_missile5_PP(1,:),x_missile5_PP(2,:),  'Linewidth', 2);
plot(x_missile6_PP(1,:),x_missile6_PP(2,:),  'Linewidth', 2);
plot(x_missile7_PP(1,:),x_missile7_PP(2,:),  'Linewidth', 2);
plot(x_missile8_PP(1,:),x_missile8_PP(2,:),  'Linewidth', 2);
scatter(x_missile5_PP(1,end),x_missile5_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile6_PP(1,end),x_missile6_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile7_PP(1,end),x_missile7_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
scatter(x_missile8_PP(1,end),x_missile8_PP(2,end), 100,'pentagram','MarkerFaceColor','#D95319');
legend('','','','','DP','lambda = 1.5','lambda = 2','lambda = 2.5');
saveas(fig3,'./plots/q6_plot_traj.png');
savefig(fig3,'./plots/q6_plot_traj');
hold off;

fig4 = figure();
plot(tP5_PP,R5_PP,'Linewidth', 2);
hold on;
plot(tP6_PP,R6_PP,'Linewidth', 2);
plot(tP7_PP,R7_PP,'Linewidth', 2);
plot(tP8_PP,R8_PP,'Linewidth', 2);
legend('DP','lambda = 1.5','lambda = 2','lambda = 2.5');
saveas(fig4,'./plots/q6_plot_dist.png');
savefig(fig4,'./plots/q6_plot_dist');
hold off;




