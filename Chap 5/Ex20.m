actual = exp(-1);
n = 1;
approx = (1 - 1/n)^n;
while abs(approx - actual) >= 0.0001
    n = n + 1;
    approx = (1 - 1/n)^n;
end
fprintf('Built-in e^-1: %.4f\n', actual);
fprintf('Approximation: %.4f\n', approx);
fprintf('Required n: %d\n', n);