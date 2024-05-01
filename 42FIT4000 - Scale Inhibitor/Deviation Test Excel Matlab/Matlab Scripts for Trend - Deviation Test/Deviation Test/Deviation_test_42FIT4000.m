clc, close all, clear all;

time_intervals = 0:1:9; % Time from 0 to 9 minutes

% Test 1 results
FIT4000_kg_hr_test1 = [20.9234, 20.9342, 21.2341, 20.7542, 20.5843, 21.4953, 20.9428, 20.8424, 21.9485, 21.5932];
ExternFlowmeter_kg_hr_test1 = [19.1234, 19.1542, 19.1432, 19.1432, 19.1543, 19.1495, 19.1535, 19.1459, 19.1525, 19.1496];

% Test 2 results
FIT4000_kg_hr_test2 = [12.4352, 11.8543, 12.3561, 12.1957, 11.8525, 12.3563, 12.1654, 11.9543, 12.1295, 12.0564];
ExternFlowmeter_kg_hr_test2 = [11.1231, 11.1351, 11.1564, 11.1153, 11.1399, 11.1274, 11.1453, 11.1642, 11.1346, 11.1265];

% Calculate the average values for each test
average_FIT4000_test1 = mean(FIT4000_kg_hr_test1);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
average_FIT4000_test2 = mean(FIT4000_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);

% Totalizer
Totalizer_FIT4000_test1 = 3.6230 * 60/10.1;
Totalizer_ExternFlowmeter_test1 = 3.2154 * 60/10.1;
Totalizer_FIT4000_test2 = 2.0410 * 60/10.1;
Totalizer_ExternFlowmeter_test2 = 1.8740 * 60/10.1;


% Create figure
figure;

% Subplot for Test 1
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4000_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4000');
hold on;
yline(Totalizer_FIT4000_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 1 [Pump Strokelength: 50%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([10 25]);
grid on;
legend('show');
% Customize and position the legend
lgd.Title.String = 'Legend';
lgd.Title.FontWeight = 'bold';

% Subplot for Test 2
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4000_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4000');
hold on;
yline(Totalizer_FIT4000_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 2 [Pump Strokelength: 35%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([10 25]);
grid on;
legend('show');
% Customize and position the legend
lgd.Title.String = 'Legend';
lgd.Title.FontWeight = 'bold';

hold off;




