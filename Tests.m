% Create matrix mapping from states to actions
QNeurons = rand(100, 4);
food_map = zeros(10, 10);
food_map(10, 10) = 1;
alpha = 0.3;
epsilon = 0.7;
colormap gray;

% Create current position of robot - 1 to 100

previousAction = 1;
currentAction = 1;
previousState = 1;
currentState = 1;

times = [];

for j=1:100
    startState = 1;
    states = [startState];
    for i=1:15000
        currentAction = epsilon_greedy_policy(epsilon, QNeurons, currentState);
        [nextState, reward] = apply_action(currentState, currentAction);
        states(end + 1) = nextState;
        %QNeurons(previousState, previousAction) = QNeurons(previousState, previousAction) + alpha * (reward + QNeurons(currentState, currentAction) - QNeurons(previousState, previousAction));
        QNeurons(previousState, previousAction) = QNeurons(previousState, previousAction) + alpha * (reward + max(QNeurons(currentState, :)) - QNeurons(previousState, previousAction));
        
        if (reward == 1)
            'reward reached!'
            times(end + 1) = i;
            figure(2);
            plot(times);
            previousAction = 1;
            currentAction = 1;
            previousState = 1;
            currentState = 1;
            break;
        end
        previousState = currentState;
        currentState = nextState;
        
        previousAction = currentAction;
    end
    j
    figure(1);
    img = imagesc(reshape(max(QNeurons'), 10, 10));
    hold on;
    for i=2:length(states)
        [ x, y ] = robot_xy( states(i - 1) );
        [ x_new, y_new ] = robot_xy( states(i) );
        plot([ y, y_new], [x, x_new],'Color','r','LineWidth',2);
    end
    hold off;
    
    pause(0.1);
end
