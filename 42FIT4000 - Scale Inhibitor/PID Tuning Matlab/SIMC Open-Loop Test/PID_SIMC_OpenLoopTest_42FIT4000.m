% The SIMC(Simple Internal Model Control) Method for Smooth PID Controller Tuning based on:
% https://folk.ntnu.no/skoge/publications/2012/skogestad-improved-simc-pid/PIDbook-chapter5.pdf?fbclid=IwAR0_E26oF-JGLBJg4YnN8f9-lbr4OjpYcImEMsJ5KMJ0C9fHOw8bW-OcuYg_aem_AX_W907mEHmowXL4cj06gAafWb2LGx6Xw508TLPDScs9fNVJwcQlUK2mDPquPcNhRZ28RLNpUtklrvfR9WEffU4G

clc, close all, clear all;
grid on; s = tf('s');

% Created for 42-system on Gjøa.

%FILL IN, Don't make a bigger change then 10%.
OldSP = 45;     % Controller OUTPUT before [% Strokelength]
NewSP = 50;     % Controller OUTPUT after [% Strokelength]

%Fill in
y0          = 8.51;              % Initial measurement before test [l/hr].
yinf        = 10.64;            % Steady state measurement after test[l/hr].
delta_yinf  = abs(yinf-y0);     % The difference in measurement.

%Calculations
SP_Change   = abs(NewSP-OldSP);        % Setpoint change.
k           = delta_yinf/SP_Change;    % Process gain based on the changes.
y_tau       = 0.632*delta_yinf;        % For finding the tau point on y_axis.


tau_Y = y0 + y_tau    % tauY = 63.2% of the change made [l/hr].

%FILL IN from Step reseponse results
theta   = 19;   % 1. Time delay before change [sec]
tau     = 15;   % 2. The time it takes to reach tau_pointY_axis [sec]



% tauc = desired response time with control
% 1. choose tauc = theta for tight control
% 2. choose tauc > theta for smoother control

% Decided for slower control, without under/over shooting.
tauc = theta+30; 


% Calculate PI controller settings using SIMC rules
Kc = (1/k) * (tau/(tauc + theta)); % Controller Gain for first order system
Ti = min(tau, 4 * (tauc + theta)); % Controller Integral Time for first order system

% Display the calculated PI controller settings
disp(['P-setting: ', num2str(Kc)]);
disp(['I-setting: ', num2str(Ti)]);

% Test System with the designed PI controller
G = k * (1/(tau*s+1)) * exp(-theta * s); % Process model for first order
C = Kc * ((Ti*s + 1) / (Ti * s)); % PI Controller Series form

step(G) %Open loop response
title('Open-Loop Step Response, without controller');
% Closed-loop without controller
%clLoop =SP_Change*G
%figure, step(feedback(clLoop,1)) %Closed loop response


% Closed-loop system with PI-Controller
PI_loop = series(C, G)
closedLoop = feedback(PI_loop, 1);

% Step Response to demonstrate the system's performance
figure;
step(closedLoop);
title('Closed-Loop Step Response with SIMC Tuned PI Controller');
