% 584 Final Project 
% Problem 4
% Written by Syed Aseem Ul Islam (aseemisl@umich.edu)
clc
clear all
time = 50; %seconds
Ts = 0.1;

g = 9.81; %m/s^2
umax = 40*g; %Saturation limit of nzP for optimization
global bet_dot;
% x(1)    :: VP
% x(2)    :: gammaP
% x(3)    :: hP
% x(4)    :: dP
% x(5)    :: VE
% x(6)    :: gammaE
% x(7)    :: hE
% x(8)    :: dE

jj =10;
if(jj==1)
    x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 450 ; 0 ; 10000 ; 6500 ]; %initial condition for engagement simulation
elseif(jj==2)
        x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 350 ; 0.1 ; 10000 ; 9000 ]; %initial condition for engagement simulation
elseif(jj==3)
    x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 350 ; -0.1 ; 10000 ; 8000 ]; %initial condition for engagement simulation
elseif(jj==4)
    x0_dyn = [ 450 ; 0 ; 8000 ; 0 ; 350 ; -0.1 ; 10000 ; 6000 ]; %initial condition for engagement simulation
elseif(jj==5)
    x0_dyn = [ 450 ; 0 ; 4000 ; 0 ; 350 ; 0.2 ; 6000 ; 2000 ]; %initial condition for engagement simulation 5 7
elseif(jj==6)
    x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 350 ; 0.2 ; 6000 ; 2000 ]; %initial condition for engagement simulation 7
elseif(jj==7)
    x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 400 ; 0 ; 7000 ; 5000 ]; %initial condition for engagement simulation 5 7
elseif(jj==8)
    x0_dyn = [ 450 ; 0 ; 10000 ; 0 ; 400 ; 0.0 ; 12000 ; 6000 ]; %initial condition for engagement simulation with 5 7
elseif(jj==9)
    x0_dyn = [ 450 ; 0 ; 9000 ; 0 ; 400 ; -0.1 ; 12000 ; 6000 ]; %initial condition for engagement simulation
elseif(jj==10)
    x0_dyn = [ 450 ; 0 ; 9000 ; 0 ; 320 ; -0.4 ; 12000 ; 7000 ]; %initial condition for engagement simulation
end


% Evader normal acceleration
nzE =-1*g;

% %%%%%%%%%%%%% i %%%%%%%%%%%%%%%%%
x1 = zeros(8,time/Ts);
nzP = zeros(1,time/Ts);
Rdot = zeros(1,time/Ts);

for ii = 1:time/Ts
    if ii == 1
        [~,xx]      = ode45(@(t,x)dynsim(t,x,nzE,0), [ii ii+1]*Ts , x0_dyn );
    else
        [~,xx]      = ode45(@(t,x)dynsim(t,x,nzE,nzP(ii-1)), [ii ii+1]*Ts , x1(:,ii-1) );
    end
    x1(:,ii) = xx(end,:);
    y = output( x1(:,ii) );
    
%     %%% Proportinal Guidance %%%%%%%%%%
%     nzP(:,ii) = -10*abs( y(2) )*y(3) - g*cos(x1(2,ii)) ;
    
%     %%% Proportinal Guidance %%%%%%%%%%

    %%% Custom Guidance %%%%%%%%%%
%     nzP(:,ii) = ;
    %%% Custom Guidance %%%%%%%%%%

    %%% Intersample Fuzing %%%%%%%%
    [detonate , missDistance ] = fuze( xx ); %check for fuzing conditions in intersample xx
    if detonate
        missDistance
        break
    end
    %%% Intersample Fuzing %%%%%%%%
end


strname = "case_ "+string(jj);
fig = figure(1);
p1 = plot( x1(4,1:ii)/1000  , x1(3,1:ii)/1000  , 'b' );
hold on
plot( x1(4,1)/1000  , x1(3,1)/1000  , 'bx' )
plot( x1(4,ii)/1000  , x1(3,ii)/1000  , 'bo' )
p2 = plot( x1(8,1:ii)/1000  , x1(7,1:ii)/1000  , 'r' );
plot( x1(8,1)/1000  , x1(7,1)/1000  , 'rx' )
plot( x1(8,ii)/1000  , x1(7,ii)/1000  , 'ro' )
hold off
ylimits = ylim;
xlimits = xlim;
axis equal
xlim(xlimits)
ylim([0 ylimits(2)])
legend([p1,p2],{'Pursuer','Evader'},'interpreter','latex')
ylabel('$h$ (km)','interpreter','latex')
xlabel('$d$ (km)','interpreter','latex')
title(strname);
grid on
saveas(fig,strname);


