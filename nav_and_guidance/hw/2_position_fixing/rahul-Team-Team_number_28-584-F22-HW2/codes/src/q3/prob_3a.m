%%% Problem 3
close all
clear all
clc

%% Initialise Paremeters
r1 = 2.5;
r2 = 5;
r3 = 3;
x1=0;
y1=0;
x2=5;
y2=5;
x3=2.5;
y3=0;
xx=0.7212;
yy=2.4080;

options = optimoptions(@fminunc,OptimalityTolerance = 1e-12);

for i=0:5

    fig_plot = figure('visible','off');
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

    if(i==6)
        name = '../../results/plot_3_c_1';
        
        for ii = -5:13
            for jj = -5:13
                try
                    [solmin,fval] = fminunc(@find_norm_3a,[ii,jj]',options);
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
    elseif(i==0)
        name = '../../results/plot_3_a_1';
        [sol1,fval] = fminunc(@find_norm_3a,[-2,4],options);
        plot(-2, 4,'g*')
        plot(sol1(1), sol1(2),'r*')
    elseif(i==1)
        name = '../../results/plot_3_a_2';
        jk = zeros(2,1);
        jk(1) = 6;
        jk(2) = 0;
        [sol2,fval] = fminunc(@find_norm_3a,jk,options);
        plot(6,0,'g*')
        plot(sol2(1), sol2(2),'r*')
    else
        name = '../../results/plot_3_a_4';
        
        [sol4,fval] = fminunc(@find_norm_3a,[2,0],options);
        plot(2,0,'g*')

        plot(sol4(1), sol4(2),'r*')
    end
    
    grid on
    axis equal
    hold off
    saveas(fig_plot,name,'jpg');

end
