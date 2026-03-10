function n = get_integer()
    while true
        n_input = input('Enter an integer value: ', 's');
        n = str2double(n_input);
        if ~isnan(n) && mod(n, 1) == 0
            break; 
        else
            disp('Error: Invalid input. Please ensure you enter a whole number.');
        end
    end
end