%%% Problem 2
close all
clear all
clc

%% Initialise Paremeters
r1 = 2.5;
r2 = 5;
x1=0;
y1=0;
x2=5;
y2=5;
global h;
h.x = [];
h.fval = [];

%% Part (a)

x0 = [0,10];
options = optimoptions(@fminunc,OptimalityTolerance = 1e-12, OutputFcn=@outfun);
[sol1,fval1] = fminunc(@find_norm,x0,options);
plot_2_a('../results/prob_2a_sol1',x1,y1,x2,y2,r1,r2,sol1(1),sol1(2));
plot_2_b('../results/plot_2b_sol1',sol1,h);


h.x = [];
h.fval = [];
x0 = [10,0];
options = optimoptions(@fminunc,OptimalityTolerance = 1e-12, OutputFcn=@outfun);
[sol2,fval2] = fminunc(@find_norm,x0,options);
plot_2_a('../results/prob_2a_sol2',x1,y1,x2,y2,r1,r2,sol2(1),sol2(2))
plot_2_b('../results/plot_2b_sol2',sol2,h);


h.x = [];
h.fval = [];
%
x0 = [0,0];
options = optimoptions(@fminunc,OptimalityTolerance = 1e-12);

% sol3 = fminunc(@find_norm,x0, options);

fig_plot = figure('visible','off');
th = 0:pi/50:2*pi;
xunit = r1 * cos(th) + x1;
yunit = r1 * sin(th) + y1;
plot(xunit, yunit, 'b', LineWidth=1);
hold on
th = 0:pi/50:2*pi;
xunit = r2 * cos(th) + x2;
yunit = r2 * sin(th) + y2;

plot(x1,y1,'b.', MarkerSize=10);
text(x1,y1,' C1');
plot(x2,y2,'b.', MarkerSize=10);
text(x2,y2,' C2')
plot(xunit, yunit, 'b', LineWidth=1);
name = '../results/plot_2_c';

for ii = -5:13
    for jj = -5:13
        jk = zeros(2,1);
        jk(1) = ii;
        jk(2) = jj;
        try
            [solmin,fval] = fminunc(@find_norm,jk,options);
            rr = [(solmin(1)-sol1(1)),(solmin(2)-sol1(2))];
            rr1 = sqrt(rr*rr');
            rr = [(solmin(1)-sol2(1)),(solmin(2)-sol2(2))];
            rr2 = sqrt(rr*rr');
            if(rr1<=rr2)
                plot(ii,jj,'g*')
            else
                plot(ii,jj,'r*')
            end
        catch
            fprintf('Inconsistent data in iteration %s, skipped.\n', ii,jj);
        end
    end
end


grid on
axis equal
hold off
saveas(fig_plot,name,'jpg');
