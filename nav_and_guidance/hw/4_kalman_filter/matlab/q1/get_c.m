function C_k = get_c(x1,x2,x3,r)
r_dash_1 = sqrt((r(1)-x1(1))^2 + (r(2)-x1(2))^2);
r_dash_2 = sqrt((r(1)-x2(1))^2 + (r(2)-x2(2))^2);
r_dash_3 = sqrt((r(1)-x2(1))^2 + (r(2)-x3(2))^2); 
C_k = [
       (r(1)-x1(1))/r_dash_1,(r(2)-x1(2))/r_dash_1;
       (r(1)-x2(1))/r_dash_2,(r(2)-x2(2))/r_dash_2;
       (r(1)-x3(1))/r_dash_3,(r(2)-x3(2))/r_dash_3;
        ];
end

