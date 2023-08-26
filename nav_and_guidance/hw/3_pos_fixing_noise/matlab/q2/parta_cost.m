function cost = parta_cost(p, p1, p2, theta1, theta2)

psi = theta2;
psi1 = theta1;
check1 = psi/abs(psi);
check2 = psi1/abs(psi1);
if(check2==check1)
    theta = abs(theta2-theta1);
else
    theta = 360 - (abs(theta1)+abs(theta2));
end
pn = [0;1];

l1 = sqrt((p-p1)'*(p-p1));
l2 = sqrt((p-p2)'*(p-p2));

l = sqrt((p1-p2)'*(p1-p2));

part1 = (p-p1)'*(p2-p1);
part2 = l1*l2*cos(deg2rad(theta));
part3 = l1*l1;

E2 = part3 - part2 - part1;

part4 = (p2-p)'*pn;
part5 = l2*cos(deg2rad(psi));

E3 = part5 - part4;

part6 = (p1-p)'*pn;
part7 = l1*cos(deg2rad(psi1));

E1 = part6 - part7;

% cost = E1^2 + E2^2 + E3^2 ;
flag =0;
if(l1<=0.01 || l2<=0.01)
    flag = 1;
end
cost = 10*flag+ E2^2 + E3^2 ;

end
