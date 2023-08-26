function p = pos_fix(p1,p2, T1, T2)

A = [T1, -1; T2, -1];

B = [(T1*p1(1))-p1(2);(T2*p2(1))-p2(2)];

p = inv(A)*B;

end
