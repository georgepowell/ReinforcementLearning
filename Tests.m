% Create matrix mapping from states to actions
QNeurons = rand(100, 4);

learning_rate = 0.3;
epsilon = 0.7;

colormap gray;

times = [];

for j=1:100
    
    j
    
    [num_steps, QNeurons, states]  = trial_run(1, QNeurons, epsilon, learning_rate, 'sarsa', 15000);
    
    times(end + 1) = num_steps;
    figure(2);
    plot(times);
    figure(1);
    img = imagesc(reshape(max(QNeurons'), 10, 10));
    hold on;
    for i=2:length(states)
        [ x, y ] = robot_xy( states(i - 1) );
        [ x_new, y_new ] = robot_xy( states(i) );
        plot([ y, y_new], [x, x_new], 'Color', 'r', 'LineWidth', 2);
    end
    hold off;
    
    pause(0.1);
end
