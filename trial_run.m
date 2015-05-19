function [num_steps, neurons, states] = trial_run(start_pos, neurons, epsilon, learning_rate, config, max_steps)
    % Runs the agents once through the space using epsilon greedy and
    % applies either sarsa with eligibility trace or q-learning without
        
    states = start_pos;
    actions = [];
    num_steps = max_steps;
    
    eligibilities = [];
    
    previousAction = 1;
    currentAction = 1;
    previousState = 1;
    currentState = start_pos;
    
    for i=1:max_steps
        % moves the agent to the next state using epsilon greedy policy
        currentAction = epsilon_greedy_policy(epsilon, neurons, currentState);
        [nextState, reward] = apply_action(currentState, currentAction);
        states(end + 1) = nextState;
        actions(end + 1) = currentAction;
        eligibilities(end + 1) = 1;
        
        % Update eligibility using learning rate
        eligibilities = eligibilities .* learning_rate;
        
        if (strcmp(config, 'sarsa'))
            end_s = length(actions);
            start_s = end_s - 15;
            
            if (start_s < 1)
                start_s = 1;
            end
            % Only use last 15 eligibilities as the rest are insignificant
            % This is a massive speed-up to efficiency
            for s=start_s:end_s
                neurons(states(s), actions(s)) = neurons(states(s), actions(s)) + eligibilities(s) * (reward + neurons(currentState, currentAction) - neurons(states(s), actions(s)));
            end
        end
        if (strcmp(config, 'qlearn'))
            neurons(previousState, previousAction) = neurons(previousState, previousAction) + learning_rate * (reward + max(neurons(currentState, :)) - neurons(previousState, previousAction));
        end
        
        % If the reward is reached we end.
        if (reward > 0)
            num_steps = i;
            break;
        end
        
        % Move forward state stores.
        previousState = currentState;
        currentState = nextState;
        previousAction = currentAction;
    end
end

