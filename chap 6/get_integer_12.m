function n = get_integer_12()
    while true
        n = input('Enter an integer: ');    
        if isscalar(n) && isnumeric(n) && n == floor(n)
            break;
        else
            disp('Error: Please enter an integer!');
        end
    end
end