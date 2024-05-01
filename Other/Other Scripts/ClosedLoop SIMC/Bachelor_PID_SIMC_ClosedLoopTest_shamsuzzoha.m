% The Setpoint overshoot method.
% METHOD based on:
% https://folk.ntnu.no/skoge/publications/2010/shamsuzzoha_pid_jpc/original-word/Shams-Revised-August2010.pdf?fbclid=IwAR2BdZO9NDj0HRGPUIAP0pP-3Dj9U6xCtXL-8UZoVxTKhsPkag90y9f2nGo_aem_AW5EmhxqGaYiMckq1hIE5S57xbuiWNU4lzit9OW6lJizWZjAffXtEOPM3kSWv4bdzBCGWYqfu6WYEBoWREqnlQaW
% 

clc;
grid on; s = tf('s');

% 1. Switch the controller to P-only controller.
% The Kc0 doesnt matter as long as the systems osciallates sufficiently
% with an overshoot between [10,60] %.
% A OS of 30% is half of Ziegler Nichols method.

Kc0         =   4,2;      % Controller Gain   [Number 0 - xx]
y0          =   25;      % Setpoint before   [l/hr]
ys          =   30;      % Setpoint after    [l/hr]
theta       =   22;      % Delay before something happens [sec]

F = 1.05; %Detuning factor. F>1 gives smoother response robustness.

%Wait for it...
yinf        =   19.4;       % Steady State value where it settles [l/hr]
tp          =   54;         % Time till first peak      [sec]
yp          =   31.63;         % Value at first peak       [l/hr]
yu          =   9.73;         % Value at first undershoot [l/hr]

%Output variable changes
delta_ys    =   abs(ys - y0);    % Setpoint Change
delta_yp    =   abs(yp - y0);    % Peak output change (at time tp)
delta_yu    =   abs(yu - y0);    % To Undershoot from start

% Try 1.
delta_yinf  =   abs(yinf - y0);  % Steady-state output change after setpoint  step test

% Try 2. If test not finished and stabilized, use delta_yinf after first undershoot
%delta_yinf = 0.45*(delta_yp+delta_yu)



%Calculations:
overshoot   =   (delta_yp - delta_yinf)/delta_yinf; % Overshoot
b           =   delta_yinf/delta_ys; % Relative steady state output change ratio
A           =   1.152*(overshoot)^2 - 1.607*(overshoot) + 1;


% Proposed formulas:
Kc = Kc0 * A/F %Gain PI Controller
Tau_I = min(0.86 * A * abs(b/(1-b))*tp, 2.44*tp*F) %Integral time


%If tau has to be estimated:
tau = 0.86*A*(overshoot) * abs(b/(b-1)) * tp;


%Integral time
% Case(1) for processes with relativelty large delay theta
Tau_I_1 = tau;

% Case(2) for processes with relatively small delay theta, including
% integrating processes. If tau/theta < 8
Tau_C = theta;
Tau_I_2 = 8*theta;


%System covers both delay-dominant and lag-dominant (integrating) processes.
k = Kc0^-1 * abs(b/(1-b)); %Process gain estimated
G = k * (1/(tau*s+1)) * exp(-theta * s); % Process model for first order
C_PI = Kc * (1 + 1/(Tau_I*s));

% Closed-loop system with PI-Controller
loop = series(C_PI, G);
closedLoop = feedback(loop, 1);

% Step Response for the estimated process without controller
step(feedback(G,1))

% Step Response to demonstrate the system's performance with controller
%step(delta_ys*closedLoop);
step(closedLoop);
title('Closed-Loop Step Response with PI Controller')


