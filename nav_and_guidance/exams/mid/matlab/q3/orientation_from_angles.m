function matrix = orientation_from_angles(euler_angles)
matrix = zeros(3,3);
O_3 = zeros(3,3);
O_2 = zeros(3,3);
O_1 = zeros(3,3);
phi = euler_angles(1);
theta = euler_angles(2);
psi = euler_angles(3);
%% Orientation matrix elements

O_3 = [ cos(phi),  sin(phi),    0;
        -sin(phi), cos(phi),    0;
                0,         0,   1;
        ];


O_2 = [ 1,    0,    0;
                0,    cos(theta),    sin(theta);
        0,     -sin(theta),   cos(theta);
        ];
    
O_1 = [ cos(psi),  sin(psi),    0;
        -sin(psi), cos(psi),    0;
                0,         0,   1;
        ];
matrix = O_1*(O_2*O_3);
    
%%
end