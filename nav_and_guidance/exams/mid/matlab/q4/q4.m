%% Initialising variables
phi = pi/6;
r_a = [1;0;0];
r_a_dot = [0,cos(phi),sin(phi)];
O_b_a_ini = [1,           0,    0;
             0,    cos(phi), sin(phi);
             0,   -sin(phi), cos(phi);];
O_a_b_ini = (O_b_a_ini);
         
x0 = [r_a(1);r_a(2);r_a(3);
      r_a_dot(1);r_a_dot(2);r_a_dot(3);
      O_a_b_ini(1,1);O_a_b_ini(1,2);O_a_b_ini(1,3);
      O_a_b_ini(2,1);O_a_b_ini(2,2);O_a_b_ini(2,3);
      O_a_b_ini(3,1);O_a_b_ini(3,2);O_a_b_ini(3,3);];

tspan = [0 20];
options = odeset('RelTol',1e-12,'AbsTol',1e-12);
sol = ode45(@(t,x) drone_dyn(t,x),tspan,x0,options); % Integrating 4.10.10 using ode45  
t_1 = linspace(0,20,1000); % Time frame
x_total = deval(sol,t_1); % Obtaining Function for all reqired time of evaluation


plot3(x_total(1,:),x_total(2,:),x_total(3,:));

fig = figure();
subplot(3,1,1);
plot(t_1, x_total(1,:));
subplot(3,1,2);
plot(t_1, x_total(2,:));
subplot(3,1,3);
plot(t_1, x_total(3,:));

fig5 = figure();
fig5.Position = [10 10 900 600];
ax5 = axes(fig5);
for i = 1:9
    subplot(3,3,i);
    plot(t_1, x_total(6+i,:), 'b');
    ax = gca;
    ax.TitleFontSizeMultiplier = 0.5;
end
