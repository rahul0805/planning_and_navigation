function Area = area_cal(P1, P2, P3)
Area = abs(((P1(1) * (P2(2) - P3(2))) + (P2(1) * (P3(2) - P1(2)))+ (P3(1) * (P1(2) - P2(2))))/ 2.0);
end

