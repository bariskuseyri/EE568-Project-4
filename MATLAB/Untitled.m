%% Intro
% Magnetic Loading Analysis
% EM: solid stator / 4-pole, 3-phase | NdFeB N42 grade (ur=1.05)
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>

%% Initialization

clc
clear all
close all

%% Machine Parameters

pp = 11;     % pole-pairs
p = pp*2;   % number of poles

Drotor_outer = 0.290;               % rotor diameter [m]
Rrotor_outer = Drotor_outer/2;      % rotor radius [m]
l_axial = 0.068;                    % axial length [m]
P_em = 46979;
w_rpm = 2700;
w_rad = w_rpm*(2*pi/60);
T_em = P_em/w_rad;

u_0 = 4 * pi * 1e-7;    % permeability of vacuum
u_r = 1.05;             % relative permeability of magnets
H_c = 905659;           % coercivity [A/m]
B_rem = H_c * u_0 * u_r;     % remanence flux density

lg = 0.001;     % air-gap clearance
lm = 0.004;     % magnet thickness


%% Load Line

Hm = linspace(-1100000,100000,10000);
Bm = B_rem+u_0*u_r*Hm;
LL = (-1)*(u_0)*(lm/lg)*Hm;

%% C_T Analysis

Q = [6 12 18 24 30 36 42 48 54];
p = [2 4 5 7 8 10 11 13 14 16 17 19 20];

Nc = zeros(size(Q,2)*size(p,2));
C_T = zeros(size(Q,2),size(p,2));

for i=1:size(Q,2)
    for j=1:size(p,2)
        Nc(i,j) = lcm(Q(i),2*p(j));
        C_T(i,j) = Q(i)*2*p(j)/Nc(i,j);
    end
end

Spp=min(C_T);


%% Machine Size

B_load = 0.95;
A_load = 50000*sqrt(2);
C_mec = ((pi^2)/2)*A_load*B_load;

sigma_Ftan = B_load*A_load/2;

V_rotor = T_em/(sigma_Ftan*2);

%% Machine Length to air-gap diameter

p = 2:15;
X_ratio = pi.*p.^(1/2)./(4.*p);

figure(1)
g1 = stem(2*p,X_ratio);
g1.Color = 'k';
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';
% title('Distribution Factor Amplitudes')
ylabel('{\it\chi_{ratio}}')
xlabel('{\itnumber of pole-pairs p}')
xticks(2*p)
% yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
% axis([0 22 0 1.1])
set(gcf,'units','centimeters','position',[2,5,30,6])

%% Air-gap Clearance

l_g = (0.18+0.006*(P_em^(0.4)))/1000;

%% Rotor Diameter

D_r = ((2*V_rotor/pi).*(1./X_ratio)).^(1/3);
l_axial_eff = (D_r+l_g).*X_ratio;
l_axial = l_axial_eff - 2*l_g;

