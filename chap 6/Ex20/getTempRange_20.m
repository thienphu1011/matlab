function [minF, maxF] = getTempRange_20()
    minF = input('Enter minimum temperature (F): ');
    maxF = input('Enter maximum temperature (F): ');
    if minF > maxF
        [minF, maxF] = swap(minF, maxF);
        fprintf('Values swapped because min > max\n');
    end
    function [a, b] = swap(x, y)
        a = y;
        b = x;
    end
end