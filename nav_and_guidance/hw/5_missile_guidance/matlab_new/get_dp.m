function [tP1, x_target1, x_missile1,beta,theta,R,betas1] = get_dp(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini)
optPos = odeset('Events', @(t,y)stop_pos(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP1, yP1] = ode45(@(t,y)guid_func_dp(t,y, vt, vu, theta_target), t, y0, optPos);
x_target1 = dyn(tP1,x_target_ini,vt*ones(length(tP1),1),theta_target*ones(length(tP1),1));
x_missile1 = dyn(tP1,x_missile_ini,vu*ones(length(tP1),1),yP1(:,1));
betas1 = beta_plots(tP1,yP1', vt*ones(length(tP1),1), vu*ones(length(tP1),1), theta_target*ones(length(tP1),1));
beta = yP1(:,1);
theta = yP1(:,1);
R = yP1(:,2);
end

