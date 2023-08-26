p1 = [0;0;0];
p2 = [5;0;0];
 
theta = 90;
psi1 = 135;
psi2 = 90;


[my_sol,good_sol] = get_best(p1, p2, theta, psi1, psi2);

fig = figure();
[Xsp,Ysp,Zsp] = sphere;
hold on;
surf(2.5.*Xsp+ 2.5,2.5.*Ysp,2.5.*Zsp,'FaceAlpha',0.25);
scatter3(p1(1),p1(2),p1(3),'g','filled', 'o');
scatter3(p2(1),p2(2),p2(3),'g','filled', 'o');
for i = 1:length(my_sol)
    sol = cell2mat(my_sol(i));
    scatter3(sol(1),sol(2),sol(3),'b','filled', 'o');
end
scatter3(2.5,2.5,0,'r','filled', 'o');
hold off

center = [2.5;2.5;2.5];


figure()
subplot(2,2,1)
scatter(center(1), center(3),50,'yellow','fill')
hold on
scatter(2.5,0,'r','filled', 'o');
scatter(p1(1),p1(3),'g','filled', 'o');
scatter(p2(1),p2(3),'g','filled', 'o');
for i = 1:length(my_sol)
    sol = cell2mat(my_sol(i));
    scatter(sol(1),sol(3),'b','fill');
end
hold off
grid on
ylabel('$z$ (m)','interpreter','latex','fontsize',15)
xlabel('$x$ (m)','interpreter','latex','fontsize',15)
subplot(2,2,3)
scatter(center(1), center(2),50,'yellow','fill')
hold on
scatter(2.5,2.5,'red','filled', 'o');
scatter(p1(1),p1(2),'g','filled', 'o');
scatter(p2(1),p2(2),'g','filled', 'o');
for i = 1:length(my_sol)
    sol = cell2mat(my_sol(i));
    scatter(sol(1),sol(2),'b','fill');
end
hold off
grid on
ylabel('$y$ (m)','interpreter','latex','fontsize',15)
xlabel('$x$ (m)','interpreter','latex','fontsize',15)
subplot(2,2,4)
scatter(center(3), center(2),50,'yellow','fill')
hold on
scatter(0,2.5,'red','filled', 'o');
scatter(p1(3),p1(2),'g','filled', 'o');
scatter(p2(3),p2(2),'g','filled', 'o');
for i = 1:length(my_sol)
    sol = cell2mat(my_sol(i));
    scatter(sol(3),sol(2),'b','fill');
end
hold off
ylabel('$y$ (m)','interpreter','latex','fontsize',15)
xlabel('$z$ (m)','interpreter','latex','fontsize',15)
grid on

  




