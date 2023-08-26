function [optimal_sol,good_sol] = get_best(p1, p2, theta, psi)

optimal = Inf;
optimal_sol = [];
good_sol = [];

for i = -5:2:5
    for j = -5:2:5
        for k=-5:2:5
            p = [i;j;k];
            cost = @(p) parta_cost(p, p1, p2, theta, psi);
            options = optimoptions(@fminunc,'OptimalityTolerance',1e-12);
            [sol1,~] = fminunc(cost,p,options);
            optimal_sol = [optimal_sol;mat2cell(sol1,3,1)];
            cost_final = parta_cost(sol1, p1, p2, theta, psi);
            if(cost_final<optimal)
                optimal = cost_final;
                good_sol = sol1;
            end
        end
    end
end
end