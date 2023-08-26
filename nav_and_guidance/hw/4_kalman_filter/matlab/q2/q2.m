load('../rcwA.mat')
prev = rcwA_Ts_0_01;
now = rcwA_Ts_0_01;

T = 0.01;
g =  9.80665;
phi = pi/6;

x_k = [1;0;0;0;cos(phi);sin(phi)];
I = eye(3);
A = [I, T*I;
     0*I, I];
B = [((T^2))*I;
    2*T*I
    ];
Ori_k = [
        1, 0, 0;
        0, cos(phi), sin(phi);
        0, -sin(phi), cos(phi);
        ];
g_a = [0;0;-g];

D1 = diag([0.1,0.1,0.1]);
D2 = diag([0.1,0.1,0.1]);

for i =1:2000
    k = i-1;
    w1 = randn(3,1);
    w2 = randn(3,1);
    omega_k = [0;0;1] + D1*w1;
    a_k = [(-1-(g*(sin(phi)*sin(k*T))));-g*sin(phi)*cos(k*T);-g*cos(phi)] + D2*w2;
    omega_cross = get_om_cross(omega_k);
    
    E_k = expm(-T*omega_cross);
    x_new = (A*x_k) + 0.5*(B*((Ori_k'*a_k)-g_a));
    Ori_new = E_k*Ori_k;
    
    x_k = x_new;
    Ori_k = Ori_new;
    now(:,i+1) =x_k(1:3);
end

fig1 = figure();
subplot(3,1,1)
plot(0:2000,prev(1,:),'b');
hold on
plot(0:2000,now(1,:),'r');
title("x", 'FontSize',10);
hold off
subplot(3,1,2)
plot(0:2000,prev(2,:),'b');
hold on
plot(0:2000,now(2,:),'r');
title("y", 'FontSize',10);
hold off
subplot(3,1,3)
plot(0:2000,prev(3,:),'b');
hold off
plot(0:2000,now(3,:),'r');
title("z", 'FontSize',10);
hold off
saveas(fig1,'Inertial_nav.png')

fig2 = figure();
plot3(prev(1,:), prev(2,:),prev(3,:));
hold on
plot3(now(1,:), now(2,:),now(3,:),'r');
hold off
title("Trajectory with Inertial Nav Only", 'FontSize',12);
saveas(fig2,'Inertial_nav_traj.png')

