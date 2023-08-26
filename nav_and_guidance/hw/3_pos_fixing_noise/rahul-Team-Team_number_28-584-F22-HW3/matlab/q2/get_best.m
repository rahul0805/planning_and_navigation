function optimal_sol = get_best(p1, p2, theta1, theta2)

optimal = Inf; 
optimal_sol = [0;0];

for i = -2:2:10
    for j = -2:2:10
        p = [i;j];
        cost = @(p) parta_cost(p, p1, p2, theta1, theta2);
        options = optimoptions(@fminunc,'OptimalityTolerance',1e-2);
        [sol1,~] = fminunc(cost,p,options);
        cost_final = parta_cost(sol1, p1, p2, theta1, theta2);
        if(cost_final<optimal)
            optimal = cost_final;
            optimal_sol = sol1;
        end
    end
end
end