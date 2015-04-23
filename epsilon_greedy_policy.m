function action = epsilon_greedy_policy(epsilon, neurons, state)
randomNumber = rand;
if (randomNumber > epsilon)
    action = fix(1 + rand * 4);
else
    weights = (1:100 == state) * neurons;
    [~, action] = max(weights);
end

end

