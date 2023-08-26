function norm = find_norm(x0)
% fprintf("%s\n",x0);
x = x0(1);
y = x0(2);
x1=0;
y1=0;
x2=5;
y2=5;
x3=2.5;
y3=0;
global r1 r2 r3;
r = [(x-x1)^2+(y-y1)^2-r1^2,(x-x2)^2+(y-y2)^2-r2^2, (x-x3)^2+(y-y3)^2-r3^2]';
norm = r(1)^2 + r(2)^2 + r(3)^2;