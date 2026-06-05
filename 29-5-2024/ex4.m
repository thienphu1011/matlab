v0 = input('Enter the initial speed (v0): ');
a = input('Enter the magnitude of acceleration (a): ');
t = input('Enter the time (t): ');

v = v0 + a * t;
s = v0 * t + 0.5 * a * t^2;


disp(['Velocity after time t: ', num2str(v)]);
disp(['Position after time t: ', num2str(s)]);
