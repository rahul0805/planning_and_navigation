function [value, isterminal, direction] = stop_pos_rand(t,y)
    value = y(3)-0.5;
    isterminal = 1;
    direction = 0;
end

