clc, clear all;

time_intervals = 0:1:9; % Time from 0 to 9 minutes

% Define the time intervals and data points for Test 1
FIT4011_kg_hr = [0.9261, 0.9120, 1.1820, 1.0416, 0.9002, 0.7725, 0.8709, 1.1514, 0.8435, 0.8792];
ExternFlowmeter_kg_hr = [0.5013, 0.4988, 0.5009, 0.5010, 0.5015, 0.4979, 0.5012, 0.4977, 0.4966, 0.4922];

% Define the data points for Test 2
FIT4011_kg_hr_test2 = [4.5981, 4.6527, 4.5981, 4.7776, 4.8125, 4.5695, 4.9492, 4.8653, 4.9192, 4.9363];
ExternFlowmeter_kg_hr_test2 = [2.4529, 2.4338, 2.3818, 2.3229, 2.4162, 2.4504, 2.4532, 2.4600, 2.4480, 2.4474];

% Define the data points for Test 3
FIT4011_kg_hr_test3 = [6.1500, 6.2016, 6.1940, 6.2628, 6.2472, 6.1357, 6.1044, 6.2728, 6.3094, 6.2070];
ExternFlowmeter_kg_hr_test3 = [3.1770, 3.1202, 3.1313, 3.1344, 3.1359, 3.1141, 3.1313, 3.1157, 3.1388, 3.1378];

% Calculate the average values for each test
average_FIT4011_test1 = mean(FIT4011_kg_hr);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr);
average_FIT4011_test2 = mean(FIT4011_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);
average_FIT4011_test3 = mean(FIT4011_kg_hr_test3);
average_ExternFlowmeter_test3 = mean(ExternFlowmeter_kg_hr_test3);

% Test1
Totalizer_FIT4011_test1 = 0.1621 * 60/10;
Totalizer_ExternFlowmeter_test1 = 0.0859 * 60/10;
% Test2
Totalizer_FIT4011_test2 = 0.8022 * 60/10;
Totalizer_ExternFlowmeter_test2 = 0.4045 * 60/10;
Flowglass_Test2 = 0.403 * 60/10; 
% Test3
Totalizer_FIT4011_test3 = 1.0590 * 60/10;
Totalizer_ExternFlowmeter_test3 = 0.5310 * 60/10;
Flowglass_Test3 = 0.532 * 60/10; 


% Create figure
figure;

% Define pump stroke lengths for each test
pumpStrokeLengths = {'20%', '50%', '60%'}; % Update with actual values if needed

% Subplot for Test 1
subplot(1,3,1);
plot(time_intervals, FIT4011_kg_hr,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4011');
hold on;
yline(Totalizer_FIT4011_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr, 'LineWidth', 2, 'Marker', 'o', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'Green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 1 [Pump Strokelength: 20%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 8]);
grid on;
legend('show');
%text(5.6, -0.7, ['Pump Strokelength: ' pumpStrokeLengths{1}], 'HorizontalAlignment', 'center');

% Subplot for Test 2
subplot(1,3,2);
plot(time_intervals, FIT4011_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4011');
hold on;
yline(Totalizer_FIT4011_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 'o', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'Green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test2,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 2 [Pump Strokelength: 50%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 8]);
grid on;
legend('show');
%text(5.6, -0.7, ['Pump Strokelength: ' pumpStrokeLengths{2}], 'HorizontalAlignment', 'center');

% Subplot for Test 3
subplot(1,3,3);
plot(time_intervals, FIT4011_kg_hr_test3, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4011');
hold on;
yline(Totalizer_FIT4011_test3,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test3,'LineWidth', 2, 'Marker', 'o', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test3,':', 'Color', 'Green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test3,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 3 [Pump Strokelength: 60%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 8]);
grid on;
legend('show');
%text(5.6, -0.7, ['Pump Strokelength: ' pumpStrokeLengths{3}], 'HorizontalAlignment', 'center');

hold off;
