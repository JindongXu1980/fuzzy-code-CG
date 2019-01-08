function out = dist_max(center, Udata)
out = zeros(size(center, 1), size(Udata, 1));

    for k = 1:size(center, 1),
	out(k, :) = max(abs(Udata-ones(size(Udata, 1), 1)*center(k, :)),[],2)';
    end

end