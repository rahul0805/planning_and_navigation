function flag = isInside(P1,P2,P3,P)
A = area_cal (P1,P2,P3);
A1 = area_cal (P,P2,P3);
A2 = area_cal (P1,P,P3);
A3 = area_cal (P1,P2,P);
flag = 0;
if(abs(A - (A1+A2+A3))<1e-6)
    flag = 1;
end

