%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];
t = 0:0.01:100;
vt = 5;
theta_target = pi/2;

%% calculations 
vu = 6;
y0 = [0;100];
[tP1, yCBP1,x_target1,x_missile1,betas1] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 8;
y0 = [asin(vt/vu);100];
[tP2, yCBP2,x_target2,x_missile2,betas2] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 10;
y0 = [asin(vt/vu);100];
[tP3, yCBP3,x_target3,x_missile3,betas3] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
%% calculations 
vu = 6;
y0 = [asin(vt/vu);100];
[tP1, yCBP1,x_target1,x_missile1,betas1] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 8;
y0 = [asin(vt/vu);100];
[tP2, yCBP2,x_target2,x_missile2,betas2] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);
vu = 10;
y0 = [asin(vt/vu);100];
[tP3, yCBP3,x_target3,x_missile3,betas3] = callables(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini);

%% plotting part
plottables(tP1, yCBP1,x_target1,x_missile1,betas1,tP2, yCBP2,x_target2,x_missile2,betas2,tP3, yCBP3,x_target3,x_missile3,betas3);

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
plot(tP1(1:end),yCBP1(1:end,2),  'Linewidth', 2);
hold on;
plot(tP2(1:end),yCBP2(1:end,2),  'Linewidth', 2);
plot(tP3(1:end),yCBP3(1:end,2),  'Linewidth', 2);
hold off;
