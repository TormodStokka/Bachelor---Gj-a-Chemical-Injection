clc, clear all;

% Accuracy value
TotalAccuracy = 89.65;

% Create figure
figure;

% Plot the total accuracy line
yline(TotalAccuracy, '-b', 'LineWidth', 2, 'DisplayName', '42FIT4018');

% Add threshold lines at 100% +/- 1.5%
yline(100, 'LineWidth', 1.5, 'DisplayName', 'External Flow Meter (100%)');
yline(100 + 1.5, '--r', 'LineWidth', 1.5, 'DisplayName', 'Upper Threshold (101.5%)');
yline(100 - 1.5, '--r', 'LineWidth', 1.5, 'DisplayName', 'Lower Threshold (98.5%)');

% Enhancements for better presentation
title('42FIT4018 in Comparison to the External Flow Meter');
ylabel('Percentage', 'FontSize', 12, 'FontWeight', 'bold');
xlim([0, 1]); % No actual x-axis data, so we limit to one point
ylim([0, TotalAccuracy+30]); % Set y-axis limits from 0 to 110% to include threshold lines
grid on;
legend('show', 'Location', 'southoutside', 'Orientation', 'horizontal');




hold off;
