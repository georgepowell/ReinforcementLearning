function [state, reward] = apply_action(stateIn, action)
% applies an action to a given state. Returns the new state and any reward
[ x, y ] = robot_xy( stateIn );

if (action == 1 && y < 10)
	y = y + 1;
elseif (action == 2 && x < 10)
	x = x + 1;
elseif (action == 3 && y > 1)
	y = y - 1;
elseif (action == 4 && x > 1)
	x = x - 1;
elseif (action == 5)
    [state, ~] = apply_action(stateIn, 1);
    [state, reward] = apply_action(state, 2);
    return;
elseif (action == 6)
    [state, ~] = apply_action(stateIn, 1);
    [state, reward] = apply_action(state, 4);
    return;
elseif (action == 7)
    [state, ~] = apply_action(stateIn, 3);
    [state, reward] = apply_action(state, 2);
    return;
elseif (action == 8)
    [state, ~] = apply_action(stateIn, 3);
    [state, reward] = apply_action(state, 4);
    return;
end


state = robot_state(x, y);

reward = 0;
if (state == 100)
    reward = 10;
end

end

