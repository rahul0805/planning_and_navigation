function y_dot = guid_func_pp_rand_osc(t,y, vt, vu, theta_target, lambda,u)
beta = u;
theta = y(2);
R = y(3);

R_dot = (vt*cos(beta-(theta_target+cos(t)))) - (vu*cos(beta-theta));
beta_dot = -1*((vt*sin(beta-(theta_target+cos(t)))) - (vu*sin(beta-theta)))/(R);
theta_dot = lambda*beta_dot;

y_dot = ones(3,1);
y_dot(1) = beta_dot;
y_dot(2) = theta_dot;
y_dot(3) = R_dot;
end

