function cost = the_cost(p, p1, p2, theta, psi1, psi2)

r_hat1 = [0;1;0];
r_hat2 = [0;0;1];

l1 = sqrt((p-p1)'*(p-p1));
l2 = sqrt((p-p2)'*(p-p2));

l = sqrt((p1-p2)'*(p1-p2));

part1 = (p-p1)'*(p2-p1);
part2 = l1*l2*cos((theta));
part3 = l1*l1;

E2 = part3 - part2 - part1;

part4 = (p2-p)'*r_hat1;
part5 = l2*cos((psi1));

E3 = part5 - part4;

part6 = (p2-p)'*r_hat2;
part7 = l2*cos((psi2));

E1 = part6 - part7;


flag =0;
if(l1<=0.01 || l2<=0.01)
    flag = 1;
end
cost = 100*flag+ E2^2 + E3^2 + E1^2 ;

end
