p1 = [0;0];
p2 = [4;2];
p3 = [1;4];

%% part a
theta1 = -165;
theta2 = 150;
p = [10;6];
% parta_cost(p, p1, p2, theta1, theta2)
cost = @(p) parta_cost(p, p1, p2, theta1, theta2);
options = optimoptions(@fminunc,'OptimalityTolerance',1e-12);
[sol1,fval1] = fminunc(cost,p,options);
cost_final = parta_cost(sol1, p1, p2, theta1, theta2);

