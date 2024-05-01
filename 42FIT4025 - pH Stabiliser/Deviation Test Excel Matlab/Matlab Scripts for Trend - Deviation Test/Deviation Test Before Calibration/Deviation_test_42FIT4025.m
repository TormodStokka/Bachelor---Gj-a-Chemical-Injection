clc, close all, clear all;

time_intervals = 0:1:9; % Time from 0 to 9 minutes

% Define the time intervals and data points for Test 1
FIT4025_kg_hr_test1 = [19.600, 19.820, 20.087, 20.114, 20.130, 19.780, 20.246, 19.200, 20.470, 20.472];
ExternFlowmeter_kg_hr_test1 = [19.711, 19.843, 20.018, 20.136, 20.220, 20.348, 20.380, 20.470, 20.574, 20.631];

% Define the data points for Test 2
FIT4025_kg_hr_test2 = [28.064, 27.884, 28.408, 27.090, 28.480, 28.600, 28.725, 28.611, 28.670, 28.590];
ExternFlowmeter_kg_hr_test2 = [28.280, 28.370, 28.460, 28.540, 28.580, 28.680, 28.690, 28.750, 28.760, 28.810];

% Calculate the average values for each test
average_FIT4025_test1 = mean(FIT4025_kg_hr_test1);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
average_FIT4025_test2 = mean(FIT4025_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);


% Totalizer
Totalizer_FIT4025_test1 = 3.3958 * 60/10.1;
Totalizer_ExternFlowmeter_test1 = 3.4205 * 60/10.1;

Totalizer_FIT4025_test2 = 4.8234 * 60/10.1;
Totalizer_ExternFlowmeter_test2 = 4.8495 * 60/10.1;


% Create figure
figure;

% Subplot for Test 1
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4025_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4025');
hold on;
yline(Totalizer_FIT4025_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 1 [Pump Strokelength: 44%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([15 35]);
grid on;
legend('show');

% Subplot for Test 2
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4025_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4025');
hold on;
yline(Totalizer_FIT4025_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 2 [Pump Strokelength: 52%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([15 35]);
grid on;
legend('show');

hold off;
