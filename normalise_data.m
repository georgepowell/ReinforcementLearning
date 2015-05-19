
% normalises collums of vectors so their sizes equal 1.0
function data_out = normalise_data( data_in )

% calculate the sizes of each collum
sizes = sqrt(sum(data_in .^ 2, 1));
% store the number of collums
[x, ~] = size(data_in);
% apply normalisation
data_out = data_in ./ repmat(sizes, x, 1);

end

