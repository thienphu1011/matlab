n = input('Enter an even number: ');

if mod(n, 2) == 0 && n >= 0
    f = 1;
    for i = 1:n
        f = f * i;
    end
    disp(['The factorial is: ', num2str(f)]);
else
    disp('Invalid input. Please enter a positive even number.');
end
