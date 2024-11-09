clc ;
close all
clear all ;
load drivecycle.mat
driving_cycle=drive_cycle

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--*Vehicle dynamic*--%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Rr=0.2413*2;               % Diameter of car wheel in m ;
Td=3.6*pi*Rr/30;       %Speed shaft rotation of MG2 in tr/min -> True speed in km/h


%%           %%---------------------------------%%
m=320;%;                 % Vehicle mass without ESS (kg)
g=9.81;               % Force to the gravity in m/s^2
r=0.2413;               % adius of car wheel in m;
%W=310;            % Battery massor HESS (kg)%4kg for PMSM losses
%m=W+m;
Jve=m*r^2;          %Inertia
%--------------------------------------------------------------------------
rho=1.3;                  % Air density (kg/m^3) kg/m^3
S=2.16;                     % Frontal area ...master-torque area in m^2 = vehicle width (1.8) * vehicle height (1.2)
C1= 0.0045;                  % air penetration coefficient
C0=0.008;               %Dynamic tire rolling coefficient ....coefficient of rolling resistance in curves  
Cx=0.3;                %Static tire rolling coefficient ...rolling resistance coefficient