function [ x, y ] = robot_xy( state )
% converts 1-100 state into x y coordinates
x = mod(state - 1, 10) + 1;
y = fix((state - 1) / 10) + 1;

end

