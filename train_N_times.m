function [ mean_vals, errors ] = train_N_times(epsilon, learning_rate, trial_runs, alg_config, epsilon_config, N)
% runs the training sequence N times and averages the learning curves
% to produce smooth plots with error bars
runs = [];

for i=1:N
    % train network N times, storing the learning curves 
    [~, learning_curve] = train_network(epsilon, learning_rate, trial_runs, alg_config, epsilon_config, 'dont_draw');
    plot(learning_curve);
    pause(0.1);
    runs = vertcat(runs, learning_curve);
    % print so we can see progress.
    i 
end

% Apply moving averages of 10 points.
mean_vals = mean(runs);
running_runs = filter([0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1], 1, runs);
% Use standard deviation to estimate error bars
errors = std(running_runs);
running_mean = filter([0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1 0.1], 1, mean_vals);
% Crop first 10 as they aren't valid with running mean.
running_mean =  running_mean(10:end);
errors =  errors(10:end);
% Plot results.
errorbar(running_mean, errors);

end

