function y_dot = guid_func_dp(t,y, vt, vu, theta_target)
beta = y(1);
R = y(2);
R_dot = (vt*cos(beta-theta_target)) - (vu);
beta_dot = (-vt*sin(beta-theta_target))/(R);

y_dot = ones(2,1);
y_dot(1) = beta_dot;
y_dot(2) = R_dot;
end

