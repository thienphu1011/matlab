x = input('Enter an integer: ');

if mod(x, 3) == 0 && mod(x, 5) == 0
    disp('FizzBuzz');
elseif mod(x, 3) == 0
    disp('Fizz');
elseif mod(x, 5) == 0
    disp('Buzz');
else
    disp(x);
end
