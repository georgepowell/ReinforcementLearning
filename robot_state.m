function state = robot_state(x, y)
% converts x y coordinates to 1-100 state
state = (x) + (y - 1) * 10;

end

