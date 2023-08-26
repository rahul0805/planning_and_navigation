function [normalised_time,normalised_dist] = compute_things(lambda,p0,T,tf)
[tP, pP] = ode45(@(t,p)adj_func(t,p,lambda,T,tf), [9.999 0], p0);
cut = 10;
G = zeros(length(tP)-cut,1);
time = ones(length(tP)-cut,1);
for i = 1:length(tP)-cut
    time(i) = tP(length(tP)-i+1);
    G(i) = (lambda*pP(length(tP)-i+1,2))/(T*(tf-time(i)));
end
normalised_time = (tf-time)/T;
normalised_dist = -T*G;
end

