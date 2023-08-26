function [p_mean, p_sol1, p_sol2, p_sol3] = get_pos(p1,theta1, p2, theta2, p3, theta3)

T1 = tan((pi/2)-theta1);
T2 = tan((pi/2)-theta2);
T3 = tan((pi/2)-theta3);

p_sol1 = pos_fix(p1,p2,T1,T2);
p_sol2 = pos_fix(p2,p3,T2,T3);
p_sol3 = pos_fix(p3,p1,T3,T1);

p_mean = (p_sol3 + p_sol2 + p_sol1)/3;

end

