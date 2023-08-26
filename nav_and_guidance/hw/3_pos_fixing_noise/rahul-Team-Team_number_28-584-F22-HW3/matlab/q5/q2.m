p1 = [0;0;0];
p2 = [5;0;0];
apt_sol = [2.5;2.5;0];
good_sols = [];
err = [];
for i = 1:200
    noise = 2*randn(1);
    theta = 90+noise;
    noise = 2*randn(1);
    psi1 = 135+noise;
    noise = 2*randn(1);
    psi2 = 90+noise;
    
    [~,good_sol] = get_best(p1, p2, theta, psi1, psi2);
    err = [err;norm(good_sol-apt_sol)];
    good_sols = [good_sols;mat2cell(good_sol,3,1)];

end

fig = figure();
[Xsp,Ysp,Zsp] = sphere;
hold on;
surf(2.5.*Xsp+ 2.5,2.5.*Ysp,2.5.*Zsp,'FaceAlpha',0.25);
scatter3(p1(1),p1(2),p1(3),'g','filled', 'o');
scatter3(p2(1),p2(2),p2(3),'g','filled', 'o');
for i = 1:length(good_sols)
    sol = cell2mat(good_sols(i));
    scatter3(sol(1),sol(2),sol(3),'b','filled', 'o');
end
scatter3(2.5,2.5,0,'r','filled', 'o');
hold off

nbins = 20;
fig = figure();
h = histogram(err,nbins);

mean_data = mean(err);
variance = var(err);




