function euler_angles = euler_from_rotation(R)
euler_angles = zeros(3,1);
if abs(R(3,1)) ~= 1
    
    %% theta vals
    theta1 = -asin(R(1,3));
    theta2 = pi - theta1;

    %% psi vals
    psi1 = atan2((R(2,3)/cos(theta1)) , (R(3,3)/cos(theta1)));
    psi2 = atan2((R(2,3)/cos(theta2)) , (R(3,3)/cos(theta2)));

    %% phi vals
    phi1 = atan2((R(1,2)/cos(theta1)) , (R(1,1)/cos(theta1)));
    phi2 = atan2((R(1,2)/cos(theta2)) , (R(1,1)/cos(theta2)));

    euler_angles = [psi1, theta1, phi1];
else
    phi = 0;
    if R(1,3)==-1
        theta = pi/2;
        psi = phi + atan2(R(2,1), R(3,1));
    else
        theta = -pi/2;
        psi = -phi + atan2(-R(2,1), -R(3,1));

    end
    euler_angles = [ psi,theta, phi];
end

end