clc; clear all;

% Read the CSV file into a table and preserve the original column headers for the main data
ReadFlowTable = detectImportOptions("42FIT4025 Measurement Response After.csv");
ReadFlowTable.VariableNamingRule = 'preserve';
FlowTable = readtable("42FIT4025 Measurement Response After.csv", ReadFlowTable);

% Initialize arrays to store timestamps and values for the main data
timestamps = NaT(height(FlowTable), 1); % Use NaT for datetime initialization
values = zeros(height(FlowTable), 1);

% Process the flow measurement
for i = 1:height(FlowTable)
    combinedStr = FlowTable{i, 2}{1};
    parts = strsplit(combinedStr, char(160));
    dateStr = char(FlowTable{i, 1});
    timeStr = strtrim(parts{1}); % Time is the first part after splitting
    valueStr = strtrim(parts{2}); % Value is the second part after splitting

    % Handle the thousand separator if it's a comma
    valueStr = strrep(valueStr, ',', '.'); % Replace comma with dot for decimal
    
    % Create a datetime object for each timestamp
    dateTimeFormat = 'dd-MMM-yyyy HH:mm:ss.SSS';
    timestamps(i) = datetime([dateStr, ' ', timeStr], 'InputFormat', dateTimeFormat, 'Locale', 'en_US');
    
    % Convert the modified value string to a number
    values(i) = str2double(valueStr);
end

% Initialize the setpoint values with the first known setpoint
setpointValues = ones(height(FlowTable), 1) * 16.16; % The initial setpoint

% Define the times when the setpoint changes
setpointChangeTimes = {
    '02-Apr-2024 12:51:43', 20.20;
    '02-Apr-2024 17:02:29', 16.16
};

% Update the setpoint values based on the defined times
for j = 1:size(setpointChangeTimes, 1)
    changeTime = datetime(setpointChangeTimes{j, 1}, 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US');
    changeValue = setpointChangeTimes{j, 2};
    setpointValues(timestamps >= changeTime) = changeValue;
end

% Calculate the highest value, lowest value, and average value
highestValue = max(values);
lowestValue = min(values);
averageValue = mean(values);

% Print the results to Console
%fprintf('Highest Value: %.2f l/hr\n', highestValue);
%fprintf('Lowest Value: %.2f l/hr\n', lowestValue);
%fprintf('Average Value: %.2f l/hr\n', averageValue);

% Plot the data
figure;
plot(timestamps, values, '-', 'LineWidth', 1, 'DisplayName', '42FIT4025 Flow [l/hr]');
hold on; % Keep the plot for additional lines
plot(timestamps, setpointValues, '--r', 'LineWidth', 2, 'DisplayName', 'Setpoint [l/hr]');
hold on; % Keep the plot for additional lines
plot(timestamps, setpointValues*1.02, '--black', 'LineWidth', 0.5, 'DisplayName', 'Errorband +2%');
hold on;
plot(timestamps, setpointValues*0.98, '--black', 'LineWidth', 0.5, 'DisplayName', 'Errorband -2%');

% Loop through setpoint change times to add vertical lines on the plot
for idx = 1:size(setpointChangeTimes, 1)
    changeTime = datetime(setpointChangeTimes{idx, 1}, 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US');
    xline(changeTime, '--r', 'LineWidth', 1, 'DisplayName', ['Setpoint change to ' num2str(setpointChangeTimes{idx, 2}) ' l/hr']); % Magenta line for setpoint change
    hold on;
end

%Calculate time constants of the change
%Timeconstant 1 after setpoint change 1
changeSetpoint1 = abs(16.16-20.2);
timeConstant1 = 0.632*changeSetpoint1 + 16.16

%Timeconstant 2 after setpoint change 2
changeSetpoint2 = abs(20.2-16.16);
timeConstant2 = 20.2 - 0.632*changeSetpoint2

% Define timestamps for when the time constants are relevant
timeConstant1Timestamp = datetime('02-Apr-2024 12:53:58', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US'); 
timeConstant2Timestamp = datetime('02-Apr-2024 17:03:42', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US'); 

% Plot the time constants on the graph
plot(timeConstant1Timestamp, timeConstant1, '*', 'MarkerSize', 10, 'MarkerEdgeColor', 'yellow', 'DisplayName', 'Time Constant 1');
plot(timeConstant2Timestamp, timeConstant2, '*', 'MarkerSize', 10, 'MarkerEdgeColor', 'green', 'DisplayName', 'Time Constant 2');





% Add specific time xlines and exclude from legend
xline(datetime('02-Apr-2024 12:54:57', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US'), '--m', 'LineWidth', 1, 'DisplayName', 'Specific Time 14:07:51', 'HandleVisibility', 'off');
xline(datetime('02-Apr-2024 17:05:47', 'InputFormat', 'dd-MMM-yyyy HH:mm:ss', 'Locale', 'en_US'), '--m', 'LineWidth', 1, 'DisplayName', 'Specific Time 14:07:51', 'HandleVisibility', 'off');

% Customize and position the legend
lgd = legend('Location', 'northeast', 'FontSize', 12);
lgd.Title.String = 'Legend';
lgd.Title.FontWeight = 'bold';

% Enhance visuals
title('42FIT4025 Flow and Setpoint Over Time, after changes','FontSize', 14, 'FontWeight', 'bold');
xlabel('Time', 'FontSize', 14, 'FontWeight', 'bold');
ylabel('Flow [l/hr]', 'FontSize', 14, 'FontWeight', 'bold');
xlim([min(timestamps) max(timestamps)]);
grid on;

% Set y-axis limits based on values and setpoints with padding
yPadding = (max([values; setpointValues]) - min([values; setpointValues])) * 0.10;
ylim([min([values; setpointValues]) - yPadding, max([values; setpointValues]) + yPadding]);

% Text string with the desired information
% infoText = sprintf(['Highest Value: %.2f l/hr\n', ...
%     'Lowest Value: %.2f l/hr\n', ...
%     'Damping: 10 sec'], ...
%     highestValue, lowestValue);

% Text box in the upper left corner with information
% annotation('textbox', [0.16, 0.62, 0.12, 0.3], 'String', infoText, ...
%     'FontSize', 10, 'FontWeight', 'bold', 'LineStyle', 'none', 'HorizontalAlignment', 'left', ...
%     'VerticalAlignment', 'top');

hold off;
