function matrix = orientation_matrix_euler(euler_angles)
matrix = zeros(3,3);
a = euler_angles(1);
b = euler_angles(2);
c = euler_angles(3);
%% Orientation matrix elements
matrix(1,1) = cos(b)*cos(c); 
matrix(1,2) = cos(b)*sin(c); 
matrix(1,3) = -sin(b);

matrix(2,1) = (cos(c)*sin(a)*sin(b))-(cos(a)*sin(c));
matrix(2,2) = (sin(c)*sin(a)*sin(b))+(cos(a)*cos(c));
matrix(2,3) = cos(b)*sin(a);

matrix(3,1) = (cos(c)*cos(a)*sin(b))+(sin(a)*sin(c));
matrix(3,2) = (cos(a)*sin(c)*sin(b))-(sin(a)*cos(c));
matrix(3,3) = cos(a)*cos(b);
%%
end