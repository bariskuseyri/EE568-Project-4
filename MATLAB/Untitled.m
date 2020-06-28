%% Intro
% Magnetic Loading Analysis
% EM: solid stator / 4-pole, 3-phase | NdFeB N42 grade (ur=1.05)
% Author: Baris Kuseyri <baris.kuseyri@metu.edu.tr>

%% Initialization

clc
clear all
close all

%% Machine Parameters

Q = [18 24];            % number of slots
pp = [8 10 11 13 14; 8 10 11 13 14];    % pole-pairs
p = pp*2;               % number of poles
k_w = [0.945 0.945 0.902 0.735 0.617; 0.866 0.966 0.958 0.958 0.966];

B_r = 1.17;
H_c = 867000;
u = B_r/H_c;
u_0 = 4*pi*10^(-7);
u_r= u/u_0;

K_p = 0.5;              % filling factor

P_em = 46979;           % Power [W]
w_rpm = 2700;           % machine speed [rpm]
w_rad = w_rpm*(2*pi/60);% machine speed [rad/s]
f_mech = w_rad/(2*pi);  % mechanical frequency [1/s]
f_elec = f_mech*pp;     % electrical frequency [1/s]
T_em = P_em/w_rad;      % electromagnetic torque [Nm]

B_load = 0.95;          % Peak magnetic Loading [T]
A_load = 50000*sqrt(2); % Peak electric loading [A/m]
C_mec = ((pi^2)/2)*A_load*B_load.*k_w;   % Specific Machine Constant

%% Machine Size
sigma_Ftan = B_load*A_load/2;       % Tan. comp. Maxwell Stress
V_rotor = T_em/(sigma_Ftan*2);      % rotor volume [m^3]
X_ratio = pi.*p.^(1/2)./(4.*p);     % eff. axial length to airgap diameter

%% Air-gap Clearance

l_g = (0.18+0.006*(P_em^(0.4)))/1000;

%% Rotor Diameter

D_r = ((4*V_rotor/pi).*(1./X_ratio)).^(1/3);

%% Stator Diameter:Wu et al
B_gmax = 0.95;          % Maximum airgap flux density
B_g = ((3*sqrt(3))/(2*pi))*B_gmax;  % (1/sqrt(2))((3*sqrt(3))/(2*pi))
sr = zeros(2,5);        % Initializing the split ratio matrix
fdr = B_g/2.01;        % fdr: flux density ratio: Bg/Bmax

% Bmax is the maximum flux density in the stator lamination accounting for
% the magnetic saturation, which is usually chosen around the knee point of
% lamination steel BH curve on open-circuit.
% For AK-steel DI-MAX M-15 FP, Bmax= 2.01T

for i = 1:size(Q,2)
    for j = 1:size(pp,2)
      k = pp(j)/Q(i);
      a1 = 2*((k*pi/pp(j))*((k*pi/pp(j))+2)*(fdr^2)+2*fdr-1);
      b1 = -3*((k*pi/pp(j))+1)*fdr;
      sr(i,j) = (-b1-((b1^2)-4*a1)^(1/2))/(2*a1);
    end
end

D_so = [D_r]./sr;
D_si = [D_r]+2*l_g;


%% Axial Length

l_axial_eff = (D_r+l_g).*X_ratio;
l_axial = l_axial_eff - 2*l_g;

%% Ni
Ni=zeros(2,5);
Ni(1,:)=A_load*pi*D_r(1,:)./Q(1);
Ni(2,:)=A_load*pi*D_r(2,:)./Q(2);

%% Other Parameters

tooth_width(1,:) = (2*pi.*(D_r(1,:)./2))./(2*Q(1));
tooth_width(2,:) = (2*pi.*(D_r(2,:)./2))./(2*Q(2));
h_backiron = tooth_width;

S_airgap = pi.*(((D_r./2)+l_g).^2);

h_tooth = (D_so-D_r-2*l_g-2*h_backiron)./2;
h_slot = (D_so-D_si-2*h_backiron)./2;

S_rotor = pi.*((D_r./2).^2);
S_stator = pi.*((D_so./2).^2)-pi.*((D_r./2+l_g).^2);
S_tooth = tooth_width.*h_tooth;


A_slot(1,:) = S_stator(1,:)./Q(1)-S_tooth(1,:);
A_slot(2,:) = S_stator(2,:)./Q(2)-S_tooth(2,:);

slot_width_outer(1,:) = (pi.*(D_so(1,:)-2*h_backiron(1,:))./Q(1))-tooth_width(1,:);
slot_width_outer(2,:) = (pi.*(D_so(1,:)-2*h_backiron(1,:))./Q(2))-tooth_width(2,:);

%% Linear Current Density
J=Ni./(A_slot.*K_p);

%% d ratio

d = D_si./(D_si+h_slot);


%% Cogging Torque Analysis

Nc = zeros(size(Q,2)*size(p,2));
C_T = zeros(size(Q,2),size(p,2));

for i=1:size(Q,2)
    for j=1:size(p,2)
        Nc(i,j) = lcm(Q(i),2*p(j));
        C_T(i,j) = Q(i)*2*p(j)/Nc(i,j);
    end
end

Spp=min(C_T);
%% Figures
% 
% figure(1)       % X_ratio to pole number
% g1 = stem(2*p,X_ratio);
% g1.Color = 'k';
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% % title('Distribution Factor Amplitudes')
% ylabel('{\it\chi_{ratio}}')
% xlabel('{\itnumber of pole-pairs p}')
% axis([14 30 0 0.5])
% xticks(2*p)
% % yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
% % axis([0 22 0 1.1])
% % set(gcf,'units','centimeters','position',[2,5,30,6])
% 
% figure(1)
% g1 = stem(2*p,X_ratio);
% g1.Color = 'k';
% ax = gca;
% ax.XGrid = 'off';
% ax.YGrid = 'on';
% % title('Distribution Factor Amplitudes')
% ylabel('{\it\chi_{ratio}}')
% xlabel('{\itnumber of pole-pairs p}')
% axis([14 30 0 0.5])
% xticks(2*p)
% % yticks([0 0.1 0.2 0.3 0.4 0.5 0.6 0.7 0.8 0.9 1.0])
% % axis([0 22 0 1.1])
% % set(gcf,'units','centimeters','position',[2,5,30,6])


%% Magnetic Circuit

magnet_arc = (2*pi)*(1/2)*(6/10)./p;
magnet_width = 2.*((D_r./2)-0.004).*sin(magnet_arc);


l_m=(B_load*l_g*u_r)/(B_r-B_load);

%% Cogging Torque

T_cogg = [2.53194 0.55637 2.42117 0.90783 0.85279; 17.4812 3.7297 0.68872 0.10482 4.77034];
B_gap_real = [0.95436 0.94957 0.95353 0.94894 0.94773; 0.95240 0.95191 0.95023 0.94801 0.94818];
T_cogg_norm = (T_cogg./B_gap_real).*0.95;

figure(1)
g1 = bar(p(1,:),T_cogg_norm);
colormap(summer(n));
ax = gca;
ax.XGrid = 'off';
ax.YGrid = 'on';

% ,'FaceColor','w','EdgeColor','k'
xtips1 = g1(1).XEndPoints;
ytips1 = g1(1).YEndPoints;
labels1 = string(g1(1).YData);
text(xtips1,ytips1,labels1,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')
xtips2 = g1(2).XEndPoints;
ytips2 = g1(2).YEndPoints;
labels2 = string(g1(2).YData);
text(xtips2,ytips2,labels2,'HorizontalAlignment','center',...
    'VerticalAlignment','bottom')

ylabel('{\itCogging Torque: T_{cogg} [Nm]}')
xlabel('{\itnumber of poles: 2p}')
l = cell(1,2);
l{1}='L'; l{2}='B'; 
legend(g1,l);