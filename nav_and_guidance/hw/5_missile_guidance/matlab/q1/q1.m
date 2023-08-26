%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];


%% calculations 

t = 0:0.01:100;
y0 = [0;100];
vt = 5;
theta_target = pi/2;

vu = 6;
optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP1, yP1] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target), t, y0, optPos);
x_target1 = dyn(tP1,x_target_ini,vt*ones(length(tP1),1),theta_target*ones(length(tP1),1));
x_missile1 = dyn(tP1,x_missile_ini,vu*ones(length(tP1),1),yP1(:,1));
betas1 = beta_plots(tP1,yP1', vt*ones(length(tP1),1), vu*ones(length(tP1),1), theta_target*ones(length(tP1),1));


vu = 8;
optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP2, yP2] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target), t, y0, optPos);
x_target2 = dyn(tP2,x_target_ini,vt*ones(length(tP2),1),theta_target*ones(length(tP2),1));
x_missile2 = dyn(tP2,x_missile_ini,vu*ones(length(tP2),1),yP2(:,1));
betas2 = beta_plots(tP2,yP2', vt*ones(length(tP2),1), vu*ones(length(tP2),1), theta_target*ones(length(tP2),1));

vu = 11;
optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP3, yP3] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target), t, y0, optPos);
x_target3 = dyn(tP3,x_target_ini,vt*ones(length(tP3),1),theta_target*ones(length(tP3),1));
x_missile3 = dyn(tP3,x_missile_ini,vu*ones(length(tP3),1),yP3(:,1));
betas3 = beta_plots(tP3,yP3', vt*ones(length(tP3),1), vu*ones(length(tP3),1), theta_target*ones(length(tP3),1));

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
hold off;

fig2 = figure();
subplot(2,1,1);
plot(tP1(1:end-10),betas1(1,1:end-10),  'Linewidth', 2);
hold on;
plot(tP2(1:end-10),betas2(1,1:end-10),  'Linewidth', 2);
plot(tP3(1:end-10),betas3(1,1:end-10),  'Linewidth', 2);
hold off;
subplot(2,1,2);
plot(tP1(1:end-10),betas1(2,1:end-10),  'Linewidth', 2);
hold on;
plot(tP2(1:end-10),betas2(2,1:end-10),  'Linewidth', 2);
plot(tP3(1:end-10),betas3(2,1:end-10),  'Linewidth', 2);
hold off;


fig3 = figure();
plot(tP1(1:end),yP1(1:end,2),  'Linewidth', 2);
hold on;
plot(tP2(1:end),yP2(1:end,2),  'Linewidth', 2);
plot(tP3(1:end),yP3(1:end,2),  'Linewidth', 2);
hold off;

