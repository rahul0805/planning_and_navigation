%% Problem 3
%%
%% Initialise Parameters
t0=0; tf=10;
t_2 = linspace(0,10,1000); 

phi_e = 0;
theta_e = pi/6;
psi_e = 0;
O = zeros(3,3);
O_b_i = [];
O_e_i = [];
O_b_e = [];
euler_angles = [];
dt = 0.01;

phi_dot =  sin(0.05*t_2);
theta_dot =  0.3*cos(0.01*t_2);
psi_dot =  0.5*sin(0.01*t_2);

orientation_matrix_initial = [1, 0, 0; 0, 1, 0; 0, 0, 1];



%% Part from I to B - Orientation Matrix using Poission Integral 

options = odeset('RelTol',1e-12,'AbsTol',1e-12);
sol = ode45(@(t,O_linear) poisson_integral(t,O_linear),[t0, tf],orientation_matrix_initial, options); %% Poission Integral using ode45
O_2_linear = deval(sol,t_2); % Obtaining Function for all reqired time of evaluation
for i=1:length(t_2)
    O(1,1) = O_2_linear(1,i);
    O(1,2) = O_2_linear(2,i);
    O(1,3) = O_2_linear(3,i);

    O(2,1) = O_2_linear(4,i);
    O(2,2) = O_2_linear(5,i);
    O(2,3) = O_2_linear(6,i);

    O(3,1) = O_2_linear(7,i);
    O(3,2) = O_2_linear(8,i);
    O(3,3) = O_2_linear(9,i);
    O_b_i = [O_b_i;(O)];
end

%% Part I to E 
rot_an = [];
for i=1:length(t_2)
    matrix = orientation_from_angles([phi_e,theta_e, psi_e]);
    O_e_i = [O_e_i;matrix];
%     phi_e = phi_e+(phi_dot(i)*dt);
%     theta_e = theta_e+(theta_dot(i)*dt);
%     psi_e = psi_e+(psi_dot(i)*dt);
%     
    phi_e = 20*(1-cos(0.05*t_2(i)));
    theta_e = (pi/6)+30*(sin(0.01*t_2(i)));
    psi_e = 50*(1-cos(0.01*t_2(i)));
    rot_an = [rot_an;[psi_e, theta_e, psi_e]];
    
end

%% Part B to E 

for i=1:length(t_2)
    o_e_i = O_e_i(((i-1)*3)+1:i*3,1:3);
    o_b_i = O_b_i(((i-1)*3)+1:i*3,1:3);
    R = o_b_i*(inv(o_e_i));
    O_b_e = [O_b_e; R];
    eulers = euler_from_rotation(R);
    euler_angles = [euler_angles; eulers];
end
%% Plotting

fig4 = figure();
fig4.Position = [10 10 900 600];
ax4 = axes(fig4);
for i = 1:3
    for j = 1:3
        subplot(3,3,(i-1)*3+j);
        O_b = [];
        for ijk = 1:length(t_2)
            x = O_b_e(3*(ijk-1)+i,j);
            O_b = [O_b;x];
        end
        plot(t_2, O_b, 'b');
        ax = gca;
        ax.TitleFontSizeMultiplier = 0.5;
    end
end

fig5 = figure();
fig5.Position = [10 10 900 600];
ax5 = axes(fig5);
for i = 1:3
    subplot(3,1,i);
    O_b = [];
    for ijk = 1:length(t_2)
        x = euler_angles(ijk,i);
        O_b = [O_b;x];
    end
    plot(t_2, O_b, 'b');
    ax = gca;
    ax.TitleFontSizeMultiplier = 0.5;
end


