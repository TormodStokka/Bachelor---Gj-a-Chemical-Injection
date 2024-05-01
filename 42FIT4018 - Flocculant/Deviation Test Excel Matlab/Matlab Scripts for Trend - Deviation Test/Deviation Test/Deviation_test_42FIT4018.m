clc, close all, clear all;

time_intervals = 0:1:9; % Time from 0 to 9 minutes

% Test 1 results
FIT4018_kg_hr_test1 = [1.5657, 1.5592, 1.5338, 1.4025, 1.6742, 1.5360, 1.5320, 1.5271, 1.4809, 1.6453];
ExternFlowmeter_kg_hr_test1 = [1.7435, 1.7438, 1.7785, 1.7777, 1.7799, 1.7123, 1.7781, 1.7733, 1.7772, 1.7850];

% Test 2 results
FIT4018_kg_hr_test2 = [6.8252, 6.7081, 6.7629, 6.6409, 6.6708, 6.7098, 6.7246, 6.6630, 6.7123, 6.7452];
ExternFlowmeter_kg_hr_test2 = [7.6042, 7.6211, 7.6316, 7.6130, 7.6158, 7.6054, 7.5997, 7.6097, 7.6017, 7.6311];

% Calculate the average values for each test
average_FIT4018_test1 = mean(FIT4018_kg_hr_test1);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
average_FIT4018_test2 = mean(FIT4018_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);


% Totalizer
Totalizer_FIT4018_test1 = 0.2609 * 60/10;
Totalizer_ExternFlowmeter_test1 = 0.2929 * 60/10;
Flowglass_Test1 = 0.291 * 60/10; % Closes instantly

Totalizer_FIT4018_test2 = 1.1833 * 60/10;
Totalizer_ExternFlowmeter_test2 = 1.2623 * 60/10;
Flowglass_Test2 = 1.267 * 60/10; % Closes instantly

% Create figure
figure;

% Subplot for Test 1
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4018_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4018');
hold on;
yline(Totalizer_FIT4018_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test1,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 1 [Pump Strokelength: 20%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 10]);
grid on;
legend('show');

% Subplot for Test 2
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4018_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4018');
hold on;
yline(Totalizer_FIT4018_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test2,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 2 [Pump Strokelength: 70%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 10]);
grid on;
legend('show');

hold off;
