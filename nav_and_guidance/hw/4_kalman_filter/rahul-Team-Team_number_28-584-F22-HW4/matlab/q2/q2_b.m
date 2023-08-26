load('../rcwA.mat')
prev = rcwA_Ts_0_01;
now = rcwA_Ts_0_01;
samp = [0.1,1];
for tt = 1:2
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
    D3 = diag([0.005,0.005,0.005]);

    R = 0.001*I;
    Q = 10*eye(6);
    P_k = 10*eye(6);
    T_mocap = samp(tt);
    rat = T_mocap/T;

    for i =1:2000
        k = i-1;

        w1 = randn(3,1);
        w2 = randn(3,1);
        w3 = randn(3,1);

        if(mod(i,rat)==0)
            C_k = [I, 0*I]; 
        else
            C_k = [0*I, 0*I];
        end


        omega_k = [0;0;1] + D1*w1;
        a_k = [(-1-(g*(sin(phi)*sin(k*T))));-g*sin(phi)*cos(k*T);-g*cos(phi)] + D2*w2;
        omega_cross = get_om_cross(omega_k);
        E_k = expm(-T*omega_cross);
        y_k = prev(:,i+1) + D3*w3;
        

        x_new = (A*x_k) + 0.5*(B*((Ori_k'*a_k)-g_a));
        Ori_new = E_k*Ori_k;

        P_k1_k = A*P_k*A' + Q;
        K_k = P_k1_k*C_k'*(inv((C_k*P_k1_k*C_k') + R));

        x_k_new = x_new + (K_k*(y_k - (C_k*x_new)));
        P_k_new = P_k1_k - (K_k*C_k*P_k1_k);


        Ori_k = Ori_new;
        x_k = x_k_new;
        now(:,i+1) =x_k(1:3);
    end
