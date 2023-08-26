% load AE
clc 
clear all
load('AE584_Final_P1_meas_Ts_0_01.mat');
load('AE584_Final_P1_pos_Ts_0_01.mat');
mu = 0.4;
Ts = 0.01;

j = 3;    
factor = (10^(j-1));
T_measure = 0.01*factor;

Q = 0.0001*eye(6);
R = 0.001*eye(3);
% Q = eye(6);
% R = eye(3);

X_kf = zeros(6,10001);
X = [2.5; 0; 1; 0; 0.5; -0.1;];
P_k = eye(6); 

for k=0:10000
    A = get_A(X,mu,Ts);
    D1 = [zeros(3);
          0.01*eye(3)];
    w_1_k = mvnrnd(zeros(3,1),eye(3))';
    X_inter = A*X + D1*w_1_k;
    P_inter = (A*P_k*(A.')) + Q;


    if(mod(k*Ts, T_measure)==0)
        D2 = 0.01*eye(3);
        w_2_k = mvnrnd(zeros(3,1),eye(3))';
        Y = [Range(k+1);Azimuth(k+1);Elevation(k+1)]+ D2*w_2_k;

        G = get_g(X_inter);
        G_x = [G(1); AzUnwrap(G(2),0); G(3)];

        C = get_C(X_inter);
    else
        C = zeros(3,6);
        Y = [Azimuth(k+1);Elevation(k+1);Range(k+1)]*0;
        G_x = get_g(X)*0;

    end

    K = (P_inter*(C.'))*inv((C*P_inter*(C.'))+R);
    x_new = X_inter + K*(Y-G_x);
    P_new = (P_inter) - (K*C*P_inter);

    X = x_new;
    P_k = P_new;
    X_kf(:,k+1) = [X(1:3);G_x];
end
str_trj = "trajectory for "+string(T_measure);
str_trj_file = "traj_"+string(T_measure)+".png";
fig = figure();
plot3(X_kf(1,:),X_kf(2,:),X_kf(3,:));
hold on
plot3(Xref,Yref,Zref);
hold off
legend('Kalman traj','ref trajectory');
title(str_trj)
saveas(fig, str_trj_file);


str_trj_file = "vals_"+string(T_measure)+".png";
fig = figure();
subplot(3,1,1)
plot(X_kf(4,1:factor:end))
hold on
plot(Range(1:factor:end))
hold off
legend('Kalman','ref');
title("Range");
subplot(3,1,2)
plot(X_kf(5,1:factor:end))
hold on
plot(Azimuth(1:factor:end))
hold off
legend('Kalman','ref');
title("Azimuth");
subplot(3,1,3)
plot(X_kf(6,1:factor:end))
hold on
plot(Elevation(1:factor:end))
hold off
legend('Kalman','ref');
title("Elevation");
saveas(fig, str_trj_file);

function g_x = get_g(x)
    g_x = zeros(3,1);
    g_x(1) = sqrt((x(1)*x(1))+(x(2)*x(2))+(x(3)*x(3)));
    temp = -atan2(x(1),x(2));
    g_x(2) = temp;
    r = sqrt((x(1)*x(1))+(x(2)*x(2)));
    g_x(3) = atan2(x(3),r);
end
function A = get_A(x,mu,Ts)
    F = get_F(x,mu);
    O = 0*eye(3);
    I = eye(3);
    F_exp = [O,I;
        F,O;
        ];
    A = expm(F_exp*Ts);
end
function F = get_F(X,mu)
    
    x = X(1);
    y = X(2);
    z = X(3);
    
    r = sqrt((x^2)+(y^2)+(z^2));
    a = ((3*mu*(x^2))/(r^5)) - (mu/(r^3));
    b = ((3*mu*(y^2))/(r^5)) - (mu/(r^3));
    c = ((3*mu*(z^2))/(r^5)) - (mu/(r^3));
    
    d = ((3*mu*(x*y))/(r^5));
    e = ((3*mu*(x*z))/(r^5));
    f = ((3*mu*(z*y))/(r^5));
    F = [a,d,e;
        d,b,f;
        e,f,c;];
        
end
function C = get_C(X)

    planar_dist = (X(1)*X(1)) + (X(2)*X(2));
    dist = (X(1)*X(1)) + (X(2)*X(2)) + (X(3)*X(3));
    
    t1 = sqrt(dist);
    t2 = X(1)/X(2);
    t3 = X(3)/sqrt(planar_dist);
    
    a11 = X(1)/t1;
    a12 = X(2)/t1;
    a13 = X(3)/t1;
    
    a21 = -(1/(1+(t2*t2)))*(1/X(2));
    a22 = (1/(1+(t2*t2)))*(X(1)/(X(2)*X(2)));
    a23 = 0;
    
    X_k = X(1);
    Y_k = X(2);
    Z_k = X(3);
    
    an = (1/((X_k^2 + 2*Z_k^2)*sqrt(X_k^2 + Z_k^2)))*[-X_k*Z_k, 0, X_k^2];
    a31 = an(1);
    a32 = an(2);
    a33 = an(3);
    
    
    C = [a11,a12,a13,0,0,0;
        a21,a22,a23,0,0,0;
        a31,a32,a33,0,0,0];
    
end