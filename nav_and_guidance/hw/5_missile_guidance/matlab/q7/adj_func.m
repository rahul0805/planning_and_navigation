function p_dot = adj_func(t,p,lambda,T)
p_dot = zeros(2,1);
M = [0, lambda/(t*T);
    -1, 1/T];
p_dot = M*p;
end

