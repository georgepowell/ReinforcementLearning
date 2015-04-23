function [ x, y ] = robot_xy( state )

x = mod(state - 1, 10) + 1;
y = fix((state - 1) / 10) + 1;

end

