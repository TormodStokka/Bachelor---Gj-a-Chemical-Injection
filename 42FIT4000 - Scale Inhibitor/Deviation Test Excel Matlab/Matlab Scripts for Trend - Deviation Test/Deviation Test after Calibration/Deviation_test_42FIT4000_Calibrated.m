clc, clear all;

time_intervals = 0:0.5:9.5; % Time from 0 to 9.5 minutes

% Test 3 results
FIT4000_kg_hr_test3 = [19.1359, 19.1375, 19.1274, 19.1312, 19.1381, 19.1423, 19.1350, 19.1412, 19.1245, 19.1399, ...
                        19.1241, 19.1403, 19.1258, 19.1374, 19.1265, 19.1419, 19.1367, 19.1331, 19.1298, 19.1325];
ExternFlowmeter_kg_hr_test3 = [19.1534, 19.1599, 19.1518, 19.1606, 19.1527, 19.1563, 19.1532, 19.1574, 19.1581, 19.1557, ...
                                19.1546, 19.1589, 19.1592, 19.1548, 19.1554, 19.1551, 19.1559, 19.1544, 19.1575, 19.1562];

% Test 4 results
FIT4000_kg_hr_test4 = [11.1368, 11.1223, 11.1204, 11.1400, 11.1317, 11.1185, 11.1269, 11.1394, 11.1278, 11.1331, ...
                        11.1355, 11.1164, 11.1303, 11.1345, 11.1372, 11.1238, 11.1216, 11.1241, 11.1295, 11.1289];
ExternFlowmeter_kg_hr_test4 = [11.1502, 11.1426, 11.1427, 11.1418, 11.1514, 11.1486, 11.1433, 11.1446, 11.1497, 11.1467, ...
                                11.1442, 11.1461, 11.1491, 11.1443, 11.1519, 11.1463, 11.1494, 11.1487, 11.1455, 11.1453];

% Calculate the average values for each test
average_FIT4000_test3 = mean(FIT4000_kg_hr_test3);
average_ExternFlowmeter_test3 = mean(ExternFlowmeter_kg_hr_test3);
average_FIT4000_test4 = mean(FIT4000_kg_hr_test4);
average_ExternFlowmeter_test4 = mean(ExternFlowmeter_kg_hr_test4);


% Totalizer
Totalizer_FIT4000_test3 = 3.1894 * 60/10;
Totalizer_ExternFlowmeter_test3 = 3.2271 * 60/10;

Totalizer_FIT4000_test4 = 1.8704 * 60/10;
Totalizer_ExternFlowmeter_test4 = 1.8769 * 60/10;


% Create figure
figure;

% Subplot for Test 3
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4000_kg_hr_test3,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4000');
hold on;
yline(Totalizer_FIT4000_test3,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test3, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test3,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 3 [Pump Strokelength: 50%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9.5]);
ylim([10 25]);
grid on;
legend('show');

% Subplot for Test 4
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4000_kg_hr_test4, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4000');
hold on;
yline(Totalizer_FIT4000_test4,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test4,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test4,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
title('Deviation Test 4 [Pump Strokelength: 35%]');
xlabel('Time [min]', 'FontSize', 10, 'FontWeight', 'bold');
ylabel('Flow Rate [kg/hr]', 'FontSize', 10, 'FontWeight', 'bold');
xlim([0,9.5]);
ylim([10 25]);
grid on;
legend('show');

hold off;
