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

K_p = 0.5;              % filling factor

P_em = 46979;           % Power [W]
w_rpm = 2700;           % machine speed [rpm]
w_rad = w_rpm*(2*pi/60);% machine speed [rad/s]
T_em = P_em/w_rad;      % electromagnetic torque [Nm]

B_load = 0.95;          % Peak magnetic Loading [T]
A_load = 50000*sqrt(2); % Peak electric loading [A/m]
C_mec = ((pi^2)/2)*A_load*B_load;   % Specific Machine Constant

%% Machine Size
sigma_Ftan = B_load*A_load/2;       % Tan. comp. Maxwell Stress
V_rotor = T_em/(sigma_Ftan*2);      % rotor volume [m^3]
X_ratio = pi.*p.^(1/2)./(4.*p);     % eff. axial length to airgap diameter

%% Air-gap Clearance

l_g = (0.18+0.006*(P_em^(0.4)))/1000;

%% Rotor Diameter

D_r = ((4*V_rotor/pi).*(1./X_ratio)).^(1/3);

%% Stator Diameter:Wu et al

% sr = zeros(2,5);
% 
% for i = 1:size(Q,2)
%     for j = 1:size(pp,2)
%       k = pp(j)/Q(i);
%       fdr = 0.95/2.01;
%       a1 = 2*((k*pi/pp(j))*((k*pi/pp(j))+2)*(fdr^2)+2*fdr-1);
%       b1 = -3*((k*pi/pp(j))+1)*fdr;
%       sr(i,j) = (-b1-((b1^2)-4*a1)^(1/2))/(2*a1);
%     end
% end
% 
% D_s = [D_r]./sr;




%% Axial Length

l_axial_eff = (D_r+l_g).*X_ratio;
l_axial = l_axial_eff - 2*l_g;

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



%% Ni
Ni=zeros(2,5);
Ni(1,:)=A_load*pi*D_r(1,:)./Q(1);
Ni(2,:)=A_load*pi*D_r(2,:)./Q(2);

%% Other Parameters
J=3.5e6;
A_slot=Ni./(J*K_p);

tooth_width(1,:) = (pi.*(D_r(1,:)./2).^2)./Q(1);
tooth_width(2,:) = (pi.*(D_r(2,:)./2).^2)./Q(2);

S_airgap = pi.*(((D_r./2)+l_g).^2);

pi*((D_r/2+l_g+h_slot)^2) = A_slot.*Q+h_slot*tooth_width.*Q;

h_tooth = D_s-D_r-l_g;
h_backiron = tooth_width;

S_rotor = pi.*((D_r./2).^2);
S_stator = pi.*((D_s./2).^2)-pi.*((D_r./2+l_g).^2);
S_tooth = tooth_width.*h_tooth;


A_slot(1,:) = S_stator(1,:)./Q(1)-S_tooth(1,:);
A_slot(2,:) = S_stator(2,:)./Q(2)-S_tooth(2,:);

%% Stator Diameter



%% Linear Current Density

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
