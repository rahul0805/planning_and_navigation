function y_dot = guid_func(t,y, vt, vu, theta_target_old, lambda)
beta = y(1);
theta = y(2);
R = y(3);
% index = t*100 
theta_target = theta_target_old+ cos(t);

R_dot = (vt*cos(beta-theta_target)) - (vu*cos(beta-theta));
beta_dot = -1*((vt*sin(beta-theta_target)) - (vu*sin(beta-theta)))/(R);
theta_dot = lambda*beta_dot;

y_dot = ones(3,1);
y_dot(1) = beta_dot;
y_dot(2) = theta_dot;
y_dot(3) = R_dot;
end

