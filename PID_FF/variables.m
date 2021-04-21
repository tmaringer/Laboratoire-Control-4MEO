clear all
close all

%%%%%%%%%%%%
% PARAMETERS
%%%%%%%%%%%%
MVO = 50; % [%]
DVO = 50; % [%]
PVO = 67.5; % [°C]

%MV->PV
Kp = 0.39;
T1 = 136.71;
T2 = 18.61;
theta = 2.2;

%DV->PV
Kd = 0.22;
T1d = 160.53;
T2d = 13.2;
thetad = 18.06;

offset_WP = PVO - Kp*MVO;

%%%%%%%%%%%%%%%%%%
% DISCRETE PROCESS
%%%%%%%%%%%%%%%%%%

Ts = 1;