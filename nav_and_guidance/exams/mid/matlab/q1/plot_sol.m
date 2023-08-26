function plot_sol(p1,p2,p3,p_sol)
fig = figure();
scatter(p1(1),p1(2),'g','filled', 'o');
hold on;
scatter(p2(1),p2(2),'g','filled', 'o');
scatter(p3(1),p3(2),'g','filled', 'o');
scatter(p_sol(1),p_sol(2),'r','filled', 'o');
axis equal
hold off

end

