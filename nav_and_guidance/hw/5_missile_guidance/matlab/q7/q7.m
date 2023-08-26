lambda_set = [3,4,5];
lambda = lambda_set(1);
tf = 10;
t = 0.001:0.001:10;
p0 = [1;0];
T =1;
[tP, pP] = ode45(@(t,p)adj_func(t,p,lambda,T), t, p0);
G = zeros(length(tP)-1,1);
time = ones(length(tP)-1,1);
for i = 10:length(tP)-1
    time(i) = tP(length(tP)-i+1);
    G(i) = (lambda*pP(length(tP)-i+1,2))/(T*(tf-time(i)));
end
% scatter((tf-time)./T,-T*G);
% plot((tf-time)./T,-T*G);
plot((tf-time)./T,-T*G);
