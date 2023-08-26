function plot_2_c(name,x1,y1,x2,y2,r1,r2,sol1, sol2,xinit,yinit)

options1 = optimoptions(@fminunc,OptimalityTolerance = 1e-12);
pp = [1,1];
solmin = fminunc(@find_norm,pp ,options1);
for ii = 1:5
    yy = 0;
    for jj = 1:5
        solmin = fminunc(@find_norm, [ii,jj],options1);
        rr = (solmin-sol1)';
        rr1 = sqrt(rr'*rr);
        rr = (solmin-sol2)';
        rr2 = sqrt(rr'*rr);
        if(rr1<rr2)
            plot(xinit(ii),yinit(jj),'g*')
        else
            plot(xinit(ii),yinit(jj),'r*')
        end
    yy = yy + 1;
    end
    xx = xx + 1;
end

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
%%


%%
grid on
axis equal
hold off
saveas(fig_plot,name,'jpg');
end