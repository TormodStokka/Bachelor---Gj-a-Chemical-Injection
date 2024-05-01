clc, close all, clear all;

time_intervals = 0:0.5:9.5; % Time from 0 to 9.5 minutes

% Test 1 results
FIT4011_kg_hr_test1 = [2.4177, 2.4215, 2.4469, 2.4470, 2.4408, 2.4408, 2.4480, 2.4561, 2.4511, 2.4239, ...
                        2.4229, 2.4244, 2.4410, 2.4600, 2.4612, 2.4477, 2.4518, 2.4610, 2.4640, 2.4490];
ExternFlowmeter_kg_hr_test1 = [2.4389, 2.4415, 2.4411, 2.4430, 2.4367, 2.4367, 2.4382, 2.4433, 2.4432, 2.4432, ...
                                2.4480, 2.4425, 2.4456, 2.4389, 2.4409, 2.4476, 2.4418, 2.4391, 2.4428, 2.4466];

% Test 2 results
FIT4011_kg_hr_test2 = [0.4989, 0.5036, 0.5005, 0.5037, 0.5018, 0.4998, 0.5039, 0.4962, 0.5018, 0.4986, ...
                        0.5016, 0.4979, 0.4971, 0.5036, 0.5008, 0.5008, 0.4993, 0.4972, 0.4983, 0.5005];
ExternFlowmeter_kg_hr_test2 = [0.5048, 0.5012, 0.5043, 0.5020, 0.5030, 0.4976, 0.4990, 0.4986, 0.4993, 0.4983, ...
                                0.5008, 0.5008, 0.4978, 0.5032, 0.5023, 0.4992, 0.5010, 0.4988, 0.5028, 0.5046];

% % Calculate the average values for each test
% average_FIT4011_test1 = mean(FIT4011_kg_hr_test1);
% average_ExternFlowmeter_test1 = mean(ExternFlowmeter_kg_hr_test1);
% average_FIT4011_test2 = mean(FIT4011_kg_hr_test2);
% average_ExternFlowmeter_test2 = mean(ExternFlowmeter_kg_hr_test2);

% Totalizer
% Test1
Totalizer_FIT4011_test1 = 0.4100 * 60/10;
Totalizer_ExternFlowmeter_test1 = 0.4090 * 60/1;
Flowglass_Test1 = 0.406 * 60/10; 
% Test2
Totalizer_FIT4011_test2 = 0.0843 * 60/10;
Totalizer_ExternFlowmeter_test2 = 0.0843 * 60/10;
Flowglass_Test2 = 0.083 * 60/10; 

% Create figure
figure;

% Subplot for Test 1
subplot(1,2,1); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4011_kg_hr_test1,'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4011');
hold on;
yline(Totalizer_FIT4011_test1,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test1, 'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test1,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test1,':', 'Color', 'blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 3 [Pump Strokelength: 50%]');
xlabel('Time [min]');
ylabel('Flow Rate [kg/hr]');
xlim([0,9.5]);
ylim([0 3]);
grid on;
legend('show');

% Subplot for Test 2
subplot(1,2,2); % Adjust to a 1x2 grid for two tests
plot(time_intervals, FIT4011_kg_hr_test2, 'LineWidth', 2, 'Marker', 'o', 'Color', 'red','DisplayName', '42FIT4011');
hold on;
yline(Totalizer_FIT4011_test2,':', 'Color', 'red', 'LineWidth', 2,'DisplayName', 'Totalizer');
plot(time_intervals, ExternFlowmeter_kg_hr_test2,'LineWidth', 2, 'Marker', 's', 'Color', 'green','DisplayName', 'External Flow meter');
yline(Totalizer_ExternFlowmeter_test2,':', 'Color', 'green', 'LineWidth', 2,'DisplayName', 'Totalizer');
yline(Flowglass_Test2,':', 'Color', 'blue', 'LineWidth', 2,'DisplayName', 'Flow-glass');
title('Deviation Test 4 [Pump Strokelength: 20%]');
xlabel('Time [min]');
ylabel('Flow Rate [kg/hr]');
xlim([0,9.5]);
ylim([0 3]);
grid on;
legend('show');

hold off;
