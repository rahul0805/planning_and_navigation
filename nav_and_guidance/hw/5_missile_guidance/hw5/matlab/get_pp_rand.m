function [tP, x_target, x_missile,beta,theta,R] = get_pp_rand(t,y0, vt, vu, theta_target, x_missile_ini,x_target_ini, lambda)
optPos = odeset('Events', @(t,y)stop_pos_rand(t,y), 'RelTol', 1e-6, 'AbsTol',1e-6);
yCBP = ones(length(t),3);
tP = t;
idxEnd = 1;
Ts = 0.01;
u = y0(1) + 0.25*randn(1);
yCBP(1,1) = 0;
yCBP(1,2) = 0;
yCBP(1,3) = 100;
for ii = 2:length(t)
    [tt, xx, ~, ~, ie] = ode45(@(t,y)guid_func_pp_rand(t,y, vt, vu, theta_target,lambda,u), [ii-2 ii-1]*Ts, yCBP(ii-1,:),optPos);
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

beta = yCBP(:,1);
theta = yCBP(:,2);
R = yCBP(:,3);


end

