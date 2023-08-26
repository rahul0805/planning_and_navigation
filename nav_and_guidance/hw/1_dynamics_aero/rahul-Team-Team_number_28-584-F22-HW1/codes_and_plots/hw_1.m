%% Problem 7
%%
%% Initialise Parameters
t0=0; tf=10;
euler_initial=[0 0 0];
orientation_matrix_initial = [1, 0, 0; 0, 1, 0; 0, 0, 1];

%% Part 1 - Obtaining Euler_angles from Euler derivative 

sol = ode45(@(t,y) euler_dot(t,y),[t0, tf],euler_initial); % Integrating 4.10.10 using ode45  
t_1 = linspace(0,10,1000); % Time frame
euler_angles_o = deval(sol,t_1); % Obtaining Function for all reqired time of evaluation
t_1 = t_1.';

omega_D_frame = [cos(2*t_1), cos(2*t_1), 0.025*t_1].'; % Defining Omega

%%% Orientation Matrix
O_1 = zeros(3,3,length(omega_D_frame));

for i = 1:length(omega_D_frame)
    % Orientation Matrix generated from Euler to Rotation Matrix
    O = orientation_matrix_euler(euler_angles_o(:,i)); 
    O_1(:,:,i) = O; 
end

%% Part 2 - Orientation Matrix using Poission Integral

sol = ode45(@(t,O_linear) poisson_integral(t,O_linear),[t0, tf],orientation_matrix_initial); %% Poission Integral using ode45
t_2 = linspace(0,10,1000); % Time frame
O_2_linear = deval(sol,t_2); % Obtaining Function for all reqired time of evaluation
t_2 = t_2.';

%% Part_3 - Comparing Euler using both methods

euler_angles_set_1 = zeros(3,length(t_1));
euler_angles_set_2 = zeros(3,length(t_2));

for i = 1:length(t_1)
    % Euler angle using Euler_derivative Integrals
    euler_angles_set_1(:,i) = euler_from_rotation(O_1(:,:,i));
    
    % Euler Angle using Poission Integral
    O(1,1) = O_2_linear(1,i);
    O(1,2) = O_2_linear(2,i);
    O(1,3) = O_2_linear(3,i);

    O(2,1) = O_2_linear(4,i);
    O(2,2) = O_2_linear(5,i);
    O(2,3) = O_2_linear(6,i);

    O(3,1) = O_2_linear(7,i);
    O(3,2) = O_2_linear(8,i);
    O(3,3) = O_2_linear(9,i);
    euler_angles_set_2(:,i) = euler_from_rotation(O);
end


%% Plotting 

%%% Plot for euler angles using part 1
fig1 = figure(1);
fig1.Position = [10 10 900 600];
ax1 = axes(fig1);

for i = 1:3
    subplot(3,1,i);
    plot(t_1, euler_angles_o(i,:));
    if i==1
        title('Euler from Euler Derivative'); 
        ax = gca;
        ax.TitleFontSizeMultiplier = 1;
    end

end

saveas(fig1,'./results/Euler_from_part1.png');

%%% Plot for Omega
fig2 = figure(2);
fig2.Position = [10 10 900 600];
ax2 = axes(fig2);

for i = 1:3
    subplot(3,1,i);
    plot(t_1, omega_D_frame(i,:));
    if i==1
        title('Omega Values'); 
        ax = gca;
        ax.TitleFontSizeMultiplier = 1;
    end

end

saveas(fig2,'./results/omega_from_part1.png');

%%% Plot for Orientation matrix using Poisson
fig3 = figure(1);
fig3.Position = [10 10 900 600];
ax3 = axes(fig3);
for i = 1:3
    for j = 1:3
        subplot(3,3,(i-1)*3+j);
        O = reshape(O_1(i,j,:), [1,length(O_1(i,j,:))]);
        plot(t_1, O);
        ith = string(i);
        jth = string(j);
        title(ith+jth);
        ax = gca;
        ax.TitleFontSizeMultiplier = 0.5;
    end
end
saveas(fig3,'./results/orientation_matrix_poission.png');


%%% Plot to compare Orientation: blue - from first part & Red from second
fig4 = figure(1);
fig4.Position = [10 10 900 600];
ax4 = axes(fig4);
for i = 1:3
    for j = 1:3
        subplot(3,3,(i-1)*3+j);
        O_a = reshape(O_1(i,j,:), [1,length(O_1(i,j,:))]);
        O_b = reshape(O_2_linear(((i-1)*3)+j,:), [1,length(O_2_linear((i-1)*3+j,:))]);
        plot(t_1, O_a, '-b',t_2, O_b, '--r');
        ith = string(i);
        jth = string(j);
        title(ith+jth);
        ax = gca;
        ax.TitleFontSizeMultiplier = 0.5;
    end
end
saveas(fig4,'./results/orientation_matrix_comapre.png');

%%% Plot to compare Euler Angles: blue - from first part & Red from second
fig5 = figure(1);
fig5.Position = [10 10 900 600];
ax5 = axes(fig5);
for j = 1:3
    subplot(3,1,j);
    plot(t_1, euler_angles_set_1(j,:), '-b',t_2, euler_angles_set_2(j,:), '--r');
    
    if j==1
        title('Euler angles: From Euler derivative - blue; From Poisson - red  '); 
        ax = gca;
        ax.TitleFontSizeMultiplier = 1;
    end
end
saveas(fig5,'./results/euler_compare.png');


