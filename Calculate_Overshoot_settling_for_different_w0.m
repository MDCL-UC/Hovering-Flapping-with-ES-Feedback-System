% clear all
clc ;
close all

z_0=0.1;

t=out.tout;
z_PID=out.PID_z;
z_ESC=out.ESC_z;


% Compute step response characteristics using stepinfo
% Set the reference value to 0 (since we shifted the response)
pid_info = stepinfo(z_PID, t, 'SettlingTimeThreshold', 0.02);
esc_info = stepinfo(z_ESC, t, 'SettlingTimeThreshold', 0.02);

% Extract overshoot and settling time
overshoot_PID = pid_info.Overshoot; % Percentage overshoot
settlingTime_PID = pid_info.SettlingTime; % Settling time (2% threshold)

overshoot_ESC = esc_info.Overshoot; % Percentage overshoot
settlingTime_ESC = esc_info.SettlingTime; % Settling time (2% threshold)

% Display results
fprintf('PID Controller:\n');
fprintf('Overshoot: %.2f%%\n', overshoot_PID);
fprintf('Settling Time: %.2f seconds\n\n', settlingTime_PID);

fprintf('ESC Controller:\n');
fprintf('Overshoot: %.2f%%\n', overshoot_ESC);
fprintf('Settling Time: %.2f seconds\n', settlingTime_ESC);

% Optional: Plot the responses for visualization
figure;
plot(t, z_PID, 'b-', 'LineWidth', 1.5, 'DisplayName', 'PID');
hold on;
plot(t, z_ESC, 'r--', 'LineWidth', 1.5, 'DisplayName', 'ESC');
plot(t, z_0 * ones(size(t)), 'k--', 'LineWidth', 1, 'DisplayName', 'Steady State (0.1)');
xlabel('Time (s)');
ylabel('z Response');
title('PID vs ESC Response');
legend('show');
grid on;
hold off;