function theta = get_thetas(P,P1)

T = (P(2)-P1(2))/(P(1)-P1(1));
theta = (pi/2) - atan(T);
end

