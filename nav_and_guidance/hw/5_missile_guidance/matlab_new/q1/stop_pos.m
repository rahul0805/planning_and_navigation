function [value, isterminal, direction] = stop_pos(t,y)
    value = y(2);
    isterminal = 1;
    direction = 0;
end

