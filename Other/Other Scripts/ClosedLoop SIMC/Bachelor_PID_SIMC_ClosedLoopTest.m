% SIMPLE INTERNAL MODEL CONTROL (SIMC) METHOD based on:
% https://folk.ntnu.no/skoge/publications/2012/skogestad-improved-simc-pid/PIDbook-chapter5.pdf?fbclid=IwAR0_E26oF-JGLBJg4YnN8f9-lbr4OjpYcImEMsJ5KMJ0C9fHOw8bW-OcuYg_aem_AX_W907mEHmowXL4cj06gAafWb2LGx6Xw508TLPDScs9fNVJwcQlUK2mDPquPcNhRZ28RLNpUtklrvfR9WEffU4G

clc, close all, clear all;
grid on; s = tf('s');

% Inputs from user or experiment
Kc0 = 5     %input('Enter controller gain Kc0: ');
ys  = 3     %input('Enter setpoint change ys: ');
tp  = 18    %input('Enter seconds to first peak tp: ');
yp  = 55    %input('Enter maximum value reach at tp overshoot, yp: ');
yu  = 45    %input('Enter minimum value reach at undershoot, yu: ');

% Calculate steady-state output change y_infinity (assuming or derived from experiment)
y_infinity = 0.45 * (yp + yu); % Example calculation, adjust based on your method

% Calculate D, B, A, and r
D = (yp - y_infinity) / y_infinity;
B = abs((ys - y_infinity) / y_infinity);
A = 1.152 * D^2 - 1.607 * D + 1;
r = 2 * A / B;

% Display calculated parameters
fprintf('D: %f\nB: %f\nA: %f\nr: %f\n', D, B, A, r);


%Generate finale k, theta and tau1

k       = 1/(Kc0*B)
theta   = tp * (0.309 + 0.209*exp(-0.61*r))
tau1    = r*theta
tauc    = theta


% Calculate PI controller settings using SIMC rules
Kc = (1/k) * (tau1/(tauc + theta)); %First order
tauI = min(tau1, 4 * (tauc + theta)); %First order

% Display the calculated PI controller settings
disp(['P-setting: ', num2str(Kc)]);
disp(['I-setting: ', num2str(tauI)]);

% Test System with the designed PI controller
G = k * (1/(tau1*s+1)) * exp(-theta * s) % Process model for first order
C = Kc * ((tauI*s + 1) / (tauI * s)); % PI Controller Series form

step(ys*G) %Open loop response
title('Open-Loop Step Response, without controller');
% Closed-loop without controller
%clLoop =SP_Change*G
%figure, step(feedback(clLoop,1)) %Closed loop response


% Closed-loop system with PI-Controller
loop = series(C, G);
closedLoop = feedback(loop, 1);

% Step Response to demonstrate the system's performance
figure;
step(ys*closedLoop);
title('Closed-Loop Step Response with SIMC Tuned PI Controller');



