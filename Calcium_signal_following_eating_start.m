%% Store "time" and "z" as "time_Z"
% Define the time span
time_lapse = linspace(-59.99, 59.99, 5999)'; % Uniform time span
% Obtain time series data
time = time_Z(:, 1); % Suppose the time series is in the first column of the data matrix.
%% Calculate "eating_start"
% Find the most recent time point that is closest to "eating_start"
diff = abs(bsxfun(@minus, time, eating_start'));
[~, I] = min(diff);
I = I';
eating_start_new = time(I, :);
% Extract the data related to the "eating_start" event
eating_start_time_Z = [];
for i = eating_start_new'
x = find((time > (i - 59.99)) & (time < (i + 59.99)));
event = time_Z(x, :);
eating_start_time_Z = [eating_start_time_Z, event];
end
eating_start_Z = eating_start_time_Z(:, [2:2:end]);
mean_eating_start_Z= mean(eating_start_Z,2); 

%% Plot the signals for each trial
clf;
plot(time_lapse, eating_start_Z, 'Color', [0.85 0.85 0.85]);
hold on
plot(time_lapse, mean_eating_start_Z, 'Color', [0.2, 0.6, 0.8], 'LineWidth', 2, 'LineStyle', '-'); 
x_line_position = 0; 
line([x_line_position x_line_position], [-60 80], 'Color', [0.2, 0.6, 0.8], 'LineStyle', '--', 'LineWidth', 1);
% Add legends, labels, etc.
ylim([-3, 3]);
xlim([-60, 60]);
set(gca, 'FontSize', 20);
xlabel('Time(s)', 'FontSize', 20);
ylabel('Z score', 'FontSize', 20);
title('Calcium signal following eating start','FontSize', 10);
saveas(gcf, 'Calcium signal following eating start individual.svg')
saveas(gcf, 'Calcium signal following eating start individual.tiff')
saveas(gcf, 'Calcium signal following eating start individual.png');

%% Generated graph "eating_start_Z": Mean and standard error (SEM) line graph
mean_eating_start_Z= mean(eating_start_Z');
stdError_eating_start_Z= std(eating_start_Z') / sqrt(size(eating_start_Z', 1));
mean_color = [0.9, 0.4, 0.4]; 
clf;
plot(time_lapse, mean_eating_start_Z', 'r', 'LineWidth', 2); hold on; %Plot the average signal. 
fill([time_lapse', fliplr(time_lapse')], ...
     [mean_eating_start_Z + stdError_eating_start_Z, fliplr(mean_eating_start_Z - stdError_eating_start_Z)], ...
     'r', 'FaceAlpha', 0.25, 'EdgeColor', 'none');
x_line_position = 0;
line([x_line_position x_line_position], [-50 50], 'Color', mean_color, 'LineStyle', '--', 'LineWidth', 1);

% Add legends, labels, etc.
xlabel('Time(s)');
ylabel('Z score');
title('Calcium signal following eating start');
ylim([-3, 3]);
xlim([-60, 60]);
set(gca, 'FontSize', 15);
hold off;
saveas(gcf, 'Calcium signal following eating start.svg')
saveas(gcf, 'Calcium signal following eating start.tiff')
saveas(gcf, 'Calcium signal following eating start.png');
 
