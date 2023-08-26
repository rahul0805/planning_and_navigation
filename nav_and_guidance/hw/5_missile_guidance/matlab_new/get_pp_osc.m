function [tP, x_target, x_missile,beta,theta,R] = get_pp_osc(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda)

optPos = odeset('Events', @(t,y)stop_pos_pp(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
[tP, yCBP] = ode45(@(t,y)guid_func_pp_osc(t,y, vt, vu, theta_target,lambda), t, y0, optPos);

x_target = dyn_osc(tP,x_target_ini,vt*ones(length(tP),1),theta_target*ones(length(tP),1));
x_missile = dyn(tP,x_missile_ini,vu*ones(length(tP),1),yCBP(:,2));

beta = yCBP(:,1);
theta = yCBP(:,2);
R = yCBP(:,3);

end

