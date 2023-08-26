function cost = parta_cost(p, p1, p2, theta, psi)

r_hat = [0;1;0];

l1 = sqrt((p-p1)'*(p-p1));
l2 = sqrt((p-p2)'*(p-p2));

l = sqrt((p1-p2)'*(p1-p2));

part1 = (p-p1)'*(p2-p1);
part2 = l1*l2*cos(deg2rad(theta));
part3 = l1*l1;

E2 = part3 - part2 - part1;

part4 = (p2-p)'*r_hat;
part5 = l2*cos(deg2rad(psi));

E3 = part5 - part4;

flag =0;
if(l1<=0.01 || l2<=0.01)
    flag = 1;
end
cost = 10*flag+ E2^2 + E3^2 ;

end
