%%% Q1

P0 =[0.01,0.1,1,10];
for_posx = zeros(4,51);
for_posy = zeros(4,51);
forb = zeros(4,51);
x1 = [0;0];
x2 = [5;5];
x3 = [2.5;0];
xx = [0.7212;2.4080];
r1 = sqrt((xx-x1)'*(xx-x1));
r2 = sqrt((xx-x2)'*(xx-x2));
r3 = sqrt((xx-x3)'*(xx-x3));

for j=1:4
    p0 = P0(j);
    D = 0.1*eye(3);
    x_k = [4;4];
    P_k = p0*eye(2);
    R = 0.1*eye(3);
    for_posx(j,1) = x_k(1);
    for_posy(j,1) = x_k(2);
    forb(j,1) = norm(P_k,'fro');
    for i=1:50
        A_k = eye(3);
        C_k = get_c(x1,x2,x3,x_k);
        w_k = randn(3,1);
        y_k = [r1;r2;r3] + D*w_k;
        g_k = get_dists(x1,x2,x3,x_k(1:2));
        K_k = P_k*C_k'*inv((C_k*P_k*C_k') + R);
        x_k_new = x_k + (K_k*(y_k - g_k));
        P_k_new = P_k - (K_k*C_k*P_k);

        x_k = x_k_new;
        P_k = P_k_new;
        for_posx(j,i+1) = x_k(1);
        for_posy(j,i+1) = x_k(2);
        forb(j,i+1) = norm(P_k,'fro');
    end
end

fig1 = figure();
for k=1:4
    subplot(2,2,k)
    plot(for_posx(k,:),for_posy(k,:),'b', 'LineWidth',2);
    hold on;
    scatter(xx(1),xx(2),'r','fill');
    hold off;
    title("p0 = "+P0(k));
end

saveas(fig1,'plot.png')

fig2 = figure();
for k=1:4
    subplot(2,2,k)
    plot(0:50,forb(k,:),'b', 'LineWidth',2);
    title("p0 = "+P0(k));
end
saveas(fig2,'norm.png')
