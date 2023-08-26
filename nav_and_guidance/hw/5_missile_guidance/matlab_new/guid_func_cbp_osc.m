function y_dot = guid_func_cbp_osc(t,y, vt, vu, theta_target)
    beta = 0;
    theta =y(1);
    R = y(2);

    R_dot = (vt*cos(beta-(theta_target+cos(t)))) - (vu*cos(beta-theta));
    theta_dot = 0;

    y_dot = ones(2,1);
    y_dot(1) = theta_dot;
    y_dot(2) = R_dot;
end

