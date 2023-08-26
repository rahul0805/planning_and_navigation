function [tP, x_target, x_missile,beta,theta,R] = get_cbp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini)
optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP, yCBP] = ode45(@(t,y)guid_func_cbp(t,y, vt, vu, theta_target), t, y0, optPos);

x_target = dyn(tP,x_target_ini,vt*ones(length(tP),1),theta_target*ones(length(tP),1));
x_missile = dyn(tP,x_missile_ini,vu*ones(length(tP),1),yCBP(:,1));

beta = yCBP(:,1)*0;
theta = yCBP(:,1);
R = yCBP(:,2);
end

