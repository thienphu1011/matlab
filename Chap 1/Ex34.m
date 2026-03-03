
A = 30000; 
x = 100; 
C = (A / x) * sqrt(2 / (pi * exp(1)));

% Display the result
disp(['The concentration C at x = ', num2str(x), ' meters is: ', num2str(C)])

%Experiment with a new value for x 
x = 500;
C = (A / x) * sqrt(2 / (pi * exp(1)));
disp(['The concentration C at x = ', num2str(x), ' meters is: ', num2str(C)])