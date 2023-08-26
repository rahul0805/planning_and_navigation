function [value, isterminal, direction] = stop_pos_pp(t,y)
    value = y(3);
    isterminal = 1;
    direction = 0;
end

