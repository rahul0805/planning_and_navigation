load 'AE584_Midterm_P2.mat'
p1 = [1.52;0;0];
p2 = [0;0;0];
p0 = [0.52;0;-1];
soln = [];
p = p0;
for i=1:50
    theta = subAngL1L2(i);
    psi1= bearingL2St1(i);
    psi2 = bearingL2St2(i);
    
    cost = @(p) the_cost(p, p1, p2, theta, psi1, psi2);
    options = optimoptions(@fminunc,'OptimalityTolerance',1e-2);
    [sol1,~] = fminunc(cost,p);
    p = sol1;
    
    soln = [soln;mat2cell(sol1,3,1)];
end

px = [];
py = [];
pz = [];
fig = figure();
scatter3(p1(1), p1(2), p1(3),'r','filled', 'o');
hold on;
scatter3(p2(1), p2(2), p2(3),'yellow','filled', 'o');
for i=1:length(soln)
    pp = cell2mat(soln(i));
    scatter3(pp(1), pp(2), pp(3),'g','filled', 'o');
    px = [px;pp(1)];
    py = [py;pp(2)];
    pz = [pz;pp(3)];
end
hold off;


fig = figure();
subplot(3,1,1);
plot(px);
subplot(3,1,2);
plot(py);
subplot(3,1,3);
plot(pz);