function x = dyn(t,xini,v,theta)
x = ones(2,length(t));

x(1,1) = xini(1);
x(2,1) = xini(2);
for i = 2:length(t)
    dt = t(i)-t(i-1);
    x(1,i) = x(1,i-1) + (v(i-1)*cos(theta(i-1))*dt);
    x(2,i) = x(2,i-1) + (v(i-1)*sin(theta(i-1))*dt);
end
end

