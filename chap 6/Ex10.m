function print_count(count)
    if count == 1
        fprintf('It happened 1 time.\n');
    else
        fprintf('It happened %d times.\n', count);
    end
end