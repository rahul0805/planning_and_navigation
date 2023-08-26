function x_dot = drone_dyn(t,x)
%% intialising
x_dot = zeros(15,1);
phi = pi/6;
g = 9.80665;
O = [ x(7),  x(8),  x(9);
      x(10), x(11), x(12);
      x(13), x(14), x(15);];
% an = euler_from_rotation(O);
% phi = an(3);
omega = [0;0;1];
a_m = [(-1-(g*sin(phi)*sin(t)));
        -(g*sin(phi)*cos(t));
        -g*cos(phi)];
G = [0;0;-g];
%% Velocity
x_dot(1) = x(4);
x_dot(2) = x(5);
x_dot(3) = x(6);
%% Acceleration
a_b = ((a_m - O*G));
a = inv(O)*a_b;
x_dot(4) = a(1);
x_dot(5) = a(2);
x_dot(6) = a(3);

%% Oriention 
omega_cross = [0, -omega(3), omega(2);
               omega(3), 0, -omega(1);
               -omega(2), omega(1), 0];
omega_cross = omega_cross*-1;

O_dot = omega_cross*O;

for i =1:3
    for j=1:3
        x_dot(6+((i-1)*3)+j) = O_dot(i,j);
    end
end
 
end

