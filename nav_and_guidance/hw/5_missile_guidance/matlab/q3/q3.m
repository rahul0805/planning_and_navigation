%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];


%% calculations 

t = 0:0.01:100;
y0 = [0;0;100];
vt = 5;
vu = 6;
theta_target = pi/2;
lambda = 50;

optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP, yCBP] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target,lambda), t, y0, optPos);

x_target = dyn(tP,x_target_ini,vt*ones(length(tP),1),theta_target*ones(length(tP),1));
x_missile = dyn(tP,x_missile_ini,vu*ones(length(tP),1),yCBP(:,2));


%% plotting part

fig1 = figure();
plot(x_target(1,:),x_target(2,:),'r');
hold on;
plot(x_missile(1,:),x_missile(2,:),'b');
hold off;

