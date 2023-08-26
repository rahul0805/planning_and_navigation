function plot_2_b(file_name,sol_needed,h)


required_plot = ones(length(h.x),1);
iter = ones(length(h.x),1);
for i = 1:length(h.x)
    iter(i) = i;
    r = ones(2);
    r(1) = h.x(i,1) - sol_needed(1);
    r(2) = h.x(i,2) - sol_needed(2);
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

end