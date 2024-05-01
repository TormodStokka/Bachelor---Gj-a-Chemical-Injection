clc, close all, clear all;

time_intervals = 0:1:9; % Time from 0 to 9 minutes

% Test 1 results
FIT4023_kg_hr_test1 = [6.4308, 6.4700, 7.0420, 7.3241, 7.4038, 6.9162, 6.7355, 6.2151, 6.6080, 6.8599];
ExternFlowmeter_kg_hr_test1 = [6.9000, 6.8832, 6.8945, 6.9038, 6.8858, 6.8675, 6.8658, 6.8700, 6.8656, 6.8632];

% Test 2 results
FIT4023_kg_hr_test2 = [10.0432, 10.3252, 10.3456, 9.9865, 9.7532, 9.9854, 10.4523, 9.8547, 9.8532, 10.0593];
ExternFlowmeter_kg_hr_test2 = [10.1540, 10.1640, 10.1880, 10.1760, 10.2140, 10.2350, 10.2270, 10.2240, 10.2300, 10.2200];

% Calculate the average values for each test
average_FIT4023_test1 = mean(FIT4023_kg_hr_test1);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
average_FIT4023_test2 = mean(FIT4023_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);


% test1
Totalizer_FIT4023_test1 = 1.1815 * 60/10;
Totalizer_ExternFlowmeter_test1 = 1.1919 * 60/10;
Flowglass_Test1 = 1.195 * 60/10
% test2
Totalizer_FIT4023_test2 = 1.7023 * 60/10;
Totalizer_ExternFlowmeter_test2 = 1.6889 * 60/10;


% Create figure
figure;

% Subplot for Test 1
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4023_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4023');
hold on;
yline(Totalizer_FIT4023_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test1,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 1 [Pump Strokelength: 54%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([5 12]);
grid on;
legend('show');

% Subplot for Test 2
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4023_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4023');
hold on;
yline(Totalizer_FIT4023_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 2 [Pump Strokelength: 75%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([5 12]);
grid on;
legend('show');

hold off;
