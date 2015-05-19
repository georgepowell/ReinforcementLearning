function action = epsilon_greedy_policy(epsilon, neurons, state)

% Generates a random number 0 < x < 1 and checks if it is above epsilon.
randomNumber = rand;
if (randomNumber > epsilon)
    action = fix(1 + rand * 8); % If it is then apply random action
else
    % Otherwise choose optimal action
    weights = (1:100 == state) * neurons;
    [~, action] = max(weights);
end

end

