%%% Problem 3
close all
clear all
clc

%% Initialise Paremeters
global r1 r2 r3; 
r1 = 2.5;
r2 = 5;
r3 = 3;
x1=0;
y1=0;
x2=5;
y2=5;
x3=2.5;
y3=0;

fig_plot = figure('visible','off', 'Position', get(0, 'Screensize'));
th = 0:pi/50:2*pi;
xunit = r1 * cos(th) + x1;
yunit = r1 * sin(th) + y1;
plot(xunit, yunit, 'b', LineWidth=1);
hold on

xunit = r2 * cos(th) + x2;
yunit = r2 * sin(th) + y2;
plot(xunit, yunit, 'b', LineWidth=1);
xunit = r3 * cos(th) + x3;
yunit = r3 * sin(th) + y3;
plot(xunit, yunit, 'b', LineWidth=1);

plot(x1,y1,'b.', MarkerSize=10);
text(x1,y1,' C1');
plot(x2,y2,'b.', MarkerSize=10);
text(x2,y2,' C2')
plot(x3,y3,'b.', MarkerSize=10);
text(x3,y3,' C3')
jk = ones(2,1);
jk(1) = -4.0;
jk(2) = -4.0;

options = optimoptions(@fminunc,OptimalityTolerance = 1e-12);
[solorg,fval] = fminunc(@find_norm,jk, options);
name = "./results/prob_4_a";

for i=0:100
   try
        r1 = 2.5 + (rand(1)-0.5);
        r2 = 5 + (rand(1)-0.5);
        r3 = 3 + (rand(1)-0.5);
        [solmin,fval] = fminunc(@find_norm,[-4.0,-4.0],options);
        plot(solmin(1), solmin(2),'r*')
    catch
        fprintf('Inconsistent data in iteration skipped.\n');
   end
end

plot(solorg(1),solorg(2),'g*', MarkerSize=10);
    
grid on
axis equal
hold off
saveas(fig_plot,name,'jpg');
