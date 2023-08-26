p1 = [0;0];
p2 = [4;2];
p3 = [1;4];

%% part c
theta1 = -165;
theta2 = 150;

T1 = tan(deg2rad(90-theta1));
T2 = tan(deg2rad(90-theta2));

P_sol = pos_fix(p1,p2,T1,T2);

fig = figure();
scatter(p1(1),p1(2),'g','filled', 'o');
hold on;
scatter(p2(1),p2(2),'g','filled', 'o');
scatter(P_sol(1),P_sol(2),'r','filled', 'o');
axis equal
hold off

%% part d
theta1 = -140;
theta2 = 90;
theta3 = -30;

T1 = tan(deg2rad(90-theta1));
T2 = tan(deg2rad(90-theta2));
T3 = tan(deg2rad(90-theta3));

p_sol1 = pos_fix(p1,p2,T1,T2);
p_sol2 = pos_fix(p2,p3,T2,T3);
p_sol3 = pos_fix(p3,p1,T3,T1);

p_mean = (p_sol3 + p_sol2 + p_sol1)/3;

fig = figure();
scatter(p1(1),p1(2),'g','filled', 'o');
hold on;
scatter(p2(1),p2(2),'g','filled', 'o');
scatter(p3(1),p3(2),'g','filled', 'o');
scatter(p_sol1(1),p_sol1(2),'b','filled', 'o');
scatter(p_sol2(1),p_sol2(2),'b','filled', 'o');
scatter(p_sol3(1),p_sol3(2),'b','filled', 'o');
scatter(p_mean(1),p_mean(2),'r','filled', 'o');
axis equal
hold off

  

