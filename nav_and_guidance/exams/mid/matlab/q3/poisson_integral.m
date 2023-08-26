%% Poisson's Integral Implementation
function O_dot_linear = poisson_integral(t,O_linear)
O = [O_linear(1), O_linear(2), O_linear(3); 
     O_linear(4), O_linear(5), O_linear(6); 
     O_linear(7), O_linear(8), O_linear(9);];
O_dot = zeros(3,3);
O_dot_linear = zeros(9,1);
omega = [cos(2*t),cos(2*t),0.025*t];
omega_cross = [0, -omega(3), omega(2);
               omega(3), 0, -omega(1);
               -omega(2), omega(1), 0];
omega_cross = omega_cross*-1;
%% O_dot elements

O_dot(1,1) =  omega_cross(1,1)*O(1,1) + omega_cross(1,2)*O(2,1) + omega_cross(1,3)*O(3,1);
O_dot(1,2) =  omega_cross(1,1)*O(1,2) + omega_cross(1,2)*O(2,2) + omega_cross(1,3)*O(3,2);
O_dot(1,3) =  omega_cross(1,1)*O(1,3) + omega_cross(1,2)*O(2,3) + omega_cross(1,3)*O(3,3);

O_dot(2,1) =  omega_cross(2,1)*O(1,1) + omega_cross(2,2)*O(2,1) + omega_cross(2,3)*O(3,1);
O_dot(2,2) =  omega_cross(2,1)*O(1,2) + omega_cross(2,2)*O(2,2) + omega_cross(2,3)*O(3,2);
O_dot(2,3) =  omega_cross(2,1)*O(1,3) + omega_cross(2,2)*O(2,3) + omega_cross(2,3)*O(3,3);

O_dot(3,1) =  omega_cross(3,1)*O(1,1) + omega_cross(3,2)*O(2,1) + omega_cross(3,3)*O(3,1);
O_dot(3,2) =  omega_cross(3,1)*O(1,2) + omega_cross(3,2)*O(2,2) + omega_cross(3,3)*O(3,2);
O_dot(3,3) =  omega_cross(3,1)*O(1,3) + omega_cross(3,2)*O(2,3) + omega_cross(3,3)*O(3,3);
%%
O_dot_linear(1) = O_dot(1,1);
O_dot_linear(2) = O_dot(1,2); 
O_dot_linear(3) = O_dot(1,3);

O_dot_linear(4) = O_dot(2,1); 
O_dot_linear(5) = O_dot(2,2);
O_dot_linear(6) = O_dot(2,3);

O_dot_linear(7) = O_dot(3,1);
O_dot_linear(8) = O_dot(3,2);
O_dot_linear(9) = O_dot(3,3);

end