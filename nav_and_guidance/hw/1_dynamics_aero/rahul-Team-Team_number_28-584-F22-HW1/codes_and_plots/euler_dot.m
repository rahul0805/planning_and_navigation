function xdot = euler_dot(t,euler_angles) 
xdot = zeros(3,1);
phi = euler_angles(1);
theta = euler_angles(2);
psi = euler_angles(3);
omega = [cos(2*t), cos(2*t), 0.025*t]; 
s_inverse = [1,  sin(phi)*tan(theta), cos(phi)*tan(theta);
             0, cos(phi), -sin(phi);
             0, sin(phi)*sec(theta), cos(phi)*sec(theta)];
xdot(1) = omega(1)*s_inverse(1,1) + omega(2)*s_inverse(1,2) + omega(3)*s_inverse(1,3);
xdot(2) = omega(1)*s_inverse(2,1) + omega(2)*s_inverse(2,2) + omega(3)*s_inverse(2,3);
xdot(3) = omega(1)*s_inverse(3,1) + omega(2)*s_inverse(3,2) + omega(3)*s_inverse(3,3);
end