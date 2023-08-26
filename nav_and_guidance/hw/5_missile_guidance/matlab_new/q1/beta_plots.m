function [betas] = beta_plots(t,y, vt, vu, theta_target)
betas = ones(2,length(y));
for i = 1:length(y)
    beta = y(1,i);
    R = y(2,i);
    
    beta_dot = (-vt(i)*sin(beta-theta_target(i)))/(R);
    R_dot = (vt(i)*cos(beta-theta_target(i))) - (vu(i));
    
    beta_ddot = (beta_dot/R)*((R_dot/R)-(vt(i)*cos(beta-theta_target(i))));

    betas(1,i) = (beta_dot);
    betas(2,i) = (beta_ddot);
end
end

