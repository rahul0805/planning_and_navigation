r1 = 2.5;
r2 = 5;
x1=0;
y1=0;
x2=5;
y2=5;
global h;
h.x = [];
h.fval = [];

x0 = [0,10];
options = optimoptions(@fminunc,OptimalityTolerance = 1e-12, OutputFcn=@outfun);
[sol1,fval1] = fminunc(@find_norm,x0,options);


required_plot = ones(length(h.x),1);
iter = ones(length(h.x),1);
for i = 1:length(h.x)
    iter(i) = i;
    r = ones(2);
    r(1) = h.x(i,1) - sol1(1);
    r(2) = h.x(i,2) - sol1(2);
    required_plot(i) = sqrt((r(1)*r(1)) + (r(2)*r(2))); 
end

plot_2bx = figure(2);
xx = required_plot;
semilogy(iter, xx,'b','linewidth',2);
xlim([min(iter) max(iter)])
xticks(1:2:max(iter))
set(gca,'FontSize',12)
set(gca,'TickLabelInterpreter','latex');
xlabel('Iteration $i$','fontsize',18,'interpreter','latex')
ylabel('$\log_{10} (|x_{{\rm iter},i} - x_optimal|)$','fontsize',18,'interpreter','latex')
grid on
saveas(plot_2bx,file_name,"jpg")


