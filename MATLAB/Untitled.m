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

