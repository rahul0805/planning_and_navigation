function dx  = dynsim(t,x,nzE,nzP)
% Computes xdot for dynamics simulation engagement.
% Written by Syed Aseem Ul Islam (aseemisl@umich.edu) 

dx = zeros(8,1);
global bet_dot;
% x(1)    :: VP
% x(2)    :: gammaP
% x(3)    :: hP
% x(4)    :: dP
% x(5)    :: VE
% x(6)    :: gammaE
% x(7)    :: hE
% x(8)    :: dE


g = 9.81; %m/s^2


SP = 2.3; %Reference area for drag calculations (pursuer)
SE = 28; %Reference area for drag calculations (evader)
mP = 130; %mass of pursuer in kg
mE = 10000; %mass of evader in kg


[ttt1, aP, ttt3, rho_p] = atmosisa(x(3)); %use Matlab function atmosisa to use ISA to compute speed of sound aP and air density rhoP at altitude hP
[ttw1, aE, ttw3, rho_e] = atmosisa(x(7)); %use Matlab function atmosisa to use ISA to compute speed of sound aE and air density  rhoE at altitude hE
[ttr1, ttr2, ttr3, rho_o] = atmosisa(0); %use Matlab function atmosisa to use ISA to air density rho0 at sea level

MiP = [0, 0.6, 0.8, 1, 1.2, 2, 3, 4, 5]; %MP data points for pursuer Cd
CdiP = [0.016, 0.016, 0.0195, 0.045, 0.039, 0.0285, 0.024, 0.0215, 0.020]; %Cd data points for pursuer Cd
CdP = pchip(MiP,CdiP,x(1)/aP); % CdP at atltitude hP and Mach MP
MiE = [0, 0.9, 1, 1.2, 1.6, 2]; %ME data points for evader Cd
CdiE = [0.0175, 0.019, 0.05, 0.045, 0.043, 0.038]; %Cd data points for evader Cd
CdE = pchip(MiE,CdiE,x(5)/aE); % CdE at atltitude hE and Mach ME
TE = (rho_e/rho_o)*(76310); %Turbofan thrust approximation for evader in N


% Thrust profile for AIM120C5 pursuer
TP =get_tp(t); %N


R = sqrt((x(3)-x(7))^2+(x(4)-x(8))^2);
fir = (x(8)-x(4))*((x(5)*sin(x(6)))-(x(1)*sin(x(2))));
sec = (x(7)-x(3))*((x(5)*cos(x(6)))-(x(1)*cos(x(2))));
Rdot = (fir+sec)/(R);
fir1 = (x(8)-x(4))*((x(5)*sin(x(6)))-(x(1)*sin(x(2))));
sec1 = (x(7)-x(3))*((x(5)*cos(x(6)))-(x(1)*cos(x(2))));
betadot = (fir1-sec1)/(R^2);

% Pursuer normal acceleration (Gravity Corrected Proportional Guidance)
% setter = 1;
nzP = (-7*abs(Rdot)*betadot) - (g*cos(x(2)));

sett = 50;
sett_beta = 10;
sett1 = 100;
sett_beta1 = 100;
lim = 2000;
val = 100;
add_thrust = 3;
if (R>lim)
    if(flag==1)
        if(((x(3)-x(7))>=val) || abs(Rdot)>sett1|| abs(betadot)>sett_beta1)
            nzP =  nzP -add_thrust;
        end
    end
    if(abs(Rdot)<sett || abs(betadot)<sett_beta)
        
    end
    
end


% Saturate pursuer normal acceleration at 40g
if abs(nzP)>40*g
    nzP = sign(nzP)*40*g;
end
% nzP = sign(nzP)*40*g;

dx(1) = ((TP-(0.5*rho_p*x(1)*x(1)*SP*CdP))/mP) - (g*sin(x(2)));
dx(2) = (-1/x(1))*(nzP + g*cos(x(2)));
dx(3) = x(1)*sin(x(2));
dx(4) = x(1)*cos(x(2));

dx(5) = ((TE-(0.5*rho_e*x(5)*x(5)*SE*CdE))/mE) - (g*sin(x(6)));
dx(6) = (-1/x(5))*(nzE + g*cos(x(6)));
dx(7) = x(5)*sin(x(6));
dx(8) = x(5)*cos(x(6));



end


function tp = get_tp(t)
if(t<10)
    tp = 11000;
elseif(t>=10 && t<30)
    tp = 1800;
elseif(t>=30)
    tp = 0;
end
end
