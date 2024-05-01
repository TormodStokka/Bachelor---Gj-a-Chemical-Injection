clc, close all, clear all;

time_intervals = 0:0.5:9.5; % Time from 0 to 9.5 minutes

% Test 1 results
FIT4018_kg_hr_test1 = [1.2420, 1.2953, 1.1812, 1.2922, 1.2258, 1.2292, 1.2499, 1.3609, 1.3427, 1.3500 ...
                 1.3210, 1.3108, 1.4750, 1.3850,1.4220, 1.3750, 1.3600, 1.2612, 1.2297, 1.3950];

ExternFlowmeter_kg_hr_test1 = [1.3331, 1.3254, 1.3251, 1.3210, 1.3204, 1.3201, 1.3190, 1.3182, 1.3251, ...
                1.3253, 1.3241, 1.3203, 1.3224, 1.3245, 1.3273, 1.3283, 1.3253, 1.3250, 1.3252, 1.3267];

% Test 2 results
FIT4018_kg_hr_test2 = [6.1782, 6.1571, 6.1280, 6.0778, 6.0818, 6.1307, 6.1896, 6.2119, 6.2516, ... 
            6.2511, 6.2419, 6.1811, 6.1907, 6.1810, 6.1610, 6.1568, 6.1405, 6.0832, 6.1366, 6.1532];

ExternFlowmeter_kg_hr_test2 = [6.2010, 6.2103, 6.2065, 6.2072, 6.2009, 6.2059, 6.2096, 6.2196, ...
        6.2148, 6.2162, 6.2110, 6.2204, 6.2284, 6.2127, 6.2262, 6.2270, 6.2083, 6.2252, 6.2278, 6.2134];



% Calculate the average values for each test
average_FIT4018_test1 = mean(FIT4018_kg_hr_test1);
average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
average_FIT4018_test2 = mean(FIT4018_kg_hr_test2);
average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);


% Totalizer
Totalizer_FIT4018_test1 = 0.2134 * 60/10;
Totalizer_ExternFlowmeter_test1 = 0.2170 * 60/10;
Flowglass_Test1 = 0.215 * 60/10; % Closes instantly

Totalizer_FIT4018_test2 = 1.0229 * 60/10;
Totalizer_ExternFlowmeter_test2 = 1.0323 * 60/10;
Flowglass_Test2 = 1.032 * 60/10; % Closes instantly



% Create figure
figure;

% Subplot for Test 3
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4018_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4018');
hold on;
yline(Totalizer_FIT4018_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test1,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 3 [Pump Strokelength: 25%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 10]);
grid on;
legend('show');

% Subplot for Test 4
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4018_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4018');
hold on;
yline(Totalizer_FIT4018_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test2,':', 'Color', 'Blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 4 [Pump Strokelength: 60%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9]);
ylim([0 10]);
grid on;
legend('show');

hold off;
