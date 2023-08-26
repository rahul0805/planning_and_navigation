function r = get_dists(x1,x2,x3,xx)

r1 = sqrt((xx-x1)'*(xx-x1));
r2 = sqrt((xx-x2)'*(xx-x2));
r3 = sqrt((xx-x3)'*(xx-x3));
r = [r1;r2;r3];
end

