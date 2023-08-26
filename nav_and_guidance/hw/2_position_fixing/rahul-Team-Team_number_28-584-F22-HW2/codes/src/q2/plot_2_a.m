function plot_2_a(name,x1,y1,x2,y2,r1,r2,x,y)

f = figure('visible','off');
% f = figure;
th = 0:pi/50:2*pi;
xunit = r1 * cos(th) + x1;
yunit = r1 * sin(th) + y1;
plot(xunit, yunit, 'b', LineWidth=1);
hold on
th = 0:pi/50:2*pi;
xunit = r2 * cos(th) + x2;
yunit = r2 * sin(th) + y2;

plot(x1,y1,'r.', MarkerSize=10);
text(x1,y1,' C1');
plot(x2,y2,'r.', MarkerSize=10);
text(x2,y2,' C2')
plot(xunit, yunit, 'b', LineWidth=1);

plot(x,y,'r*');
grid on
axis equal
hold off
saveas(f,name,'jpg');
end