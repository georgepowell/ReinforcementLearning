function [state, reward] = apply_action(stateIn, action)

[ x, y ] = robot_xy( stateIn );

if (action == 1 && y < 10)
	y = y + 1;
elseif (action == 2 && x < 10)
	x = x + 1;
elseif (action == 3 && y > 1)
	y = y - 1;
elseif (action == 4 && x > 1)
	x = x - 1;
else
    reward = -1;
end

state = robot_state(x, y);

reward = 0;
if (state == 100)
    reward = 1;
end

end

