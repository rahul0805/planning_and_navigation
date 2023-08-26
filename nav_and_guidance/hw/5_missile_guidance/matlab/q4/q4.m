%% intial conditions
x_missile_ini = [0;0];
x_target_ini = [100;0];


%% calculations 

t = 0:0.01:100;
y0 = [0;0;100];
vt = 5;
vu = 6;
theta_target = pi/2;
lambda = 0.25;

optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
% [tP, yCBP] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target,lambda), t, y0, optPos);
tP = t;
yCBP = ones(length(t),3);
tP = t;
idxEnd = 1;
Ts = 0.01;
u = y0(1) + 0.25*randn(1);
yCBP(1,1) = 0;
yCBP(1,2) = 0;
yCBP(1,3) = 100;
for ii = 2:length(t)
    [tt, xx, ~, ~, ie] = ode45(@(t,y)guid_func(t,y, vt, vu, theta_target,lambda,u), [ii-2 ii-1]*Ts, yCBP(ii-1,:),optPos);
    idxEnd = ii;
    yCBP(ii,:) = xx(end,:);
    if (~isempty(ie))
       tP(ii) = tt(end);
       break;
    end
    u = yCBP(ii,1) + 0.25*randn(1);
end

x_target = dyn(tP(1:idxEnd),x_target_ini,vt*ones(idxEnd,1),theta_target*ones(length((1:idxEnd)),1));
x_missile = dyn(tP(1:idxEnd),x_missile_ini,vu*ones(length(1:idxEnd),1),yCBP((1:idxEnd),2));


%% plotting part

fig1 = figure();
plot(x_target(1,:),x_target(2,:),'r');
hold on;
plot(x_missile(1,:),x_missile(2,:),'b');
hold off;

